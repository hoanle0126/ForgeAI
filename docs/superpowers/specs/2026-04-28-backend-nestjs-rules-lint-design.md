# Backend NestJS Rules and Strict Lint Design

## Goal

Set a strict backend code quality baseline while the NestJS backend is still small. Future generated backend code should follow clear NestJS boundaries, strong TypeScript safety, and repeatable validation gates.

## Scope

Update backend guidance and lint configuration only:

- Expand `backend/AGENTS.md` with strict NestJS backend rules for AI agents.
- Strengthen `backend/eslint.config.mjs` with type-aware clean-code rules.
- Update `backend/package.json` scripts and dev dependencies needed by the lint configuration.
- Fix any small existing backend lint/build issues caused by the stricter rules.

Do not introduce ORM, database migrations, authentication, payment, queue, or AI provider dependencies.

## Backend rules

`backend/AGENTS.md` will become the source of truth for backend generation rules. It will cover:

- Feature-first NestJS modules with product-oriented boundaries.
- Thin controllers: request/response mapping only, no business logic.
- Services as use-case orchestration, not generic utility buckets.
- DTOs for external input and explicit response shapes for output.
- Validation at API boundaries and no silent error swallowing.
- No raw entity/domain object exposure as API responses unless explicitly designed.
- No direct `console` logging; use NestJS logging patterns when logging is needed.
- No `any`, magic strings, hidden side effects, broad catch blocks, or premature abstractions.
- Required checks before reporting backend work complete: lint check, build, and relevant tests.

## Lint design

The ESLint setup will be intentionally strict because backend code is early-stage.

Planned rule groups:

- Type safety: disallow explicit `any`, unsafe assignment/call/member access/return, floating promises, and misused promises.
- Import hygiene: sorted imports, no duplicate imports, consistent type imports.
- Clean code: cognitive-complexity limits, duplicate branch detection, useless catch prevention, empty function prevention, and readonly preferences where practical.
- Backend hygiene: disallow direct `console`, implicit coercion, unnecessary conditions, and overly loose template expressions.

Dev dependencies may include focused lint plugins such as `eslint-plugin-simple-import-sort`, `eslint-plugin-sonarjs`, and `eslint-plugin-unicorn` if compatible with the existing ESLint 9 flat config.

## Scripts

Keep the existing auto-fix lint script and add a non-mutating gate:

- `lint`: auto-fix lint issues for local cleanup.
- `lint:check`: run lint without `--fix` for verification and CI-style checks.

## Validation

After implementation:

1. Install any new backend dev dependencies.
2. Run `npm run lint:check` in `backend/`.
3. Run `npm run build` in `backend/`.
4. Run `npm test` in `backend/` if the test suite is stable.

Any failures caused by the new strict baseline should be fixed in the existing backend files rather than weakening rules, unless a rule proves incompatible with NestJS or TypeScript configuration.
