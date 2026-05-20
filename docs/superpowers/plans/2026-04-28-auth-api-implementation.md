# Auth API Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build production-oriented auth endpoints in the existing NestJS backend for register, login, refresh, logout, and current-user lookup using PostgreSQL, Prisma, JWT, and refresh-token rotation.

**Architecture:** Add Prisma-backed persistence and a focused `auth` module on top of the current NestJS scaffold. Keep `AppModule` as the composition root, store hashed refresh tokens in a separate table, and drive implementation through failing E2E tests first before adding the minimal code to pass.

**Tech Stack:** NestJS, TypeScript, PostgreSQL, Prisma, Jest, Supertest, class-validator, class-transformer, JWT, bcrypt

---

## File map

### New files
- `backend/prisma/schema.prisma` — Prisma schema for `User`, `RefreshToken`, and the `Gender` enum.
- `backend/prisma/migrations/<timestamp>_init_auth/migration.sql` — initial auth schema migration.
- `backend/src/prisma/prisma.module.ts` — Prisma module export.
- `backend/src/prisma/prisma.service.ts` — Prisma client service with Nest lifecycle hook.
- `backend/src/auth/auth.module.ts` — auth module wiring.
- `backend/src/auth/auth.controller.ts` — auth endpoints.
- `backend/src/auth/auth.service.ts` — auth business logic.
- `backend/src/auth/dto/register.dto.ts` — register payload validation.
- `backend/src/auth/dto/login.dto.ts` — login payload validation.
- `backend/src/auth/dto/refresh-token.dto.ts` — refresh payload validation.
- `backend/src/auth/dto/logout.dto.ts` — logout payload validation.
- `backend/src/auth/types/jwt-payload.type.ts` — typed access/refresh token payloads.
- `backend/src/auth/types/auth-user-response.type.ts` — typed response-safe user shape.
- `backend/src/common/guards/jwt-auth.guard.ts` — access-token guard.
- `backend/src/common/decorators/current-user.decorator.ts` — current user payload extractor.
- `backend/src/auth/auth.e2e-spec.ts` — auth E2E coverage.
- `backend/.env.example` — required runtime env vars.

### Modified files
- `backend/package.json` — add Prisma, JWT, validation, and hashing dependencies and Prisma scripts.
- `backend/src/app.module.ts` — import Prisma/Auth modules and JWT module config.
- `backend/src/main.ts` — enable global validation pipe.
- `backend/test/app.e2e-spec.ts` — keep root health test or trim if duplicated by new auth test harness.
- `backend/.gitignore` — ensure env and Prisma artifacts are handled correctly if missing or incomplete.

### Generated files
- `backend/src/generated/prisma/...` or default Prisma client output depending on chosen config.

---

### Task 1: Add backend dependencies and environment contract

**Files:**
- Modify: `backend/package.json`
- Create: `backend/.env.example`

- [ ] **Step 1: Write the failing test expectation as a dependency smoke check note**

```ts
// Dependency target checklist for this task:
// - @prisma/client
// - prisma
// - @nestjs/jwt
// - @nestjs/config
// - passport
// - passport-jwt
// - bcrypt
// - class-validator
// - class-transformer
```

- [ ] **Step 2: Verify the packages are not present yet**

Run:
```bash
node -e "const p=require('./package.json'); console.log(Object.keys({...p.dependencies,...p.devDependencies}).filter(x=>['@prisma/client','prisma','@nestjs/jwt','@nestjs/config','passport','passport-jwt','bcrypt','class-validator','class-transformer'].includes(x)))"
```
Expected: `[]`

- [ ] **Step 3: Update `backend/package.json` with required dependencies and scripts**

```json
{
  "scripts": {
    "prisma:generate": "prisma generate",
    "prisma:migrate:dev": "prisma migrate dev",
    "prisma:migrate:deploy": "prisma migrate deploy"
  },
  "dependencies": {
    "@nestjs/common": "^11.0.1",
    "@nestjs/config": "^4.0.2",
    "@nestjs/core": "^11.0.1",
    "@nestjs/jwt": "^11.0.0",
    "@nestjs/platform-express": "^11.0.1",
    "@prisma/client": "^6.7.0",
    "bcrypt": "^5.1.1",
    "class-transformer": "^0.5.1",
    "class-validator": "^0.14.2",
    "passport": "^0.7.0",
    "passport-jwt": "^4.0.1",
    "reflect-metadata": "^0.2.2",
    "rxjs": "^7.8.1"
  },
  "devDependencies": {
    "prisma": "^6.7.0"
  }
}
```

- [ ] **Step 4: Create `backend/.env.example`**

```env
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/forgeai_auth?schema=public"
JWT_ACCESS_SECRET="change-me-access-secret"
JWT_REFRESH_SECRET="change-me-refresh-secret"
JWT_ACCESS_EXPIRES_IN="15m"
JWT_REFRESH_EXPIRES_IN="7d"
```

- [ ] **Step 5: Install dependencies and verify package resolution**

Run:
```bash
npm install
```
Expected: install completes without missing-peer or resolution failure.

- [ ] **Step 6: Commit**

```bash
git add backend/package.json backend/package-lock.json backend/.env.example
git commit -m "chore(backend): add auth and prisma dependencies"
```

---

### Task 2: Add Prisma schema for users and refresh tokens

**Files:**
- Create: `backend/prisma/schema.prisma`
- Test: `backend/prisma/schema.prisma` validated by Prisma generate

- [ ] **Step 1: Write the failing schema validation target**

```prisma
// Required models for this task:
// enum Gender { male female }
// model User { ... }
// model RefreshToken { ... }
```

- [ ] **Step 2: Run Prisma generate to confirm schema does not exist yet**

Run:
```bash
npx prisma generate --schema prisma/schema.prisma
```
Expected: FAIL with file-not-found or schema-not-found error.

- [ ] **Step 3: Create `backend/prisma/schema.prisma`**

```prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

enum Gender {
  male
  female
}

model User {
  id            String         @id @default(uuid())
  fullName      String
  email         String         @unique
  passwordHash  String
  gender        Gender
  dateOfBirth   DateTime
  createdAt     DateTime       @default(now())
  updatedAt     DateTime       @updatedAt
  refreshTokens RefreshToken[]
}

model RefreshToken {
  id         String    @id @default(uuid())
  userId     String
  tokenHash  String
  expiresAt  DateTime
  revokedAt  DateTime?
  createdAt  DateTime  @default(now())
  user       User      @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId])
  @@index([expiresAt])
}
```

- [ ] **Step 4: Run Prisma generate to verify schema passes**

Run:
```bash
npx prisma generate --schema prisma/schema.prisma
```
Expected: PASS with Prisma client generated.

- [ ] **Step 5: Commit**

```bash
git add backend/prisma/schema.prisma
git commit -m "feat(backend): define auth prisma schema"
```

---

### Task 3: Create the initial database migration

**Files:**
- Modify: `backend/prisma/schema.prisma`
- Create: `backend/prisma/migrations/<timestamp>_init_auth/migration.sql`

- [ ] **Step 1: Verify local database connectivity before migration**

Run:
```bash
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/forgeai_auth?schema=public" npx prisma db execute --stdin --schema prisma/schema.prisma <<'EOF'
SELECT 1;
EOF
```
Expected: PASS with successful SQL execution.

- [ ] **Step 2: Run migration generation to create the failing/first DB artifact**

Run:
```bash
npm run prisma:migrate:dev -- --name init_auth
```
Expected: PASS and migration folder created.

- [ ] **Step 3: Verify generated SQL includes both tables and enum**

```sql
-- expected key statements inside migration.sql
CREATE TYPE "Gender" AS ENUM ('male', 'female');
CREATE TABLE "User" (
  "id" TEXT NOT NULL,
  "fullName" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "passwordHash" TEXT NOT NULL,
  "gender" "Gender" NOT NULL,
  "dateOfBirth" TIMESTAMP(3) NOT NULL,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "RefreshToken" (
  "id" TEXT NOT NULL,
  "userId" TEXT NOT NULL,
  "tokenHash" TEXT NOT NULL,
  "expiresAt" TIMESTAMP(3) NOT NULL,
  "revokedAt" TIMESTAMP(3),
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "RefreshToken_pkey" PRIMARY KEY ("id")
);
```

- [ ] **Step 4: Re-run Prisma generate to verify client stays in sync**

Run:
```bash
npm run prisma:generate
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/prisma backend/package-lock.json
git commit -m "feat(backend): add auth database migration"
```

---

### Task 4: Add Prisma service and module

**Files:**
- Create: `backend/src/prisma/prisma.service.ts`
- Create: `backend/src/prisma/prisma.module.ts`
- Modify: `backend/src/app.module.ts`
- Test: `backend/src/app.module.ts`

- [ ] **Step 1: Write the failing module wiring expectation**

```ts
// app.module.ts must import PrismaModule before auth is added.
// PrismaService must extend PrismaClient and connect on module init.
```

- [ ] **Step 2: Run backend build to confirm Prisma wiring is missing**

Run:
```bash
npm run build
```
Expected: PASS currently, but no Prisma module exists.

- [ ] **Step 3: Create `backend/src/prisma/prisma.service.ts`**

```ts
import { INestApplication, Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect();
  }

  async enableShutdownHooks(app: INestApplication) {
    this.$on('beforeExit', async () => {
      await app.close();
    });
  }
}
```

- [ ] **Step 4: Create `backend/src/prisma/prisma.module.ts`**

```ts
import { Global, Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Global()
@Module({
  providers: [PrismaService],
  exports: [PrismaService],
})
export class PrismaModule {}
```

- [ ] **Step 5: Update `backend/src/app.module.ts`**

```ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

- [ ] **Step 6: Run build to verify Prisma wiring passes**

Run:
```bash
npm run build
```
Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add backend/src/prisma backend/src/app.module.ts
git commit -m "feat(backend): add prisma module"
```

---

### Task 5: Add global validation pipe and DTO skeletons

**Files:**
- Modify: `backend/src/main.ts`
- Create: `backend/src/auth/dto/register.dto.ts`
- Create: `backend/src/auth/dto/login.dto.ts`
- Create: `backend/src/auth/dto/refresh-token.dto.ts`
- Create: `backend/src/auth/dto/logout.dto.ts`

- [ ] **Step 1: Write the failing validation-focused E2E test**

```ts
it('POST /auth/register returns 400 for missing required fields', async () => {
  await request(app.getHttpServer())
    .post('/auth/register')
    .send({})
    .expect(400);
});
```

- [ ] **Step 2: Run the auth E2E test file to confirm it fails because auth route does not exist yet**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts
```
Expected: FAIL because the test file or route is missing.

- [ ] **Step 3: Update `backend/src/main.ts` to enable global validation**

```ts
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
    }),
  );
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
```

- [ ] **Step 4: Create `backend/src/auth/dto/register.dto.ts`**

```ts
import { Type } from 'class-transformer';
import {
  IsDate,
  IsEmail,
  IsEnum,
  IsNotEmpty,
  IsString,
  MinLength,
} from 'class-validator';

export enum GenderDto {
  male = 'male',
  female = 'female',
}

export class RegisterDto {
  @IsString()
  @IsNotEmpty()
  fullName!: string;

  @IsEmail()
  email!: string;

  @IsString()
  @MinLength(8)
  password!: string;

  @IsString()
  @MinLength(8)
  confirmPassword!: string;

  @IsEnum(GenderDto)
  gender!: GenderDto;

  @Type(() => Date)
  @IsDate()
  dateOfBirth!: Date;
}
```

- [ ] **Step 5: Create `backend/src/auth/dto/login.dto.ts`**

```ts
import { IsEmail, IsString, MinLength } from 'class-validator';

export class LoginDto {
  @IsEmail()
  email!: string;

  @IsString()
  @MinLength(8)
  password!: string;
}
```

- [ ] **Step 6: Create `backend/src/auth/dto/refresh-token.dto.ts` and `logout.dto.ts`**

```ts
import { IsNotEmpty, IsString } from 'class-validator';

export class RefreshTokenDto {
  @IsString()
  @IsNotEmpty()
  refreshToken!: string;
}
```

```ts
import { IsNotEmpty, IsString } from 'class-validator';

export class LogoutDto {
  @IsString()
  @IsNotEmpty()
  refreshToken!: string;
}
```

- [ ] **Step 7: Run build to verify DTOs and validation pipe compile**

Run:
```bash
npm run build
```
Expected: PASS.

- [ ] **Step 8: Commit**

```bash
git add backend/src/main.ts backend/src/auth/dto
git commit -m "feat(backend): add auth dto validation"
```

---

### Task 6: Write failing auth E2E test harness

**Files:**
- Create: `backend/test/auth.e2e-spec.ts`
- Modify: `backend/test/jest-e2e.json`

- [ ] **Step 1: Write the failing E2E suite**

```ts
import { INestApplication, ValidationPipe } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import request from 'supertest';
import { AppModule } from '../src/app.module';

describe('Auth API (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
      }),
    );
    await app.init();
  });

  it('POST /auth/register creates a user', async () => {
    await request(app.getHttpServer())
      .post('/auth/register')
      .send({
        fullName: 'Nguyen Van A',
        email: 'a@example.com',
        password: 'StrongPass123',
        confirmPassword: 'StrongPass123',
        gender: 'male',
        dateOfBirth: '2000-01-15',
      })
      .expect(201);
  });

  afterEach(async () => {
    await app.close();
  });
});
```

- [ ] **Step 2: Run the E2E suite to verify the first auth test fails**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts
```
Expected: FAIL with `Cannot POST /auth/register` or equivalent 404.

- [ ] **Step 3: Ensure `backend/test/jest-e2e.json` includes the new test file pattern**

```json
{
  "moduleFileExtensions": ["js", "json", "ts"],
  "rootDir": ".",
  "testEnvironment": "node",
  "testRegex": ".e2e-spec.ts$",
  "transform": {
    "^.+\\.(t|j)s$": "ts-jest"
  }
}
```

- [ ] **Step 4: Re-run the E2E suite and confirm the failure is still the missing route, not test config**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts
```
Expected: FAIL with route-not-found, not config/load failure.

- [ ] **Step 5: Commit**

```bash
git add backend/test/auth.e2e-spec.ts backend/test/jest-e2e.json
git commit -m "test(backend): add failing auth e2e harness"
```

---

### Task 7: Add auth module, controller skeleton, and response-safe types

**Files:**
- Create: `backend/src/auth/auth.module.ts`
- Create: `backend/src/auth/auth.controller.ts`
- Create: `backend/src/auth/auth.service.ts`
- Create: `backend/src/auth/types/jwt-payload.type.ts`
- Create: `backend/src/auth/types/auth-user-response.type.ts`
- Modify: `backend/src/app.module.ts`

- [ ] **Step 1: Keep the failing E2E test for register as the active target**

```ts
it('POST /auth/register creates a user', async () => {
  await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);
});
```

- [ ] **Step 2: Run the test and confirm it still fails with missing auth route**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/register creates a user"
```
Expected: FAIL with 404.

- [ ] **Step 3: Create `backend/src/auth/types/jwt-payload.type.ts`**

```ts
export interface AccessTokenPayload {
  sub: string;
  email: string;
}

export interface RefreshTokenPayload {
  sub: string;
  sessionId: string;
}
```

- [ ] **Step 4: Create `backend/src/auth/types/auth-user-response.type.ts`**

```ts
export interface AuthUserResponse {
  id: string;
  fullName: string;
  email: string;
  gender: 'male' | 'female';
  dateOfBirth: string;
  createdAt: string;
}
```

- [ ] **Step 5: Create `backend/src/auth/auth.service.ts` skeleton**

```ts
import { Injectable } from '@nestjs/common';
import { LoginDto } from './dto/login.dto';
import { RefreshTokenDto } from './dto/refresh-token.dto';
import { RegisterDto } from './dto/register.dto';
import { LogoutDto } from './dto/logout.dto';

@Injectable()
export class AuthService {
  async register(_dto: RegisterDto) {
    throw new Error('Not implemented');
  }

  async login(_dto: LoginDto) {
    throw new Error('Not implemented');
  }

  async refresh(_dto: RefreshTokenDto) {
    throw new Error('Not implemented');
  }

  async logout(_dto: LogoutDto) {
    throw new Error('Not implemented');
  }

  async me(_userId: string) {
    throw new Error('Not implemented');
  }
}
```

- [ ] **Step 6: Create `backend/src/auth/auth.controller.ts` and `auth.module.ts`**

```ts
import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { LogoutDto } from './dto/logout.dto';
import { RefreshTokenDto } from './dto/refresh-token.dto';
import { RegisterDto } from './dto/register.dto';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  register(@Body() dto: RegisterDto) {
    return this.authService.register(dto);
  }

  @Post('login')
  login(@Body() dto: LoginDto) {
    return this.authService.login(dto);
  }

  @Post('refresh')
  refresh(@Body() dto: RefreshTokenDto) {
    return this.authService.refresh(dto);
  }

  @Post('logout')
  logout(@Body() dto: LogoutDto) {
    return this.authService.logout(dto);
  }

  @UseGuards(JwtAuthGuard)
  @Get('me')
  me(@Req() req: { user: { sub: string } }) {
    return this.authService.me(req.user.sub);
  }
}
```

```ts
import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';

@Module({
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
```

- [ ] **Step 7: Update `backend/src/app.module.ts` to import `AuthModule`**

```ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [PrismaModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

- [ ] **Step 8: Run the targeted E2E test to confirm failure moves from 404 to service-not-implemented**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/register creates a user"
```
Expected: FAIL with 500 or thrown `Not implemented`, proving route wiring exists.

- [ ] **Step 9: Commit**

```bash
git add backend/src/auth backend/src/app.module.ts
git commit -m "feat(backend): wire auth module skeleton"
```

---

### Task 8: Add JWT auth infrastructure

**Files:**
- Modify: `backend/src/auth/auth.module.ts`
- Create: `backend/src/common/guards/jwt-auth.guard.ts`
- Create: `backend/src/common/decorators/current-user.decorator.ts`

- [ ] **Step 1: Write the failing `/auth/me` protected-route test**

```ts
it('GET /auth/me returns 401 without access token', async () => {
  await request(app.getHttpServer()).get('/auth/me').expect(401);
});
```

- [ ] **Step 2: Run the targeted test to confirm guard behavior is not implemented yet**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "GET /auth/me returns 401 without access token"
```
Expected: FAIL because guard is missing or app errors on missing class.

- [ ] **Step 3: Create `backend/src/common/guards/jwt-auth.guard.ts`**

```ts
import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { AccessTokenPayload } from '../../auth/types/jwt-payload.type';

@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}

  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest<Request & { user?: AccessTokenPayload }>();
    const authHeader = request.headers.authorization;

    if (!authHeader?.startsWith('Bearer ')) {
      throw new UnauthorizedException('Access token is required');
    }

    const token = authHeader.slice(7);

    try {
      request.user = this.jwtService.verify<AccessTokenPayload>(token, {
        secret: process.env.JWT_ACCESS_SECRET,
      });
      return true;
    } catch {
      throw new UnauthorizedException('Invalid or expired access token');
    }
  }
}
```

- [ ] **Step 4: Create `backend/src/common/decorators/current-user.decorator.ts`**

```ts
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { AccessTokenPayload } from '../../auth/types/jwt-payload.type';

export const CurrentUser = createParamDecorator(
  (_data: unknown, ctx: ExecutionContext): AccessTokenPayload => {
    const request = ctx.switchToHttp().getRequest<{ user: AccessTokenPayload }>();
    return request.user;
  },
);
```

- [ ] **Step 5: Update `backend/src/auth/auth.module.ts` to register `JwtModule` and guard deps**

```ts
import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';

@Module({
  imports: [JwtModule.register({})],
  controllers: [AuthController],
  providers: [AuthService, JwtAuthGuard],
  exports: [JwtModule],
})
export class AuthModule {}
```

- [ ] **Step 6: Re-run the `/auth/me` unauthenticated test**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "GET /auth/me returns 401 without access token"
```
Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add backend/src/common backend/src/auth/auth.module.ts
git commit -m "feat(backend): add jwt auth guard"
```

---

### Task 9: Implement register flow

**Files:**
- Modify: `backend/src/auth/auth.service.ts`
- Modify: `backend/src/auth/auth.controller.ts`
- Test: `backend/test/auth.e2e-spec.ts`

- [ ] **Step 1: Expand the failing register E2E coverage**

```ts
it('POST /auth/register creates a user and returns tokens', async () => {
  const response = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  expect(response.body.message).toBe('Authentication successful');
  expect(response.body.data.user.email).toBe('a@example.com');
  expect(response.body.data.accessToken).toEqual(expect.any(String));
  expect(response.body.data.refreshToken).toEqual(expect.any(String));
});

it('POST /auth/register rejects mismatched confirmPassword', async () => {
  await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'WrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(400);
});
```

- [ ] **Step 2: Run the targeted register E2E tests to verify they fail in service logic**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/register"
```
Expected: FAIL with `Not implemented` or 500.

- [ ] **Step 3: Replace `register` in `backend/src/auth/auth.service.ts` with minimal working implementation**

```ts
import { BadRequestException, ConflictException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from '../prisma/prisma.service';
import { compare, hash } from 'bcrypt';
import { LoginDto } from './dto/login.dto';
import { LogoutDto } from './dto/logout.dto';
import { RefreshTokenDto } from './dto/refresh-token.dto';
import { RegisterDto } from './dto/register.dto';
import { AccessTokenPayload, RefreshTokenPayload } from './types/jwt-payload.type';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  private normalizeEmail(email: string) {
    return email.trim().toLowerCase();
  }

  private async signAccessToken(userId: string, email: string) {
    const payload: AccessTokenPayload = { sub: userId, email };
    return this.jwtService.signAsync(payload, {
      secret: process.env.JWT_ACCESS_SECRET,
      expiresIn: process.env.JWT_ACCESS_EXPIRES_IN ?? '15m',
    });
  }

  private async signRefreshToken(userId: string, sessionId: string) {
    const payload: RefreshTokenPayload = { sub: userId, sessionId };
    return this.jwtService.signAsync(payload, {
      secret: process.env.JWT_REFRESH_SECRET,
      expiresIn: process.env.JWT_REFRESH_EXPIRES_IN ?? '7d',
    });
  }

  private buildUserResponse(user: {
    id: string;
    fullName: string;
    email: string;
    gender: 'male' | 'female';
    dateOfBirth: Date;
    createdAt: Date;
  }) {
    return {
      id: user.id,
      fullName: user.fullName,
      email: user.email,
      gender: user.gender,
      dateOfBirth: user.dateOfBirth.toISOString().slice(0, 10),
      createdAt: user.createdAt.toISOString(),
    };
  }

  async register(dto: RegisterDto) {
    if (dto.password !== dto.confirmPassword) {
      throw new BadRequestException({
        message: 'Validation failed',
        errors: { confirmPassword: ['Passwords do not match'] },
      });
    }

    const email = this.normalizeEmail(dto.email);
    const existingUser = await this.prisma.user.findUnique({ where: { email } });

    if (existingUser) {
      throw new ConflictException({
        message: 'Validation failed',
        errors: { email: ['Email already exists'] },
      });
    }

    const passwordHash = await hash(dto.password, 10);
    const user = await this.prisma.user.create({
      data: {
        fullName: dto.fullName.trim(),
        email,
        passwordHash,
        gender: dto.gender,
        dateOfBirth: dto.dateOfBirth,
      },
    });

    const session = await this.prisma.refreshToken.create({
      data: {
        userId: user.id,
        tokenHash: 'pending',
        expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
      },
    });

    const accessToken = await this.signAccessToken(user.id, user.email);
    const refreshToken = await this.signRefreshToken(user.id, session.id);
    const tokenHash = await hash(refreshToken, 10);

    await this.prisma.refreshToken.update({
      where: { id: session.id },
      data: { tokenHash },
    });

    return {
      message: 'Authentication successful',
      data: {
        user: this.buildUserResponse(user),
        accessToken,
        refreshToken,
      },
    };
  }

  async login(_dto: LoginDto) {
    throw new Error('Not implemented');
  }

  async refresh(_dto: RefreshTokenDto) {
    throw new Error('Not implemented');
  }

  async logout(_dto: LogoutDto) {
    throw new Error('Not implemented');
  }

  async me(_userId: string) {
    throw new Error('Not implemented');
  }
}
```

- [ ] **Step 4: Run register E2E tests to verify they pass**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/register"
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.service.ts backend/test/auth.e2e-spec.ts
git commit -m "feat(backend): implement register flow"
```

---

### Task 10: Implement login flow

**Files:**
- Modify: `backend/src/auth/auth.service.ts`
- Test: `backend/test/auth.e2e-spec.ts`

- [ ] **Step 1: Write the failing login E2E tests**

```ts
it('POST /auth/login returns user and tokens for valid credentials', async () => {
  await request(app.getHttpServer()).post('/auth/register').send({
    fullName: 'Nguyen Van A',
    email: 'a@example.com',
    password: 'StrongPass123',
    confirmPassword: 'StrongPass123',
    gender: 'male',
    dateOfBirth: '2000-01-15',
  });

  const response = await request(app.getHttpServer())
    .post('/auth/login')
    .send({ email: 'a@example.com', password: 'StrongPass123' })
    .expect(200);

  expect(response.body.message).toBe('Authentication successful');
  expect(response.body.data.user.email).toBe('a@example.com');
  expect(response.body.data.accessToken).toEqual(expect.any(String));
  expect(response.body.data.refreshToken).toEqual(expect.any(String));
});

it('POST /auth/login returns 401 for invalid password', async () => {
  await request(app.getHttpServer()).post('/auth/register').send({
    fullName: 'Nguyen Van A',
    email: 'a@example.com',
    password: 'StrongPass123',
    confirmPassword: 'StrongPass123',
    gender: 'male',
    dateOfBirth: '2000-01-15',
  });

  await request(app.getHttpServer())
    .post('/auth/login')
    .send({ email: 'a@example.com', password: 'WrongPass123' })
    .expect(401);
});
```

- [ ] **Step 2: Run login E2E tests to verify they fail**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/login"
```
Expected: FAIL with `Not implemented` or 500.

- [ ] **Step 3: Implement `login` in `backend/src/auth/auth.service.ts`**

```ts
import { BadRequestException, ConflictException, Injectable, UnauthorizedException } from '@nestjs/common';
// keep existing imports

async login(dto: LoginDto) {
  const email = this.normalizeEmail(dto.email);
  const user = await this.prisma.user.findUnique({ where: { email } });

  if (!user) {
    throw new UnauthorizedException('Invalid email or password');
  }

  const passwordMatches = await compare(dto.password, user.passwordHash);

  if (!passwordMatches) {
    throw new UnauthorizedException('Invalid email or password');
  }

  const session = await this.prisma.refreshToken.create({
    data: {
      userId: user.id,
      tokenHash: 'pending',
      expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
    },
  });

  const accessToken = await this.signAccessToken(user.id, user.email);
  const refreshToken = await this.signRefreshToken(user.id, session.id);
  const tokenHash = await hash(refreshToken, 10);

  await this.prisma.refreshToken.update({
    where: { id: session.id },
    data: { tokenHash },
  });

  return {
    message: 'Authentication successful',
    data: {
      user: this.buildUserResponse(user),
      accessToken,
      refreshToken,
    },
  };
}
```

- [ ] **Step 4: Run login E2E tests to verify they pass**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/login"
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.service.ts backend/test/auth.e2e-spec.ts
git commit -m "feat(backend): implement login flow"
```

---

### Task 11: Implement `/auth/me`

**Files:**
- Modify: `backend/src/auth/auth.service.ts`
- Modify: `backend/src/auth/auth.controller.ts`
- Test: `backend/test/auth.e2e-spec.ts`

- [ ] **Step 1: Write the failing `/auth/me` success test**

```ts
it('GET /auth/me returns current user for valid access token', async () => {
  const registerResponse = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  const accessToken = registerResponse.body.data.accessToken;

  const response = await request(app.getHttpServer())
    .get('/auth/me')
    .set('Authorization', `Bearer ${accessToken}`)
    .expect(200);

  expect(response.body.message).toBe('Current user fetched successfully');
  expect(response.body.data.user.email).toBe('a@example.com');
});
```

- [ ] **Step 2: Run `/auth/me` tests to confirm success case fails**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "GET /auth/me"
```
Expected: unauthenticated test passes, authenticated success test fails with `Not implemented`.

- [ ] **Step 3: Implement `me` in `backend/src/auth/auth.service.ts` and use `CurrentUser` in controller**

```ts
import { CurrentUser } from '../common/decorators/current-user.decorator';
import { AccessTokenPayload } from './types/jwt-payload.type';

@UseGuards(JwtAuthGuard)
@Get('me')
me(@CurrentUser() user: AccessTokenPayload) {
  return this.authService.me(user.sub);
}
```

```ts
import { NotFoundException } from '@nestjs/common';

async me(userId: string) {
  const user = await this.prisma.user.findUnique({ where: { id: userId } });

  if (!user) {
    throw new NotFoundException('User not found');
  }

  return {
    message: 'Current user fetched successfully',
    data: {
      user: this.buildUserResponse(user),
    },
  };
}
```

- [ ] **Step 4: Run `/auth/me` tests to verify they pass**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "GET /auth/me"
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.controller.ts backend/src/auth/auth.service.ts backend/test/auth.e2e-spec.ts
git commit -m "feat(backend): implement current-user endpoint"
```

---

### Task 12: Implement refresh-token rotation

**Files:**
- Modify: `backend/src/auth/auth.service.ts`
- Test: `backend/test/auth.e2e-spec.ts`

- [ ] **Step 1: Write the failing refresh E2E tests**

```ts
it('POST /auth/refresh rotates the refresh token', async () => {
  const registerResponse = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  const oldRefreshToken = registerResponse.body.data.refreshToken;

  const refreshResponse = await request(app.getHttpServer())
    .post('/auth/refresh')
    .send({ refreshToken: oldRefreshToken })
    .expect(200);

  expect(refreshResponse.body.message).toBe('Token refreshed successfully');
  expect(refreshResponse.body.data.accessToken).toEqual(expect.any(String));
  expect(refreshResponse.body.data.refreshToken).toEqual(expect.any(String));
  expect(refreshResponse.body.data.refreshToken).not.toBe(oldRefreshToken);
});

it('POST /auth/refresh rejects a rotated old token', async () => {
  const registerResponse = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  const oldRefreshToken = registerResponse.body.data.refreshToken;

  await request(app.getHttpServer())
    .post('/auth/refresh')
    .send({ refreshToken: oldRefreshToken })
    .expect(200);

  await request(app.getHttpServer())
    .post('/auth/refresh')
    .send({ refreshToken: oldRefreshToken })
    .expect(401);
});
```

- [ ] **Step 2: Run refresh E2E tests to verify they fail**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/refresh"
```
Expected: FAIL with `Not implemented` or 500.

- [ ] **Step 3: Implement `refresh` in `backend/src/auth/auth.service.ts`**

```ts
private async verifyRefreshToken(token: string) {
  try {
    return await this.jwtService.verifyAsync<RefreshTokenPayload>(token, {
      secret: process.env.JWT_REFRESH_SECRET,
    });
  } catch {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }
}

async refresh(dto: RefreshTokenDto) {
  const payload = await this.verifyRefreshToken(dto.refreshToken);
  const session = await this.prisma.refreshToken.findUnique({
    where: { id: payload.sessionId },
  });

  if (!session || session.revokedAt || session.expiresAt.getTime() <= Date.now()) {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }

  const tokenMatches = await compare(dto.refreshToken, session.tokenHash);

  if (!tokenMatches) {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }

  await this.prisma.refreshToken.update({
    where: { id: session.id },
    data: { revokedAt: new Date() },
  });

  const user = await this.prisma.user.findUnique({ where: { id: payload.sub } });

  if (!user) {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }

  const nextSession = await this.prisma.refreshToken.create({
    data: {
      userId: user.id,
      tokenHash: 'pending',
      expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
    },
  });

  const accessToken = await this.signAccessToken(user.id, user.email);
  const refreshToken = await this.signRefreshToken(user.id, nextSession.id);
  const tokenHash = await hash(refreshToken, 10);

  await this.prisma.refreshToken.update({
    where: { id: nextSession.id },
    data: { tokenHash },
  });

  return {
    message: 'Token refreshed successfully',
    data: {
      accessToken,
      refreshToken,
    },
  };
}
```

- [ ] **Step 4: Run refresh E2E tests to verify they pass**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/refresh"
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.service.ts backend/test/auth.e2e-spec.ts
git commit -m "feat(backend): implement refresh token rotation"
```

---

### Task 13: Implement logout revocation

**Files:**
- Modify: `backend/src/auth/auth.service.ts`
- Test: `backend/test/auth.e2e-spec.ts`

- [ ] **Step 1: Write the failing logout E2E tests**

```ts
it('POST /auth/logout revokes the current refresh token', async () => {
  const registerResponse = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  const refreshToken = registerResponse.body.data.refreshToken;

  await request(app.getHttpServer())
    .post('/auth/logout')
    .send({ refreshToken })
    .expect(200)
    .expect({ message: 'Logged out successfully' });
});

it('POST /auth/logout prevents later refresh with the revoked token', async () => {
  const registerResponse = await request(app.getHttpServer())
    .post('/auth/register')
    .send({
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      password: 'StrongPass123',
      confirmPassword: 'StrongPass123',
      gender: 'male',
      dateOfBirth: '2000-01-15',
    })
    .expect(201);

  const refreshToken = registerResponse.body.data.refreshToken;

  await request(app.getHttpServer())
    .post('/auth/logout')
    .send({ refreshToken })
    .expect(200);

  await request(app.getHttpServer())
    .post('/auth/refresh')
    .send({ refreshToken })
    .expect(401);
});
```

- [ ] **Step 2: Run logout E2E tests to verify they fail**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/logout"
```
Expected: FAIL with `Not implemented` or 500.

- [ ] **Step 3: Implement `logout` in `backend/src/auth/auth.service.ts`**

```ts
async logout(dto: LogoutDto) {
  const payload = await this.verifyRefreshToken(dto.refreshToken);
  const session = await this.prisma.refreshToken.findUnique({
    where: { id: payload.sessionId },
  });

  if (!session || session.revokedAt) {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }

  const tokenMatches = await compare(dto.refreshToken, session.tokenHash);

  if (!tokenMatches) {
    throw new UnauthorizedException('Invalid or expired refresh token');
  }

  await this.prisma.refreshToken.update({
    where: { id: session.id },
    data: { revokedAt: new Date() },
  });

  return {
    message: 'Logged out successfully',
  };
}
```

- [ ] **Step 4: Run logout E2E tests to verify they pass**

Run:
```bash
npm run test:e2e -- --runTestsByPath test/auth.e2e-spec.ts -t "POST /auth/logout"
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.service.ts backend/test/auth.e2e-spec.ts
git commit -m "feat(backend): implement logout revocation"
```

---

### Task 14: Add focused service unit tests for auth edge cases

**Files:**
- Create: `backend/src/auth/auth.service.spec.ts`

- [ ] **Step 1: Write the failing unit tests for core service logic**

```ts
import { ConflictException, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Test } from '@nestjs/testing';
import { compare } from 'bcrypt';
import { AuthService } from './auth.service';
import { PrismaService } from '../prisma/prisma.service';

describe('AuthService', () => {
  let service: AuthService;
  let prisma: jest.Mocked<PrismaService>;
  let jwtService: jest.Mocked<JwtService>;

  beforeEach(async () => {
    const moduleRef = await Test.createTestingModule({
      providers: [
        AuthService,
        {
          provide: PrismaService,
          useValue: {
            user: { findUnique: jest.fn(), create: jest.fn() },
            refreshToken: { create: jest.fn(), update: jest.fn(), findUnique: jest.fn() },
          },
        },
        {
          provide: JwtService,
          useValue: { signAsync: jest.fn(), verifyAsync: jest.fn() },
        },
      ],
    }).compile();

    service = moduleRef.get(AuthService);
    prisma = moduleRef.get(PrismaService);
    jwtService = moduleRef.get(JwtService);
  });

  it('throws ConflictException when register email already exists', async () => {
    prisma.user.findUnique.mockResolvedValue({ id: 'u1' } as never);

    await expect(
      service.register({
        fullName: 'Nguyen Van A',
        email: 'a@example.com',
        password: 'StrongPass123',
        confirmPassword: 'StrongPass123',
        gender: 'male' as never,
        dateOfBirth: new Date('2000-01-15'),
      }),
    ).rejects.toBeInstanceOf(ConflictException);
  });

  it('throws UnauthorizedException when login password is invalid', async () => {
    prisma.user.findUnique.mockResolvedValue({
      id: 'u1',
      fullName: 'Nguyen Van A',
      email: 'a@example.com',
      passwordHash: '$2b$10$1234567890123456789012uK1m7VwM8qP6N8xVwQY8NQj0Xxj8f7K',
      gender: 'male',
      dateOfBirth: new Date('2000-01-15'),
      createdAt: new Date(),
      updatedAt: new Date(),
    } as never);

    await expect(
      service.login({ email: 'a@example.com', password: 'WrongPass123' }),
    ).rejects.toBeInstanceOf(UnauthorizedException);
  });
});
```

- [ ] **Step 2: Run the unit tests to verify they fail if mocks/signatures drift**

Run:
```bash
npm test -- --runTestsByPath src/auth/auth.service.spec.ts
```
Expected: FAIL first if implementation signatures or mocks are not aligned.

- [ ] **Step 3: Adjust imports/mock shapes only as needed so tests target real service behavior without changing production behavior**

```ts
// Acceptable fixes in this step:
// - align mocked Prisma return shapes to actual service usage
// - align dto input types to actual service method signatures
// Do not change production behavior in this step unless the tests reveal a genuine bug.
```

- [ ] **Step 4: Re-run the unit tests to verify they pass**

Run:
```bash
npm test -- --runTestsByPath src/auth/auth.service.spec.ts
```
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/auth/auth.service.spec.ts
git commit -m "test(backend): add auth service unit tests"
```

---

### Task 15: Run full verification and document Postman flow

**Files:**
- Modify: `docs/superpowers/specs/2026-04-28-auth-api-design.md` only if implementation materially diverged and must be reconciled
- Optional Create: `backend/README.md` section or `backend/docs/postman-auth.md` if the project needs a local testing note

- [ ] **Step 1: Run full backend unit and E2E tests**

Run:
```bash
npm test && npm run test:e2e
```
Expected: PASS.

- [ ] **Step 2: Run backend build**

Run:
```bash
npm run build
```
Expected: PASS.

- [ ] **Step 3: Start the server and verify the manual Postman flow**

Run:
```bash
npm run start:dev
```
Expected: Nest server starts on local port and exposes `/auth/register`, `/auth/login`, `/auth/refresh`, `/auth/logout`, `/auth/me`.

Manual verification checklist:
```text
1. POST /auth/register with fullName, email, password, confirmPassword, gender, dateOfBirth
2. Save accessToken + refreshToken from response
3. GET /auth/me with Authorization: Bearer <accessToken>
4. POST /auth/login with email + password
5. POST /auth/refresh with refreshToken
6. POST /auth/logout with refreshToken
7. POST /auth/refresh again with the revoked token and confirm 401
```

- [ ] **Step 4: Capture final Postman instructions for the user**

```text
Base URL: http://localhost:3000

Register:
POST /auth/register
Body JSON:
{
  "fullName": "Nguyen Van A",
  "email": "a@example.com",
  "password": "StrongPass123",
  "confirmPassword": "StrongPass123",
  "gender": "male",
  "dateOfBirth": "2000-01-15"
}

Login:
POST /auth/login
Body JSON:
{
  "email": "a@example.com",
  "password": "StrongPass123"
}

Me:
GET /auth/me
Header:
Authorization: Bearer <accessToken>

Refresh:
POST /auth/refresh
Body JSON:
{
  "refreshToken": "<refreshToken>"
}

Logout:
POST /auth/logout
Body JSON:
{
  "refreshToken": "<refreshToken>"
}
```

- [ ] **Step 5: Commit**

```bash
git add backend docs/superpowers/specs/2026-04-28-auth-api-design.md
git commit -m "docs(backend): finalize auth api verification guidance"
```

---

## Self-review

### Spec coverage check
- register: covered in Task 9
- login: covered in Task 10
- me: covered in Task 11
- refresh rotation: covered in Task 12
- logout revocation: covered in Task 13
- DTO validation: covered in Task 5
- Prisma/PostgreSQL persistence: covered in Tasks 2-4
- Postman verification: covered in Task 15

### Placeholder scan
- No `TBD`, `TODO`, or “similar to task N” placeholders remain.
- Commands and code blocks are concrete.

### Type consistency check
- `RegisterDto`, `LoginDto`, `RefreshTokenDto`, `LogoutDto` names stay consistent across tasks.
- JWT payload types use `sub` and `sessionId` consistently.
- Response shape always uses `message` and `data`.
