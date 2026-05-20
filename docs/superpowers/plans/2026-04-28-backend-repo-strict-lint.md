# Backend Repo Strict Lint Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `backend/` into its own local git repository and establish strict NestJS backend rules plus lint gates.

**Architecture:** Keep the backend at `ForgeAI/backend/` and initialize git inside that directory, without committing or cleaning the parent repository. Backend rules live in `backend/AGENTS.md`; executable checks live in `backend/eslint.config.mjs` and `backend/package.json`.

**Tech Stack:** NestJS 11, TypeScript 5.7, ESLint 9 flat config, typescript-eslint, npm.

---

## File Structure

- Modify: `backend/AGENTS.md` — strict agent-facing backend rules for future generated NestJS code.
- Modify: `backend/eslint.config.mjs` — strict type-aware ESLint flat config.
- Modify: `backend/package.json` — add `lint:check` script and dev lint plugins.
- Create or update via npm: `backend/package-lock.json` — dependency lockfile after installing lint plugins.
- Create by command: `backend/.git/` — local backend git repository metadata.
- Do not modify intentionally: parent repo git history or frontend files.

## Task 1: Initialize backend local git repository

**Files:**
- Create by command: `backend/.git/`
- Read/check: `backend/.gitignore`

- [ ] **Step 1: Confirm backend is not already a git repo**

Run from repository root:

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend rev-parse --show-toplevel
```

Expected before initialization: command fails with `fatal: not a git repository` or returns the parent repo root. If it returns `/home/hoanle0126/PersonalProject/ForgeAI/backend`, skip Step 2 because backend is already initialized.

- [ ] **Step 2: Initialize git inside backend**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend init
```

Expected: git creates `/home/hoanle0126/PersonalProject/ForgeAI/backend/.git`.

- [ ] **Step 3: Verify backend repo root**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend rev-parse --show-toplevel
```

Expected: `/home/hoanle0126/PersonalProject/ForgeAI/backend`.

- [ ] **Step 4: Check backend git status**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend status --short
```

Expected: backend files appear as untracked, while `node_modules/` is ignored by `.gitignore`.

## Task 2: Install strict lint plugins

**Files:**
- Modify: `backend/package.json`
- Create or modify: `backend/package-lock.json`

- [ ] **Step 1: Install focused ESLint plugins**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend install --save-dev eslint-plugin-simple-import-sort eslint-plugin-sonarjs eslint-plugin-unicorn
```

Expected: npm updates `backend/package.json` and `backend/package-lock.json` with the three dev dependencies.

- [ ] **Step 2: Confirm package scripts still exist**

Read `backend/package.json` and confirm these scripts remain present:

```json
{
  "scripts": {
    "build": "nest build",
    "lint": "eslint \"{src,apps,libs,test}/**/*.ts\" --fix",
    "test": "jest"
  }
}
```

Expected: existing scripts are still present after npm install.

## Task 3: Expand backend agent rules

**Files:**
- Modify: `backend/AGENTS.md`

- [ ] **Step 1: Replace backend guidance with strict NestJS rules**

Replace `backend/AGENTS.md` with this content:

```markdown
# ForgeAI Backend — NestJS Agent Guidance

This file guides AI agents working inside `backend/`.

## Role in the product

The backend supports ForgeAI, a mobile-first fitness app for beginners. It should provide APIs and server-side capabilities for user profiles, workout plans, nutrition plans, saved items, AI orchestration, and future commercial features.

Read the root `PRODUCT_CONTEXT.md` before making product or API decisions.

## Tech stack

- Framework: NestJS.
- Language: TypeScript.
- Package manager: npm.
- Database direction: PostgreSQL.

PostgreSQL is the intended SQL database for the backend. Do not add ORM, migration tooling, authentication, payment, queue, AI provider, or infrastructure dependencies without user approval.

## Repository boundary

`backend/` is its own local git repository. Work inside this directory for backend changes and do not clean, reset, or commit the parent ForgeAI repository unless the user explicitly asks.

## Architecture rules

- Organize code by product feature, not by technical layer alone.
- Keep `AppModule` small. Feature modules should own their controllers, services, DTOs, and tests.
- Controllers are thin HTTP adapters: validate boundary input, call one service/use-case method, and return an explicit response shape.
- Services own application use cases and orchestration. Do not turn services into unrelated utility buckets.
- Keep pure domain logic in focused private methods or small injectable collaborators when it becomes independently testable.
- Do not introduce global state, hidden side effects, or cross-feature imports that bypass module boundaries.

## Suggested module direction

Prefer clear NestJS modules as the backend grows:

- `auth`: authentication and sessions when the auth strategy is chosen.
- `users`: user profile, goals, settings, and preferences.
- `workouts`: exercises, workout plans, substitutions, and workout history.
- `nutrition`: meals, meal plans, dietary preferences, and saved meals.
- `plans`: generated weekly plans that combine training and nutrition.
- `ai`: AI prompt orchestration, model calls, safety constraints, and generated recommendations.

Keep module boundaries product-oriented and avoid placing unrelated logic in `AppModule`.

## File and naming rules

Use NestJS naming conventions consistently:

- Modules: `*.module.ts`
- Controllers: `*.controller.ts`
- Services/use cases: `*.service.ts`
- DTOs: `dto/*.dto.ts`
- Entities or persistence models: `entities/*.entity.ts` or `models/*.model.ts`
- Interfaces: `interfaces/*.interface.ts`
- Constants: `*.constants.ts`
- Tests: `*.spec.ts`

Prefer explicit names such as `CreateWorkoutPlanDto` and `WorkoutPlansService` over generic names like `DataDto`, `Manager`, or `Helper`.

## API design principles

- Design APIs around mobile workflows, not database tables.
- Keep beginner safety in mind for workouts and nutrition.
- Validate external input at API boundaries.
- Return explicit response objects; do not leak raw persistence entities as API responses unless explicitly designed.
- Avoid medical claims, unsafe diet advice, or dangerous workout recommendations.
- Keep generated AI output auditable and tied to user context when possible.

## TypeScript and clean code rules

- Do not use `any`. Model unknown external data as `unknown`, validate it, then narrow it.
- Prefer `readonly` for injected dependencies and immutable fields.
- Use `import type` for type-only imports.
- Avoid magic strings and magic numbers in business logic; promote repeated values to named constants.
- Do not write broad catch blocks unless the code adds context, maps the error, or performs a required cleanup.
- Never swallow errors silently.
- Do not use direct `console` logging. Use NestJS logging patterns when logging is needed.
- Keep functions focused. If a method needs multiple unrelated comments to explain its branches, split it.
- Do not add abstractions for hypothetical future requirements.

## Testing rules

- New services need unit tests for success and failure paths.
- Controllers need tests for boundary behavior when request/response mapping is non-trivial.
- Prefer testing observable behavior over implementation details.
- Do not mock code so deeply that the test only proves the mock setup.

## Commands

Run commands from `backend/` or use npm prefix from the repository root.

```bash
npm run lint:check
npm run build
npm test
npm run start:dev
```

Before reporting backend work as done, run the relevant test or build command. For code changes, prefer `npm run lint:check` and `npm run build` as the minimum verification gate.
```

- [ ] **Step 2: Review for accidental dependency permission changes**

Confirm the file still says not to add ORM, migration tooling, authentication, payment, queue, AI provider, or infrastructure dependencies without user approval.

## Task 4: Strengthen ESLint flat config

**Files:**
- Modify: `backend/eslint.config.mjs`

- [ ] **Step 1: Replace ESLint config**

Replace `backend/eslint.config.mjs` with this content:

```js
// @ts-check
import eslint from '@eslint/js';
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended';
import globals from 'globals';
import simpleImportSort from 'eslint-plugin-simple-import-sort';
import sonarjs from 'eslint-plugin-sonarjs';
import tseslint from 'typescript-eslint';
import unicorn from 'eslint-plugin-unicorn';

export default tseslint.config(
  {
    ignores: ['dist/**', 'coverage/**', 'node_modules/**', 'eslint.config.mjs'],
  },
  eslint.configs.recommended,
  ...tseslint.configs.strictTypeChecked,
  ...tseslint.configs.stylisticTypeChecked,
  sonarjs.configs.recommended,
  eslintPluginPrettierRecommended,
  {
    files: ['**/*.ts'],
    plugins: {
      'simple-import-sort': simpleImportSort,
      unicorn,
    },
    languageOptions: {
      globals: {
        ...globals.node,
        ...globals.jest,
      },
      sourceType: 'module',
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
    rules: {
      '@typescript-eslint/consistent-type-imports': [
        'error',
        {
          fixStyle: 'inline-type-imports',
          prefer: 'type-imports',
        },
      ],
      '@typescript-eslint/explicit-function-return-type': [
        'error',
        {
          allowExpressions: true,
          allowTypedFunctionExpressions: true,
        },
      ],
      '@typescript-eslint/no-confusing-void-expression': [
        'error',
        {
          ignoreArrowShorthand: true,
        },
      ],
      '@typescript-eslint/no-explicit-any': 'error',
      '@typescript-eslint/no-floating-promises': 'error',
      '@typescript-eslint/no-misused-promises': 'error',
      '@typescript-eslint/no-unnecessary-condition': 'error',
      '@typescript-eslint/no-unsafe-argument': 'error',
      '@typescript-eslint/no-unsafe-assignment': 'error',
      '@typescript-eslint/no-unsafe-call': 'error',
      '@typescript-eslint/no-unsafe-member-access': 'error',
      '@typescript-eslint/no-unsafe-return': 'error',
      '@typescript-eslint/prefer-readonly': 'error',
      '@typescript-eslint/restrict-template-expressions': [
        'error',
        {
          allowBoolean: true,
          allowNever: false,
          allowNullish: false,
          allowNumber: true,
          allowRegExp: false,
        },
      ],
      '@typescript-eslint/switch-exhaustiveness-check': 'error',
      'no-console': 'error',
      'no-duplicate-imports': 'error',
      'no-implicit-coercion': 'error',
      'no-useless-catch': 'error',
      'prefer-const': 'error',
      'prettier/prettier': ['error', { endOfLine: 'auto' }],
      'simple-import-sort/exports': 'error',
      'simple-import-sort/imports': 'error',
      'sonarjs/cognitive-complexity': ['error', 12],
      'sonarjs/no-duplicate-string': ['error', { threshold: 5 }],
      'unicorn/filename-case': [
        'error',
        {
          cases: {
            kebabCase: true,
          },
        },
      ],
      'unicorn/no-null': 'off',
      'unicorn/prevent-abbreviations': 'off',
      'unicorn/prefer-module': 'off',
    },
  },
  {
    files: ['**/*.spec.ts', 'test/**/*.ts'],
    rules: {
      '@typescript-eslint/no-unsafe-assignment': 'off',
      '@typescript-eslint/no-unsafe-call': 'off',
      '@typescript-eslint/no-unsafe-member-access': 'off',
      '@typescript-eslint/unbound-method': 'off',
      'sonarjs/no-duplicate-string': 'off',
    },
  },
);
```

- [ ] **Step 2: Add lint check script**

Update `backend/package.json` scripts so this exact script exists:

```json
{
  "scripts": {
    "lint:check": "eslint \"{src,apps,libs,test}/**/*.ts\""
  }
}
```

Keep the existing `lint` script with `--fix`.

## Task 5: Run strict lint and fix current backend issues

**Files:**
- Modify as needed: `backend/src/**/*.ts`
- Modify as needed: `backend/test/**/*.ts`

- [ ] **Step 1: Run lint check**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend run lint:check
```

Expected: it may fail because the rules are stricter than the starter NestJS code.

- [ ] **Step 2: Run auto-fix once**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend run lint
```

Expected: formatting and import order issues are fixed automatically.

- [ ] **Step 3: Re-run lint check**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend run lint:check
```

Expected: either PASS or a smaller list of semantic errors remains.

- [ ] **Step 4: Fix semantic lint errors minimally**

For common NestJS starter issues, apply minimal fixes:

- Add explicit return types to controller/service methods.
- Mark constructor-injected dependencies as `private readonly`.
- Convert type-only imports to `import type`.
- Replace unsafe test mocks with typed Jest mocks where needed.
- Do not weaken lint rules unless a rule is incompatible with NestJS or the current TypeScript setup.

- [ ] **Step 5: Confirm lint passes**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend run lint:check
```

Expected: PASS with exit code 0.

## Task 6: Build and test backend

**Files:**
- No planned file edits unless validation reveals issues.

- [ ] **Step 1: Run build**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend run build
```

Expected: PASS with exit code 0 and generated `backend/dist/` ignored by git.

- [ ] **Step 2: Run tests**

```bash
npm --prefix /home/hoanle0126/PersonalProject/ForgeAI/backend test
```

Expected: PASS with exit code 0.

## Task 7: Commit backend repo baseline locally

**Files:**
- Commit in nested repo: `backend/`
- Do not commit in parent repo.

- [ ] **Step 1: Review backend repo changes**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend status --short
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend diff -- package.json eslint.config.mjs AGENTS.md
```

Expected: changes are limited to backend repo files and generated lockfile, plus any minimal starter code fixes.

- [ ] **Step 2: Stage backend files explicitly**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend add AGENTS.md eslint.config.mjs package.json package-lock.json nest-cli.json tsconfig.json tsconfig.build.json src test .gitignore README.md
```

Expected: tracked files exclude `node_modules/`, `dist/`, and `coverage/`.

- [ ] **Step 3: Commit backend baseline**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI/backend commit -m "$(cat <<'EOF'
chore: initialize backend repository baseline

Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>
EOF
)"
```

Expected: a new local commit is created in the backend repo.

- [ ] **Step 4: Confirm parent repo was not committed**

```bash
git -C /home/hoanle0126/PersonalProject/ForgeAI status --short backend
```

Expected: parent repo may show `backend` as an untracked or modified nested repository entry, but no parent commit is created.

---

## Self-Review Notes

- Spec coverage: repo initialization, strict backend rules, lint plugins/config, scripts, validation, and local backend commit are covered.
- Placeholder scan: no TBD/TODO placeholders are present.
- Type consistency: all paths use `/home/hoanle0126/PersonalProject/ForgeAI/backend`; scripts use existing npm/NestJS setup.
