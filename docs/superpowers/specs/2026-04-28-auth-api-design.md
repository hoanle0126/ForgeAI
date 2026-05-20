# Auth API Design

Date: 2026-04-28
Project: ForgeAI backend (`backend/`)
Scope: Implement production-oriented authentication API on top of the current NestJS scaffold.

## 1. Goal

Add a real backend authentication foundation for ForgeAI using NestJS, PostgreSQL, Prisma, JWT access tokens, and refresh-token session rotation.

This scope covers:
- user registration
- login
- token refresh
- logout
- current-user lookup
- API contracts suitable for Postman testing and future Flutter integration

This scope intentionally does not cover:
- email verification
- forgot password
- social login
- roles/permissions
- logout all devices
- RBAC

## 2. Current backend state

The current backend is a minimal NestJS scaffold with:
- `src/app.module.ts`
- `src/app.controller.ts`
- `src/app.service.ts`
- default `GET /` endpoint returning `Hello World!`
- default Jest + Supertest setup

There is currently no:
- auth module
- database integration
- ORM
- user persistence
- password hashing
- token/session logic

## 3. Chosen approach

### Stack
- Framework: NestJS
- Language: TypeScript
- Database: PostgreSQL
- ORM: Prisma
- Auth: JWT access token + JWT refresh token
- Session persistence: hashed refresh tokens stored in database
- Testing: Jest + Supertest

### Why this approach
- matches the user requirement for a professional backend foundation
- keeps NestJS module boundaries clear
- supports real logout semantics through refresh-token revocation
- is appropriate for future Flutter/mobile integration
- avoids over-engineering beyond the auth scope

## 4. API surface

Base route prefix recommendation:
- `/auth`

### 4.1 POST `/auth/register`

Request body:
```json
{
  "fullName": "Nguyen Van A",
  "email": "a@example.com",
  "password": "StrongPass123",
  "confirmPassword": "StrongPass123",
  "gender": "male",
  "dateOfBirth": "2000-01-15"
}
```

Behavior:
- validate input
- normalize email to lowercase
- reject duplicate email
- validate `confirmPassword === password`
- validate `gender` in `male | female`
- hash password
- create user
- issue access token + refresh token
- store hashed refresh token in DB

Success response: `201 Created`
```json
{
  "message": "Authentication successful",
  "data": {
    "user": {
      "id": "uuid",
      "fullName": "Nguyen Van A",
      "email": "a@example.com",
      "gender": "male",
      "dateOfBirth": "2000-01-15",
      "createdAt": "2026-04-28T10:00:00.000Z"
    },
    "accessToken": "jwt-access-token",
    "refreshToken": "jwt-refresh-token"
  }
}
```

### 4.2 POST `/auth/login`

Request body:
```json
{
  "email": "a@example.com",
  "password": "StrongPass123"
}
```

Behavior:
- normalize email to lowercase
- verify user exists
- verify password hash
- issue new access token + refresh token
- store hashed refresh token in DB as a new session record

Success response: `200 OK`
```json
{
  "message": "Authentication successful",
  "data": {
    "user": {
      "id": "uuid",
      "fullName": "Nguyen Van A",
      "email": "a@example.com",
      "gender": "male",
      "dateOfBirth": "2000-01-15",
      "createdAt": "2026-04-28T10:00:00.000Z"
    },
    "accessToken": "jwt-access-token",
    "refreshToken": "jwt-refresh-token"
  }
}
```

### 4.3 POST `/auth/refresh`

Request body:
```json
{
  "refreshToken": "jwt-refresh-token"
}
```

Behavior:
- verify refresh token signature and expiry
- locate stored hashed token record
- reject if token is revoked or missing
- rotate refresh token
- revoke old refresh token record
- store new hashed refresh token record
- return fresh token pair

Success response: `200 OK`
```json
{
  "message": "Token refreshed successfully",
  "data": {
    "accessToken": "new-jwt-access-token",
    "refreshToken": "new-jwt-refresh-token"
  }
}
```

### 4.4 POST `/auth/logout`

Request body:
```json
{
  "refreshToken": "jwt-refresh-token"
}
```

Behavior:
- verify refresh token payload enough to identify session candidate
- find hashed token record
- mark token as revoked
- return success

Success response: `200 OK`
```json
{
  "message": "Logged out successfully"
}
```

Reason for `200` instead of `204`:
- easier Postman verification
- more consistent API envelope for early-stage backend work

### 4.5 GET `/auth/me`

Headers:
```http
Authorization: Bearer <accessToken>
```

Behavior:
- protect route with JWT auth guard
- extract user id from access token
- return current user profile

Success response: `200 OK`
```json
{
  "message": "Current user fetched successfully",
  "data": {
    "user": {
      "id": "uuid",
      "fullName": "Nguyen Van A",
      "email": "a@example.com",
      "gender": "male",
      "dateOfBirth": "2000-01-15",
      "createdAt": "2026-04-28T10:00:00.000Z"
    }
  }
}
```

## 5. Validation and error format

### Validation rules
- `fullName`: required, trimmed, non-empty
- `email`: required, valid email format, stored lowercase
- `password`: required, minimum length enforced
- `confirmPassword`: required, must equal `password`
- `gender`: required, enum `male | female`
- `dateOfBirth`: required, valid ISO-like date input (`YYYY-MM-DD`)
- `refreshToken`: required for refresh/logout

### Error response shape
```json
{
  "message": "Validation failed",
  "errors": {
    "email": ["Email already exists"]
  }
}
```

### Status codes
- `201` register success
- `200` login success
- `200` refresh success
- `200` logout success
- `200` me success
- `400` validation failures / malformed input
- `401` invalid credentials / invalid token / expired token / revoked token
- `409` duplicate email during register

### Security-sensitive error policy
For login failures, prefer a generic message such as:
- `Invalid email or password`

Do not expose whether the email exists.

## 6. Data model

### 6.1 `User`
Fields:
- `id`
- `fullName`
- `email` (unique)
- `passwordHash`
- `gender`
- `dateOfBirth`
- `createdAt`
- `updatedAt`

### 6.2 `RefreshToken`
Fields:
- `id`
- `userId`
- `tokenHash`
- `expiresAt`
- `revokedAt` (nullable)
- `createdAt`

### Why separate refresh-token table
- supports multiple sessions/devices cleanly
- makes logout a real server-side revocation operation
- leaves room for future `logout all devices`
- avoids storing raw refresh tokens in the database

## 7. Token strategy

### Access token
- JWT
- TTL: 15 minutes
- purpose: authenticate protected endpoints such as `/auth/me`

### Refresh token
- JWT
- TTL: 7 days
- purpose: renew access token and support revocable sessions
- DB stores hash only, never raw token

### Rotation policy
- refresh token rotation is mandatory
- each refresh invalidates the previous refresh token
- each login creates a new session record

## 8. Backend structure

Recommended structure under `backend/src/`:

```text
src/
  app.module.ts
  prisma/
    prisma.module.ts
    prisma.service.ts
  auth/
    auth.module.ts
    auth.controller.ts
    auth.service.ts
    dto/
      register.dto.ts
      login.dto.ts
      refresh-token.dto.ts
      logout.dto.ts
  common/
    guards/
      jwt-auth.guard.ts
    decorators/
      current-user.decorator.ts
```

### Structure rules
- keep `AppModule` as composition root only
- place auth behavior inside `auth/`
- add Prisma in its own module/service
- use `common/` for reusable guards/decorators only when they actually reduce duplication

## 9. Validation and request pipeline

Recommended NestJS decisions:
- enable global validation pipe
- strip unknown fields from DTOs
- reject invalid payload shapes at controller boundary
- normalize email inside service layer before persistence/query

## 10. Test strategy

### 10.1 E2E tests first
Primary auth coverage should be E2E using Supertest.

Required scenarios:
1. `POST /auth/register` succeeds with valid payload
2. `POST /auth/register` fails with duplicate email
3. `POST /auth/register` fails with mismatched `confirmPassword`
4. `POST /auth/login` succeeds with correct credentials
5. `POST /auth/login` fails with wrong password
6. `GET /auth/me` fails without access token
7. `GET /auth/me` succeeds with valid access token
8. `POST /auth/refresh` returns a new token pair
9. `POST /auth/logout` revokes refresh token successfully
10. old refresh token fails after logout or rotation

### 10.2 Unit tests
Target service-level logic for:
- duplicate-email rejection
- password verification
- confirm-password validation
- token rotation logic
- logout revocation logic

## 11. Postman test flow

Recommended manual test order:
1. Register a new account
2. Save `accessToken` and `refreshToken`
3. Call `/auth/me` with the access token
4. Login again and receive a fresh token pair
5. Call `/auth/refresh`
6. Call `/auth/logout`
7. Retry `/auth/refresh` with the revoked token and confirm failure

Suggested Postman environment variables:
- `baseUrl`
- `accessToken`
- `refreshToken`

## 12. Out-of-scope decisions

Not included in this auth phase:
- email verification
- forgot password
- social login
- role management
- permission matrix
- device metadata tracking
- analytics/audit trail
- logout all devices

These are intentionally excluded to keep the first auth implementation focused and shippable.

## 13. Implementation order

1. add approved dependencies for Prisma, PostgreSQL, auth, validation, and hashing
2. create Prisma schema and migration
3. add Prisma module/service
4. add auth DTOs and validation
5. write failing E2E tests for register/login/me/refresh/logout
6. implement auth service and controller
7. add JWT guard for `/auth/me`
8. run backend tests and build
9. provide Postman testing instructions

## 14. Success criteria

This design is considered successfully implemented when:
- backend exposes working register/login/refresh/logout/me endpoints
- credentials persist in PostgreSQL
- passwords are hashed
- refresh tokens are revocable and rotated
- E2E tests cover the auth flow
- the API is easy to verify in Postman
- the implementation remains small, focused, and appropriate for future mobile integration
