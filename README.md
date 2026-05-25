# ForgeAI

ForgeAI la repository monorepo cho ung dung fitness mobile-first, tach rieng:

- `frontend/`: Flutter app
- `backend/`: NestJS API
- `model_ai/`: Python model support cho mot so luong AI noi bo

Tai lieu nay huong dan cach cai dat, cau hinh `.env`, chay frontend/backend, va giu cau truc thu muc hop ly theo hien trang repo.

## 1. Yeu cau moi truong

Can cai san:

- `Flutter SDK`
- `Dart SDK` (di kem Flutter)
- `Node.js` va `npm`
- `PostgreSQL`
- `Git`

Kiem tra nhanh:

```bash
flutter --version
dart --version
node -v
npm -v
psql --version
```

## 2. Cau truc repository

```text
ForgeAI/
├── AGENTS.md
├── PRODUCT_CONTEXT.md
├── README.md
├── frontend/              # Flutter app
├── backend/               # NestJS API
└── model_ai/              # Python model support
```

### Cau truc hop ly nen giu

```text
frontend/
├── lib/
│   ├── core/              # constants, router, theme
│   ├── data/              # datasources, repositories, shared models
│   ├── features/          # auth, dashboard, training, profile...
│   └── shared/            # widget dung chung
├── test/
├── tool/
└── assets/

backend/
├── src/
│   ├── ai/
│   ├── auth/
│   ├── common/
│   ├── prisma/
│   ├── profile/
│   └── workouts/
├── prisma/
├── scripts/
└── test/
```

Nguyen tac nen giu:

- Frontend theo `feature-first architecture`
- Backend theo `module-based architecture`
- Thu vien dung chung cua frontend dua vao `frontend/lib/shared/`
- Khong import cheo widget giua cac feature frontend; can dung chung thi dua len `shared/`

## 3. Cai dependency

### Frontend

Chay trong `frontend/`:

```bash
cd frontend
flutter pub get
```

Frontend hien dung cac package chinh:

- `dio`
- `fl_chart`
- `flutter_animate`
- `flutter_body_atlas`
- `flutter_dotenv`
- `flutter_riverpod`
- `flutter_svg`
- `freezed_annotation`
- `go_router`
- `google_fonts`
- `hive`
- `hive_flutter`
- `json_annotation`
- `lottie`
- `percent_indicator`
- `phosphor_flutter`
- `riverpod_annotation`
- `shared_preferences`

Dev dependencies chinh:

- `build_runner`
- `freezed`
- `json_serializable`
- `riverpod_generator`
- `hive_generator`
- `custom_lint`
- `riverpod_lint`
- `forge_ai_lints` (local package tai `frontend/tools/forge_ai_lints`)

### Backend

Chay trong `backend/`:

```bash
cd backend
npm install
```

Backend hien dung cac package chinh:

- `@nestjs/common`
- `@nestjs/config`
- `@nestjs/core`
- `@nestjs/jwt`
- `@nestjs/platform-express`
- `@prisma/client`
- `bcrypt`
- `class-transformer`
- `class-validator`
- `nodemailer`
- `passport`
- `passport-jwt`
- `reflect-metadata`
- `rxjs`

Dev dependencies chinh:

- `@nestjs/cli`
- `@nestjs/testing`
- `eslint`
- `prettier`
- `jest`
- `supertest`
- `prisma`
- `ts-node`
- `typescript`
- `typescript-eslint`

## 4. Cau hinh `.env`

### Frontend `.env`

Tao file tu mau:

```bash
cd frontend
cp .env.example .env
```

Noi dung mau hien tai:

```env
API_BASE_URL=http://localhost:5000
```

Luu y:

- Frontend load `.env` bang `flutter_dotenv`
- Android emulator se tu doi `localhost` thanh `10.0.2.2`
- Neu backend chay may khac, doi `API_BASE_URL` sang IP/domain phu hop

### Backend `.env`

Tao file tu mau:

```bash
cd backend
cp .env.example .env
```

Noi dung mau hien tai:

```env
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="forgeai_auth"
DB_USER="postgres"
DB_PASSWORD="postgres"
DB_SCHEMA="public"

JWT_ACCESS_SECRET="forgeai-access-secret"
JWT_REFRESH_SECRET="forgeai-refresh-secret"
JWT_PASSWORD_RESET_SECRET="forgeai-password-reset-secret"
JWT_ACCESS_EXPIRES_IN="15m"
JWT_REFRESH_EXPIRES_IN="7d"

PORT=5000
FRONTEND_URL="http://localhost:46705"

BREVO_SMTP_HOST="smtp-relay.brevo.com"
BREVO_SMTP_PORT="587"
BREVO_SMTP_USER=""
BREVO_SMTP_KEY=""
BREVO_FROM_EMAIL="no-reply@forgeai.local"
BREVO_FROM_NAME="ForgeAI"
```

Y nghia nhanh:

- `DB_*`: cau hinh PostgreSQL cho backend
- `JWT_*`: secret va thoi gian het han token
- `PORT`: cong backend, mac dinh `5000`
- `FRONTEND_URL`: origin frontend duoc phep qua CORS
- `BREVO_*`: SMTP phuc vu gui mail

Luu y quan trong:

- Backend se loi khi start neu thieu `JWT_ACCESS_SECRET` hoac `JWT_REFRESH_SECRET`
- Prisma service hien tai tu tao ket noi tu `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_SCHEMA`

## 5. Cau hinh PostgreSQL

Tao database:

```sql
CREATE DATABASE forgeai_auth;
```

Vi du local:

- host: `localhost`
- port: `5432`
- user: `postgres`
- password: `postgres`

Sau do trong `backend/`:

```bash
npm run prisma:generate
npm run prisma:migrate:dev
```

Neu can seed:

```bash
npm run prisma:seed
```

## 6. Chay backend

Trong `backend/`:

```bash
cd backend
cp .env.example .env
npm install
npm run prisma:generate
npm run prisma:migrate:dev
npm run start:dev
```

Backend mac dinh chay tai:

```text
http://localhost:5000
```

Lenh huu ich:

```bash
npm run build
npm test
npm run test:e2e
npm run lint
```

## 7. Chay frontend

Trong `frontend/`:

```bash
cd frontend
cp .env.example .env
flutter pub get
flutter run
```

Kiem tra device:

```bash
flutter devices
```

Chay theo device cu the:

```bash
flutter run -d <device_id>
```

Vi du:

```bash
flutter run -d emulator-5554
flutter run -d ios
```

## 8. Thu tu chay app

Thu tu chuan:

1. Khoi dong PostgreSQL
2. Chay backend
3. Chay frontend

Vi du thuc te:

```bash
cd backend
cp .env.example .env
npm install
npm run prisma:generate
npm run prisma:migrate:dev
npm run start:dev
```

Mo terminal khac:

```bash
cd frontend
cp .env.example .env
flutter pub get
flutter run
```

## 9. Kiem tra va quality gate

### Frontend

Lenh check chuan cua project:

```bash
cd frontend
./tool/check.sh
```

Script nay chay:

- `flutter analyze`
- `flutter pub run custom_lint`
- `dart format --output=none --set-exit-if-changed`

### Backend

Kiem tra co ban:

```bash
cd backend
npm run build
npm test
npm run lint
```

## 10. Loi thuong gap

### Frontend khong goi duoc API

Kiem tra:

- `frontend/.env` co dung `API_BASE_URL` khong
- backend co dang chay o cong `5000` khong
- neu dang chay Android emulator, de code tu xu ly `10.0.2.2`

### Backend loi CORS

Kiem tra `FRONTEND_URL` trong `backend/.env`.

Co the khai bao nhieu origin, ngan cach boi dau phay.

### Backend loi database

Kiem tra:

- PostgreSQL da chay chua
- `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD` dung chua
- da chay `npm run prisma:migrate:dev` chua

### Backend loi mail

Neu chua dung tinh nang gui mail, co the de trong:

- `BREVO_SMTP_USER`
- `BREVO_SMTP_KEY`

Neu dung reset password that, can cau hinh SMTP hop le.

## 11. Cai nhanh tu dau

```bash
git clone <repo-url>
cd ForgeAI

cd backend
cp .env.example .env
npm install
npm run prisma:generate
npm run prisma:migrate:dev

cd ../frontend
cp .env.example .env
flutter pub get
```

Chay backend:

```bash
cd backend
npm run start:dev
```

Chay frontend o terminal khac:

```bash
cd frontend
flutter run
```
