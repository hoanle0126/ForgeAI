# Backend Onboarding AI Recommendation MVP Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Xây backend MVP để sau đăng ký user hoàn tất onboarding, AI API phân tích lựa chọn thành fitness profile có cấu trúc, rồi hệ thống tạo workout/nutrition recommendation an toàn từ rule nội bộ.

**Architecture:** Dùng NestJS module hóa theo `OnboardingModule`, `AiAnalysisModule`, `RecommendationModule`, và `ExerciseLibraryModule`. AI API chỉ được dùng để phân tích intent/profile thành JSON có schema; việc chọn bài tập và dinh dưỡng dùng rule engine deterministic từ dữ liệu nội bộ để tránh AI bịa bài tập hoặc đưa lời khuyên không kiểm soát.

**Tech Stack:** NestJS 11, TypeScript, Prisma 6, PostgreSQL, Jest, Supertest, Google Gemini API qua HTTPS fetch hoặc provider interface có thể thay thế sau này.

---

## Phạm vi MVP

MVP này tập trung vào backend, chưa làm UI mobile/frontend.

Luồng chính:

```text
User đăng ký / đăng nhập
  ↓
Frontend gọi GET /onboarding/questions
  ↓
User trả lời onboarding
  ↓
Frontend gọi POST /onboarding/submit
  ↓
Backend gọi AI API để phân tích thành structured profile
  ↓
Backend validate profile
  ↓
Backend tạo workout recommendation + nutrition recommendation bằng rule nội bộ
  ↓
Backend lưu profile, answers, plan
  ↓
Frontend gọi GET /recommendations/current để lấy plan hiện tại
```

Nguyên tắc quan trọng:

- AI không được tự tạo danh sách bài tập ngoài database nội bộ.
- AI không được trả lời text tự do cho logic backend; backend chỉ nhận JSON đúng schema.
- Nếu AI lỗi, backend dùng fallback deterministic analyzer để vẫn tạo profile cơ bản.
- Recommendation phải phân biệt user `guided` và `self_directed`.
- MVP không xử lý bệnh lý/y tế chuyên sâu. Các hạn chế như đau gối/đau lưng chỉ dùng để tránh bài tập rủi ro cao.

---

## File Structure

### Prisma/database

- Modify: `backend/prisma/schema.prisma`
  - Thêm enum onboarding, model lưu answers, fitness profile, exercise, workout plan, nutrition plan.
- Create: `backend/prisma/seed.ts`
  - Seed exercise library MVP.
- Modify: `backend/package.json`
  - Thêm script `prisma:seed` nếu chưa có.

### App module

- Modify: `backend/src/app.module.ts`
  - Import các module mới.

### Common auth/context

- Existing: `backend/src/common/guards/jwt-auth.guard.ts`
  - Tái sử dụng cho endpoint onboarding/recommendation.

### Onboarding module

- Create: `backend/src/onboarding/onboarding.module.ts`
- Create: `backend/src/onboarding/onboarding.controller.ts`
- Create: `backend/src/onboarding/onboarding.service.ts`
- Create: `backend/src/onboarding/onboarding.questions.ts`
- Create: `backend/src/onboarding/dto/submit-onboarding.dto.ts`
- Create: `backend/src/onboarding/types/onboarding-answer.type.ts`

Trách nhiệm:

- Trả danh sách câu hỏi onboarding.
- Nhận câu trả lời của user.
- Lưu answers.
- Gọi AI analyzer.
- Gọi recommendation service.
- Đánh dấu onboarding hoàn tất.

### AI analysis module

- Create: `backend/src/ai-analysis/ai-analysis.module.ts`
- Create: `backend/src/ai-analysis/ai-analysis.service.ts`
- Create: `backend/src/ai-analysis/ai-provider.interface.ts`
- Create: `backend/src/ai-analysis/gemini-ai.provider.ts`
- Create: `backend/src/ai-analysis/fallback-fitness-profile.analyzer.ts`
- Create: `backend/src/ai-analysis/schemas/fitness-profile.schema.ts`
- Create: `backend/src/ai-analysis/types/fitness-profile-analysis.type.ts`

Trách nhiệm:

- Đóng gói việc gọi AI API.
- Ép output thành schema nội bộ.
- Có fallback khi AI lỗi.
- Không chứa logic chọn bài tập cụ thể.

### Exercise library module

- Create: `backend/src/exercise-library/exercise-library.module.ts`
- Create: `backend/src/exercise-library/exercise-library.service.ts`
- Create: `backend/src/exercise-library/types/exercise-filter.type.ts`

Trách nhiệm:

- Query exercise từ database theo equipment, level, goal, contraindications.
- Không gọi AI.

### Recommendation module

- Create: `backend/src/recommendation/recommendation.module.ts`
- Create: `backend/src/recommendation/recommendation.controller.ts`
- Create: `backend/src/recommendation/recommendation.service.ts`
- Create: `backend/src/recommendation/workout-plan.builder.ts`
- Create: `backend/src/recommendation/nutrition-plan.builder.ts`
- Create: `backend/src/recommendation/types/recommendation.type.ts`

Trách nhiệm:

- Tạo workout plan từ fitness profile + exercise library.
- Tạo nutrition summary từ fitness profile.
- Trả current recommendation cho user.

### Tests

- Create: `backend/src/ai-analysis/fallback-fitness-profile.analyzer.spec.ts`
- Create: `backend/src/recommendation/workout-plan.builder.spec.ts`
- Create: `backend/src/recommendation/nutrition-plan.builder.spec.ts`
- Create: `backend/test/onboarding.e2e-spec.ts`
- Create: `backend/test/recommendation.e2e-spec.ts`

---

## Domain model đề xuất

### User mode

```ts
export type UserFitnessMode = 'guided' | 'self_directed' | 'routine_review';
```

Ý nghĩa:

- `guided`: user muốn app tạo lộ trình.
- `self_directed`: user đã có routine, chỉ cần lưu/tracking.
- `routine_review`: user có routine nhưng muốn AI phân tích sau.

### Fitness profile analysis

```ts
export type FitnessProfileAnalysis = {
  userMode: 'guided' | 'self_directed' | 'routine_review';
  experienceLevel: 'beginner' | 'returning' | 'intermediate' | 'advanced';
  primaryGoal: 'fat_loss' | 'muscle_gain' | 'strength' | 'endurance' | 'general_fitness';
  trainingLocation: 'home' | 'gym' | 'outdoor' | 'mixed';
  weeklySessions: 2 | 3 | 4 | 5 | 6;
  sessionDurationMinutes: 20 | 30 | 45 | 60 | 75;
  equipment: string[];
  limitations: string[];
  nutritionGoal: 'calorie_deficit' | 'maintenance' | 'lean_bulk' | 'habit_improvement';
  recommendationStrategy:
    | 'beginner_full_body_low_impact'
    | 'beginner_full_body'
    | 'home_fat_loss'
    | 'upper_lower_hypertrophy'
    | 'strength_foundation'
    | 'journal_only';
  needsWorkoutRecommendation: boolean;
  needsNutritionRecommendation: boolean;
  confidence: number;
};
```

---

## Task 1: Thêm Prisma schema cho onboarding và recommendation

**Files:**

- Modify: `backend/prisma/schema.prisma`
- Test: `backend/prisma/schema.prisma` qua `npx prisma validate`

- [ ] **Step 1: Cập nhật schema Prisma**

Thêm các enum/model sau vào cuối `backend/prisma/schema.prisma`, đồng thời thêm relation vào `User`.

Trong model `User`, đổi từ:

```prisma
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
```

thành:

```prisma
model User {
  id                  String               @id @default(uuid())
  fullName            String
  email               String               @unique
  passwordHash        String
  gender              Gender
  dateOfBirth         DateTime
  createdAt           DateTime             @default(now())
  updatedAt           DateTime             @updatedAt
  refreshTokens       RefreshToken[]
  onboardingResponses OnboardingResponse[]
  fitnessProfile      FitnessProfile?
  workoutPlans        WorkoutPlan[]
  nutritionPlans      NutritionPlan[]
}
```

Thêm dưới model `RefreshToken`:

```prisma
enum UserFitnessMode {
  guided
  self_directed
  routine_review
}

enum ExperienceLevel {
  beginner
  returning
  intermediate
  advanced
}

enum FitnessGoal {
  fat_loss
  muscle_gain
  strength
  endurance
  general_fitness
}

enum TrainingLocation {
  home
  gym
  outdoor
  mixed
}

enum NutritionGoal {
  calorie_deficit
  maintenance
  lean_bulk
  habit_improvement
}

enum RecommendationStrategy {
  beginner_full_body_low_impact
  beginner_full_body
  home_fat_loss
  upper_lower_hypertrophy
  strength_foundation
  journal_only
}

enum WorkoutPlanStatus {
  active
  archived
}

model OnboardingResponse {
  id        String   @id @default(uuid())
  userId    String
  answers   Json
  createdAt DateTime @default(now())
  user      User     @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId])
  @@index([createdAt])
}

model FitnessProfile {
  id                         String                 @id @default(uuid())
  userId                     String                 @unique
  userMode                   UserFitnessMode
  experienceLevel            ExperienceLevel
  primaryGoal                FitnessGoal
  trainingLocation           TrainingLocation
  weeklySessions             Int
  sessionDurationMinutes     Int
  equipment                  String[]
  limitations                String[]
  nutritionGoal              NutritionGoal
  recommendationStrategy     RecommendationStrategy
  needsWorkoutRecommendation Boolean
  needsNutritionRecommendation Boolean
  confidence                 Float
  analysisSource             String
  createdAt                  DateTime               @default(now())
  updatedAt                  DateTime               @updatedAt
  user                       User                   @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userMode])
  @@index([primaryGoal])
}

model Exercise {
  id                String   @id @default(uuid())
  slug              String   @unique
  name              String
  muscleGroups      String[]
  equipment         String[]
  difficulty        ExperienceLevel
  movementPattern   String
  goalTags          FitnessGoal[]
  contraindications String[]
  instructions      String
  sourceName        String
  sourceUrl         String?
  createdAt         DateTime @default(now())
  updatedAt         DateTime @updatedAt
}

model WorkoutPlan {
  id          String            @id @default(uuid())
  userId      String
  title       String
  summary     String
  strategy    RecommendationStrategy
  status      WorkoutPlanStatus @default(active)
  days        Json
  createdAt   DateTime          @default(now())
  updatedAt   DateTime          @updatedAt
  user        User              @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId])
  @@index([status])
}

model NutritionPlan {
  id        String        @id @default(uuid())
  userId    String
  title     String
  summary   String
  goal      NutritionGoal
  targets   Json
  guidance  Json
  createdAt DateTime      @default(now())
  updatedAt DateTime      @updatedAt
  user      User          @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId])
}
```

- [ ] **Step 2: Validate Prisma schema**

Run:

```bash
cd backend && npx prisma validate
```

Expected:

```text
The schema at prisma/schema.prisma is valid
```

- [ ] **Step 3: Tạo migration**

Run:

```bash
cd backend && npm run prisma:migrate:dev -- --name onboarding_ai_recommendation
```

Expected:

```text
Your database is now in sync with your schema.
```

- [ ] **Step 4: Generate Prisma client**

Run:

```bash
cd backend && npm run prisma:generate
```

Expected:

```text
Generated Prisma Client
```

- [ ] **Step 5: Commit**

```bash
git add backend/prisma/schema.prisma backend/prisma/migrations backend/package-lock.json
git commit -m "feat(backend): add onboarding recommendation schema"
```

---

## Task 2: Tạo onboarding questions và DTO validation

**Files:**

- Create: `backend/src/onboarding/types/onboarding-answer.type.ts`
- Create: `backend/src/onboarding/onboarding.questions.ts`
- Create: `backend/src/onboarding/dto/submit-onboarding.dto.ts`
- Test: `backend/src/onboarding/dto/submit-onboarding.dto.spec.ts`

- [ ] **Step 1: Viết failing test cho DTO**

Create `backend/src/onboarding/dto/submit-onboarding.dto.spec.ts`:

```ts
import { validate } from 'class-validator';
import { plainToInstance } from 'class-transformer';
import { SubmitOnboardingDto } from './submit-onboarding.dto';

describe('SubmitOnboardingDto', () => {
  it('accepts valid onboarding answers', async () => {
    const dto = plainToInstance(SubmitOnboardingDto, {
      answers: [
        { questionId: 'mode', value: 'guided' },
        { questionId: 'primary_goal', value: 'fat_loss' },
        { questionId: 'experience_level', value: 'beginner' },
      ],
    });

    await expect(validate(dto)).resolves.toHaveLength(0);
  });

  it('rejects empty answers', async () => {
    const dto = plainToInstance(SubmitOnboardingDto, { answers: [] });

    const errors = await validate(dto);

    expect(errors).toHaveLength(1);
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- onboarding/dto/submit-onboarding.dto.spec.ts
```

Expected: FAIL vì `SubmitOnboardingDto` chưa tồn tại.

- [ ] **Step 3: Tạo type onboarding answer**

Create `backend/src/onboarding/types/onboarding-answer.type.ts`:

```ts
export type OnboardingAnswerValue = string | string[] | number | boolean;

export type OnboardingAnswer = {
  questionId: string;
  value: OnboardingAnswerValue;
};

export type OnboardingQuestion = {
  id: string;
  title: string;
  description?: string;
  type: 'single_choice' | 'multi_choice' | 'number';
  required: boolean;
  options?: Array<{
    label: string;
    value: string;
  }>;
};
```

- [ ] **Step 4: Tạo onboarding questions**

Create `backend/src/onboarding/onboarding.questions.ts`:

```ts
import { OnboardingQuestion } from './types/onboarding-answer.type';

export const ONBOARDING_QUESTIONS: OnboardingQuestion[] = [
  {
    id: 'mode',
    title: 'Bạn muốn ForgeAI hỗ trợ theo cách nào?',
    type: 'single_choice',
    required: true,
    options: [
      { label: 'Tạo lộ trình tập và ăn uống cho tôi', value: 'guided' },
      { label: 'Tôi đã có routine, chỉ muốn lưu và tracking', value: 'self_directed' },
      { label: 'Tôi muốn AI phân tích routine hiện tại', value: 'routine_review' },
    ],
  },
  {
    id: 'primary_goal',
    title: 'Mục tiêu chính của bạn là gì?',
    type: 'single_choice',
    required: true,
    options: [
      { label: 'Giảm mỡ', value: 'fat_loss' },
      { label: 'Tăng cơ', value: 'muscle_gain' },
      { label: 'Tăng sức mạnh', value: 'strength' },
      { label: 'Tăng sức bền', value: 'endurance' },
      { label: 'Khỏe hơn và duy trì vóc dáng', value: 'general_fitness' },
    ],
  },
  {
    id: 'experience_level',
    title: 'Kinh nghiệm tập luyện của bạn?',
    type: 'single_choice',
    required: true,
    options: [
      { label: 'Mới bắt đầu', value: 'beginner' },
      { label: 'Tập lại sau thời gian nghỉ', value: 'returning' },
      { label: 'Đã tập đều', value: 'intermediate' },
      { label: 'Nâng cao', value: 'advanced' },
    ],
  },
  {
    id: 'training_location',
    title: 'Bạn thường tập ở đâu?',
    type: 'single_choice',
    required: true,
    options: [
      { label: 'Ở nhà', value: 'home' },
      { label: 'Phòng gym', value: 'gym' },
      { label: 'Ngoài trời', value: 'outdoor' },
      { label: 'Kết hợp nhiều nơi', value: 'mixed' },
    ],
  },
  {
    id: 'weekly_sessions',
    title: 'Bạn muốn tập mấy buổi mỗi tuần?',
    type: 'single_choice',
    required: true,
    options: [
      { label: '2 buổi', value: '2' },
      { label: '3 buổi', value: '3' },
      { label: '4 buổi', value: '4' },
      { label: '5 buổi', value: '5' },
      { label: '6 buổi', value: '6' },
    ],
  },
  {
    id: 'session_duration_minutes',
    title: 'Mỗi buổi bạn muốn tập khoảng bao lâu?',
    type: 'single_choice',
    required: true,
    options: [
      { label: '20 phút', value: '20' },
      { label: '30 phút', value: '30' },
      { label: '45 phút', value: '45' },
      { label: '60 phút', value: '60' },
      { label: '75 phút', value: '75' },
    ],
  },
  {
    id: 'equipment',
    title: 'Bạn có thiết bị nào?',
    type: 'multi_choice',
    required: true,
    options: [
      { label: 'Không dụng cụ', value: 'bodyweight' },
      { label: 'Dumbbell', value: 'dumbbell' },
      { label: 'Resistance band', value: 'band' },
      { label: 'Phòng gym đầy đủ', value: 'full_gym' },
    ],
  },
  {
    id: 'limitations',
    title: 'Bạn có hạn chế nào cần tránh?',
    type: 'multi_choice',
    required: false,
    options: [
      { label: 'Không có', value: 'none' },
      { label: 'Đau gối', value: 'knee_sensitive' },
      { label: 'Đau lưng', value: 'back_sensitive' },
      { label: 'Đau vai', value: 'shoulder_sensitive' },
      { label: 'Tránh động tác high-impact', value: 'avoid_high_impact' },
    ],
  },
  {
    id: 'nutrition_goal',
    title: 'Bạn muốn định hướng ăn uống thế nào?',
    type: 'single_choice',
    required: true,
    options: [
      { label: 'Giảm calo nhẹ để giảm mỡ', value: 'calorie_deficit' },
      { label: 'Giữ cân và ăn ổn định hơn', value: 'maintenance' },
      { label: 'Tăng cân/tăng cơ có kiểm soát', value: 'lean_bulk' },
      { label: 'Cải thiện thói quen ăn uống', value: 'habit_improvement' },
    ],
  },
];
```

- [ ] **Step 5: Tạo DTO**

Create `backend/src/onboarding/dto/submit-onboarding.dto.ts`:

```ts
import { Type } from 'class-transformer';
import {
  ArrayMinSize,
  IsArray,
  IsBoolean,
  IsNumber,
  IsString,
  ValidateNested,
} from 'class-validator';

class OnboardingAnswerDto {
  @IsString()
  questionId!: string;

  @IsString({ each: true })
  value!: string | string[] | number | boolean;
}

export class SubmitOnboardingDto {
  @IsArray()
  @ArrayMinSize(1)
  @ValidateNested({ each: true })
  @Type(() => OnboardingAnswerDto)
  answers!: OnboardingAnswerDto[];
}
```

Nếu TypeScript hoặc lint báo `IsNumber`/`IsBoolean` không dùng, bỏ import đó và giữ DTO tối giản:

```ts
import { Type } from 'class-transformer';
import { ArrayMinSize, IsArray, IsString, ValidateNested } from 'class-validator';
```

- [ ] **Step 6: Run test để pass**

Run:

```bash
cd backend && npm test -- onboarding/dto/submit-onboarding.dto.spec.ts
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add backend/src/onboarding
git commit -m "feat(backend): define onboarding questions"
```

---

## Task 3: Tạo fallback fitness profile analyzer

**Files:**

- Create: `backend/src/ai-analysis/types/fitness-profile-analysis.type.ts`
- Create: `backend/src/ai-analysis/fallback-fitness-profile.analyzer.ts`
- Test: `backend/src/ai-analysis/fallback-fitness-profile.analyzer.spec.ts`

- [ ] **Step 1: Viết failing tests**

Create `backend/src/ai-analysis/fallback-fitness-profile.analyzer.spec.ts`:

```ts
import { analyzeWithFallback } from './fallback-fitness-profile.analyzer';

describe('analyzeWithFallback', () => {
  it('classifies guided beginner fat loss at home as low impact when knee sensitive', () => {
    const result = analyzeWithFallback([
      { questionId: 'mode', value: 'guided' },
      { questionId: 'primary_goal', value: 'fat_loss' },
      { questionId: 'experience_level', value: 'beginner' },
      { questionId: 'training_location', value: 'home' },
      { questionId: 'weekly_sessions', value: '3' },
      { questionId: 'session_duration_minutes', value: '45' },
      { questionId: 'equipment', value: ['bodyweight', 'dumbbell'] },
      { questionId: 'limitations', value: ['knee_sensitive'] },
      { questionId: 'nutrition_goal', value: 'calorie_deficit' },
    ]);

    expect(result).toMatchObject({
      userMode: 'guided',
      experienceLevel: 'beginner',
      primaryGoal: 'fat_loss',
      trainingLocation: 'home',
      weeklySessions: 3,
      sessionDurationMinutes: 45,
      recommendationStrategy: 'beginner_full_body_low_impact',
      needsWorkoutRecommendation: true,
      needsNutritionRecommendation: true,
    });
  });

  it('classifies self directed users as journal only', () => {
    const result = analyzeWithFallback([
      { questionId: 'mode', value: 'self_directed' },
      { questionId: 'primary_goal', value: 'muscle_gain' },
      { questionId: 'experience_level', value: 'intermediate' },
      { questionId: 'training_location', value: 'gym' },
      { questionId: 'weekly_sessions', value: '4' },
      { questionId: 'session_duration_minutes', value: '60' },
      { questionId: 'equipment', value: ['full_gym'] },
      { questionId: 'nutrition_goal', value: 'maintenance' },
    ]);

    expect(result).toMatchObject({
      userMode: 'self_directed',
      recommendationStrategy: 'journal_only',
      needsWorkoutRecommendation: false,
      needsNutritionRecommendation: false,
    });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- ai-analysis/fallback-fitness-profile.analyzer.spec.ts
```

Expected: FAIL vì analyzer chưa tồn tại.

- [ ] **Step 3: Tạo type analysis**

Create `backend/src/ai-analysis/types/fitness-profile-analysis.type.ts`:

```ts
export type UserFitnessMode = 'guided' | 'self_directed' | 'routine_review';
export type ExperienceLevel = 'beginner' | 'returning' | 'intermediate' | 'advanced';
export type FitnessGoal = 'fat_loss' | 'muscle_gain' | 'strength' | 'endurance' | 'general_fitness';
export type TrainingLocation = 'home' | 'gym' | 'outdoor' | 'mixed';
export type NutritionGoal = 'calorie_deficit' | 'maintenance' | 'lean_bulk' | 'habit_improvement';
export type RecommendationStrategy =
  | 'beginner_full_body_low_impact'
  | 'beginner_full_body'
  | 'home_fat_loss'
  | 'upper_lower_hypertrophy'
  | 'strength_foundation'
  | 'journal_only';

export type FitnessProfileAnalysis = {
  userMode: UserFitnessMode;
  experienceLevel: ExperienceLevel;
  primaryGoal: FitnessGoal;
  trainingLocation: TrainingLocation;
  weeklySessions: 2 | 3 | 4 | 5 | 6;
  sessionDurationMinutes: 20 | 30 | 45 | 60 | 75;
  equipment: string[];
  limitations: string[];
  nutritionGoal: NutritionGoal;
  recommendationStrategy: RecommendationStrategy;
  needsWorkoutRecommendation: boolean;
  needsNutritionRecommendation: boolean;
  confidence: number;
};
```

- [ ] **Step 4: Tạo fallback analyzer**

Create `backend/src/ai-analysis/fallback-fitness-profile.analyzer.ts`:

```ts
import { OnboardingAnswer } from '../onboarding/types/onboarding-answer.type';
import {
  ExperienceLevel,
  FitnessGoal,
  FitnessProfileAnalysis,
  NutritionGoal,
  RecommendationStrategy,
  TrainingLocation,
  UserFitnessMode,
} from './types/fitness-profile-analysis.type';

const getValue = (answers: OnboardingAnswer[], questionId: string): unknown =>
  answers.find((answer) => answer.questionId === questionId)?.value;

const toStringArray = (value: unknown): string[] => {
  if (Array.isArray(value)) {
    return value.map(String);
  }

  if (typeof value === 'string' && value.length > 0) {
    return [value];
  }

  return [];
};

const toWeeklySessions = (value: unknown): 2 | 3 | 4 | 5 | 6 => {
  const parsed = Number(value);

  if (parsed === 2 || parsed === 3 || parsed === 4 || parsed === 5 || parsed === 6) {
    return parsed;
  }

  return 3;
};

const toSessionDuration = (value: unknown): 20 | 30 | 45 | 60 | 75 => {
  const parsed = Number(value);

  if (parsed === 20 || parsed === 30 || parsed === 45 || parsed === 60 || parsed === 75) {
    return parsed;
  }

  return 45;
};

const chooseStrategy = (input: {
  userMode: UserFitnessMode;
  experienceLevel: ExperienceLevel;
  primaryGoal: FitnessGoal;
  trainingLocation: TrainingLocation;
  limitations: string[];
}): RecommendationStrategy => {
  if (input.userMode === 'self_directed') {
    return 'journal_only';
  }

  if (input.limitations.includes('knee_sensitive') || input.limitations.includes('avoid_high_impact')) {
    return 'beginner_full_body_low_impact';
  }

  if (input.experienceLevel === 'beginner' || input.experienceLevel === 'returning') {
    return input.primaryGoal === 'fat_loss' && input.trainingLocation === 'home'
      ? 'home_fat_loss'
      : 'beginner_full_body';
  }

  if (input.primaryGoal === 'strength') {
    return 'strength_foundation';
  }

  return 'upper_lower_hypertrophy';
};

export const analyzeWithFallback = (answers: OnboardingAnswer[]): FitnessProfileAnalysis => {
  const userMode = String(getValue(answers, 'mode') ?? 'guided') as UserFitnessMode;
  const experienceLevel = String(getValue(answers, 'experience_level') ?? 'beginner') as ExperienceLevel;
  const primaryGoal = String(getValue(answers, 'primary_goal') ?? 'general_fitness') as FitnessGoal;
  const trainingLocation = String(getValue(answers, 'training_location') ?? 'home') as TrainingLocation;
  const limitations = toStringArray(getValue(answers, 'limitations')).filter((item) => item !== 'none');
  const recommendationStrategy = chooseStrategy({
    userMode,
    experienceLevel,
    primaryGoal,
    trainingLocation,
    limitations,
  });

  return {
    userMode,
    experienceLevel,
    primaryGoal,
    trainingLocation,
    weeklySessions: toWeeklySessions(getValue(answers, 'weekly_sessions')),
    sessionDurationMinutes: toSessionDuration(getValue(answers, 'session_duration_minutes')),
    equipment: toStringArray(getValue(answers, 'equipment')),
    limitations,
    nutritionGoal: String(getValue(answers, 'nutrition_goal') ?? 'habit_improvement') as NutritionGoal,
    recommendationStrategy,
    needsWorkoutRecommendation: recommendationStrategy !== 'journal_only',
    needsNutritionRecommendation: recommendationStrategy !== 'journal_only',
    confidence: 0.65,
  };
};
```

- [ ] **Step 5: Run test để pass**

Run:

```bash
cd backend && npm test -- ai-analysis/fallback-fitness-profile.analyzer.spec.ts
```

Expected: PASS.

- [ ] **Step 6: Commit**

```bash
git add backend/src/ai-analysis backend/src/onboarding/types
git commit -m "feat(backend): add fallback fitness analyzer"
```

---

## Task 4: Thêm AI provider interface và Gemini provider

**Files:**

- Create: `backend/src/ai-analysis/ai-provider.interface.ts`
- Create: `backend/src/ai-analysis/gemini-ai.provider.ts`
- Create: `backend/src/ai-analysis/ai-analysis.service.ts`
- Create: `backend/src/ai-analysis/ai-analysis.module.ts`
- Create: `backend/src/ai-analysis/schemas/fitness-profile.schema.ts`
- Modify: `backend/.env.example`
- Test: `backend/src/ai-analysis/ai-analysis.service.spec.ts`

- [ ] **Step 1: Viết failing test cho AI analysis service fallback**

Create `backend/src/ai-analysis/ai-analysis.service.spec.ts`:

```ts
import { AiAnalysisService } from './ai-analysis.service';
import { AiProvider } from './ai-provider.interface';

describe('AiAnalysisService', () => {
  it('returns provider analysis when provider succeeds', async () => {
    const provider: AiProvider = {
      analyzeFitnessProfile: jest.fn().mockResolvedValue({
        userMode: 'guided',
        experienceLevel: 'beginner',
        primaryGoal: 'fat_loss',
        trainingLocation: 'home',
        weeklySessions: 3,
        sessionDurationMinutes: 45,
        equipment: ['bodyweight'],
        limitations: [],
        nutritionGoal: 'calorie_deficit',
        recommendationStrategy: 'home_fat_loss',
        needsWorkoutRecommendation: true,
        needsNutritionRecommendation: true,
        confidence: 0.9,
      }),
    };
    const service = new AiAnalysisService(provider);

    await expect(service.analyzeFitnessProfile([{ questionId: 'mode', value: 'guided' }])).resolves.toMatchObject({
      confidence: 0.9,
      recommendationStrategy: 'home_fat_loss',
    });
  });

  it('uses fallback when provider fails', async () => {
    const provider: AiProvider = {
      analyzeFitnessProfile: jest.fn().mockRejectedValue(new Error('AI unavailable')),
    };
    const service = new AiAnalysisService(provider);

    await expect(service.analyzeFitnessProfile([{ questionId: 'mode', value: 'self_directed' }])).resolves.toMatchObject({
      recommendationStrategy: 'journal_only',
      confidence: 0.65,
    });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- ai-analysis/ai-analysis.service.spec.ts
```

Expected: FAIL vì service/provider chưa tồn tại.

- [ ] **Step 3: Tạo AI provider interface**

Create `backend/src/ai-analysis/ai-provider.interface.ts`:

```ts
import { OnboardingAnswer } from '../onboarding/types/onboarding-answer.type';
import { FitnessProfileAnalysis } from './types/fitness-profile-analysis.type';

export const AI_PROVIDER = Symbol('AI_PROVIDER');

export type AiProvider = {
  analyzeFitnessProfile(answers: OnboardingAnswer[]): Promise<FitnessProfileAnalysis>;
};
```

- [ ] **Step 4: Tạo schema validator cho AI output**

Create `backend/src/ai-analysis/schemas/fitness-profile.schema.ts`:

```ts
import { FitnessProfileAnalysis } from '../types/fitness-profile-analysis.type';

const allowed = <T extends string>(value: unknown, values: readonly T[]): value is T =>
  typeof value === 'string' && values.includes(value as T);

export const parseFitnessProfileAnalysis = (value: unknown): FitnessProfileAnalysis => {
  if (typeof value !== 'object' || value === null) {
    throw new Error('AI profile analysis must be an object');
  }

  const input = value as Record<string, unknown>;

  if (!allowed(input.userMode, ['guided', 'self_directed', 'routine_review'])) {
    throw new Error('Invalid userMode');
  }

  if (!allowed(input.experienceLevel, ['beginner', 'returning', 'intermediate', 'advanced'])) {
    throw new Error('Invalid experienceLevel');
  }

  if (!allowed(input.primaryGoal, ['fat_loss', 'muscle_gain', 'strength', 'endurance', 'general_fitness'])) {
    throw new Error('Invalid primaryGoal');
  }

  if (!allowed(input.trainingLocation, ['home', 'gym', 'outdoor', 'mixed'])) {
    throw new Error('Invalid trainingLocation');
  }

  if (!allowed(input.nutritionGoal, ['calorie_deficit', 'maintenance', 'lean_bulk', 'habit_improvement'])) {
    throw new Error('Invalid nutritionGoal');
  }

  if (
    !allowed(input.recommendationStrategy, [
      'beginner_full_body_low_impact',
      'beginner_full_body',
      'home_fat_loss',
      'upper_lower_hypertrophy',
      'strength_foundation',
      'journal_only',
    ])
  ) {
    throw new Error('Invalid recommendationStrategy');
  }

  if (!Array.isArray(input.equipment) || !Array.isArray(input.limitations)) {
    throw new Error('Invalid equipment or limitations');
  }

  const weeklySessions = Number(input.weeklySessions);
  const sessionDurationMinutes = Number(input.sessionDurationMinutes);
  const confidence = Number(input.confidence);

  if (![2, 3, 4, 5, 6].includes(weeklySessions)) {
    throw new Error('Invalid weeklySessions');
  }

  if (![20, 30, 45, 60, 75].includes(sessionDurationMinutes)) {
    throw new Error('Invalid sessionDurationMinutes');
  }

  return {
    userMode: input.userMode,
    experienceLevel: input.experienceLevel,
    primaryGoal: input.primaryGoal,
    trainingLocation: input.trainingLocation,
    weeklySessions: weeklySessions as 2 | 3 | 4 | 5 | 6,
    sessionDurationMinutes: sessionDurationMinutes as 20 | 30 | 45 | 60 | 75,
    equipment: input.equipment.map(String),
    limitations: input.limitations.map(String),
    nutritionGoal: input.nutritionGoal,
    recommendationStrategy: input.recommendationStrategy,
    needsWorkoutRecommendation: Boolean(input.needsWorkoutRecommendation),
    needsNutritionRecommendation: Boolean(input.needsNutritionRecommendation),
    confidence: Number.isFinite(confidence) ? Math.max(0, Math.min(1, confidence)) : 0.5,
  };
};
```

- [ ] **Step 5: Tạo Gemini provider**

Create `backend/src/ai-analysis/gemini-ai.provider.ts`:

```ts
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { OnboardingAnswer } from '../onboarding/types/onboarding-answer.type';
import { AiProvider } from './ai-provider.interface';
import { parseFitnessProfileAnalysis } from './schemas/fitness-profile.schema';
import { FitnessProfileAnalysis } from './types/fitness-profile-analysis.type';

@Injectable()
export class GeminiAiProvider implements AiProvider {
  constructor(private readonly configService: ConfigService) {}

  async analyzeFitnessProfile(answers: OnboardingAnswer[]): Promise<FitnessProfileAnalysis> {
    const apiKey = this.configService.get<string>('GEMINI_API_KEY');
    const model = this.configService.get<string>('GEMINI_MODEL') ?? 'gemini-1.5-flash';

    if (!apiKey) {
      throw new Error('GEMINI_API_KEY is not configured');
    }

    const response = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [
            {
              role: 'user',
              parts: [{ text: this.buildPrompt(answers) }],
            },
          ],
          generationConfig: {
            temperature: 0.1,
            responseMimeType: 'application/json',
          },
        }),
      },
    );

    if (!response.ok) {
      throw new Error(`Gemini request failed with ${response.status}`);
    }

    const payload = (await response.json()) as {
      candidates?: Array<{ content?: { parts?: Array<{ text?: string }> } }>;
    };
    const text = payload.candidates?.[0]?.content?.parts?.[0]?.text;

    if (!text) {
      throw new Error('Gemini response did not include text');
    }

    return parseFitnessProfileAnalysis(JSON.parse(text));
  }

  private buildPrompt(answers: OnboardingAnswer[]): string {
    return `Bạn là fitness onboarding analyzer cho ForgeAI. Nhiệm vụ của bạn là phân tích câu trả lời onboarding thành JSON đúng schema. Không tạo bài tập cụ thể. Không đưa lời khuyên y tế. Nếu user chọn self_directed thì needsWorkoutRecommendation=false, needsNutritionRecommendation=false và recommendationStrategy=journal_only.

Schema bắt buộc:
{
  "userMode": "guided" | "self_directed" | "routine_review",
  "experienceLevel": "beginner" | "returning" | "intermediate" | "advanced",
  "primaryGoal": "fat_loss" | "muscle_gain" | "strength" | "endurance" | "general_fitness",
  "trainingLocation": "home" | "gym" | "outdoor" | "mixed",
  "weeklySessions": 2 | 3 | 4 | 5 | 6,
  "sessionDurationMinutes": 20 | 30 | 45 | 60 | 75,
  "equipment": string[],
  "limitations": string[],
  "nutritionGoal": "calorie_deficit" | "maintenance" | "lean_bulk" | "habit_improvement",
  "recommendationStrategy": "beginner_full_body_low_impact" | "beginner_full_body" | "home_fat_loss" | "upper_lower_hypertrophy" | "strength_foundation" | "journal_only",
  "needsWorkoutRecommendation": boolean,
  "needsNutritionRecommendation": boolean,
  "confidence": number
}

Answers:
${JSON.stringify(answers)}`;
  }
}
```

- [ ] **Step 6: Tạo AI analysis service**

Create `backend/src/ai-analysis/ai-analysis.service.ts`:

```ts
import { Inject, Injectable } from '@nestjs/common';
import { OnboardingAnswer } from '../onboarding/types/onboarding-answer.type';
import { AI_PROVIDER, AiProvider } from './ai-provider.interface';
import { analyzeWithFallback } from './fallback-fitness-profile.analyzer';
import { FitnessProfileAnalysis } from './types/fitness-profile-analysis.type';

@Injectable()
export class AiAnalysisService {
  constructor(@Inject(AI_PROVIDER) private readonly aiProvider: AiProvider) {}

  async analyzeFitnessProfile(answers: OnboardingAnswer[]): Promise<FitnessProfileAnalysis> {
    try {
      return await this.aiProvider.analyzeFitnessProfile(answers);
    } catch {
      return analyzeWithFallback(answers);
    }
  }
}
```

- [ ] **Step 7: Tạo AI analysis module**

Create `backend/src/ai-analysis/ai-analysis.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { AI_PROVIDER } from './ai-provider.interface';
import { AiAnalysisService } from './ai-analysis.service';
import { GeminiAiProvider } from './gemini-ai.provider';

@Module({
  providers: [
    AiAnalysisService,
    GeminiAiProvider,
    {
      provide: AI_PROVIDER,
      useExisting: GeminiAiProvider,
    },
  ],
  exports: [AiAnalysisService],
})
export class AiAnalysisModule {}
```

- [ ] **Step 8: Cập nhật env example**

Modify `backend/.env.example`, thêm:

```env
GEMINI_API_KEY=""
GEMINI_MODEL="gemini-1.5-flash"
```

- [ ] **Step 9: Run test để pass**

Run:

```bash
cd backend && npm test -- ai-analysis/ai-analysis.service.spec.ts
```

Expected: PASS.

- [ ] **Step 10: Commit**

```bash
git add backend/src/ai-analysis backend/.env.example
git commit -m "feat(backend): add AI fitness analysis provider"
```

---

## Task 5: Seed exercise library MVP

**Files:**

- Create: `backend/prisma/seed.ts`
- Modify: `backend/package.json`
- Test: `cd backend && npx prisma db seed`

- [ ] **Step 1: Tạo Prisma seed file**

Create `backend/prisma/seed.ts`:

```ts
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const exercises = [
  {
    slug: 'bodyweight-squat',
    name: 'Bodyweight Squat',
    muscleGroups: ['quads', 'glutes', 'core'],
    equipment: ['bodyweight'],
    difficulty: 'beginner' as const,
    movementPattern: 'squat',
    goalTags: ['fat_loss', 'muscle_gain', 'general_fitness'] as const,
    contraindications: ['knee_sensitive_deep_flexion'],
    instructions: 'Giữ ngực mở, hạ hông có kiểm soát, đẩy gót chân xuống sàn khi đứng lên.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'incline-push-up',
    name: 'Incline Push-up',
    muscleGroups: ['chest', 'triceps', 'shoulders'],
    equipment: ['bodyweight'],
    difficulty: 'beginner' as const,
    movementPattern: 'push',
    goalTags: ['fat_loss', 'muscle_gain', 'general_fitness'] as const,
    contraindications: ['shoulder_sensitive_high_load'],
    instructions: 'Đặt tay lên mặt phẳng cao, giữ thân người thẳng và hạ ngực có kiểm soát.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'dumbbell-row',
    name: 'Dumbbell Row',
    muscleGroups: ['back', 'biceps'],
    equipment: ['dumbbell'],
    difficulty: 'beginner' as const,
    movementPattern: 'pull',
    goalTags: ['muscle_gain', 'strength', 'general_fitness'] as const,
    contraindications: ['back_sensitive_uncontrolled_hinge'],
    instructions: 'Giữ lưng trung lập, kéo khuỷu tay về phía hông và hạ tạ chậm.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'glute-bridge',
    name: 'Glute Bridge',
    muscleGroups: ['glutes', 'hamstrings', 'core'],
    equipment: ['bodyweight'],
    difficulty: 'beginner' as const,
    movementPattern: 'hinge',
    goalTags: ['fat_loss', 'muscle_gain', 'general_fitness'] as const,
    contraindications: [],
    instructions: 'Nằm ngửa, siết mông để nâng hông, tránh ưỡn lưng quá mức.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'dead-bug',
    name: 'Dead Bug',
    muscleGroups: ['core'],
    equipment: ['bodyweight'],
    difficulty: 'beginner' as const,
    movementPattern: 'core',
    goalTags: ['general_fitness', 'strength'] as const,
    contraindications: [],
    instructions: 'Giữ lưng dưới ổn định trên sàn khi duỗi tay/chân đối bên.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'dumbbell-goblet-squat',
    name: 'Dumbbell Goblet Squat',
    muscleGroups: ['quads', 'glutes', 'core'],
    equipment: ['dumbbell'],
    difficulty: 'beginner' as const,
    movementPattern: 'squat',
    goalTags: ['muscle_gain', 'strength', 'general_fitness'] as const,
    contraindications: ['knee_sensitive_deep_flexion'],
    instructions: 'Giữ tạ trước ngực, hạ người trong biên độ kiểm soát được.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'lat-pulldown',
    name: 'Lat Pulldown',
    muscleGroups: ['back', 'biceps'],
    equipment: ['full_gym'],
    difficulty: 'beginner' as const,
    movementPattern: 'pull',
    goalTags: ['muscle_gain', 'strength'] as const,
    contraindications: ['shoulder_sensitive_overhead'],
    instructions: 'Kéo thanh về ngực trên, giữ vai hạ xuống và kiểm soát đường lên.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
  {
    slug: 'machine-chest-press',
    name: 'Machine Chest Press',
    muscleGroups: ['chest', 'triceps', 'shoulders'],
    equipment: ['full_gym'],
    difficulty: 'beginner' as const,
    movementPattern: 'push',
    goalTags: ['muscle_gain', 'strength'] as const,
    contraindications: ['shoulder_sensitive_high_load'],
    instructions: 'Chỉnh ghế để tay cầm ngang ngực giữa, đẩy có kiểm soát.',
    sourceName: 'ForgeAI curated',
    sourceUrl: null,
  },
];

async function main() {
  for (const exercise of exercises) {
    await prisma.exercise.upsert({
      where: { slug: exercise.slug },
      update: exercise,
      create: exercise,
    });
  }
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (error) => {
    console.error(error);
    await prisma.$disconnect();
    process.exit(1);
  });
```

- [ ] **Step 2: Thêm seed config vào package.json**

Modify `backend/package.json`, thêm sau phần `jest` hoặc trước cuối file:

```json
"prisma": {
  "seed": "ts-node prisma/seed.ts"
}
```

Nếu file đang kết thúc bằng:

```json
  "jest": {
    "moduleFileExtensions": [
      "js",
      "json",
      "ts"
    ],
    "rootDir": "src",
    "testRegex": ".*\\.spec\\.ts$",
    "transform": {
      "^.+\\.(t|j)s$": "ts-jest"
    },
    "collectCoverageFrom": [
      "**/*.(t|j)s"
    ],
    "coverageDirectory": "../coverage",
    "testEnvironment": "node"
  }
}
```

thì đổi thành:

```json
  "jest": {
    "moduleFileExtensions": [
      "js",
      "json",
      "ts"
    ],
    "rootDir": "src",
    "testRegex": ".*\\.spec\\.ts$",
    "transform": {
      "^.+\\.(t|j)s$": "ts-jest"
    },
    "collectCoverageFrom": [
      "**/*.(t|j)s"
    ],
    "coverageDirectory": "../coverage",
    "testEnvironment": "node"
  },
  "prisma": {
    "seed": "ts-node prisma/seed.ts"
  }
}
```

- [ ] **Step 3: Run seed**

Run:

```bash
cd backend && npx prisma db seed
```

Expected:

```text
Running seed command `ts-node prisma/seed.ts` ...
```

- [ ] **Step 4: Commit**

```bash
git add backend/prisma/seed.ts backend/package.json backend/package-lock.json
git commit -m "feat(backend): seed MVP exercise library"
```

---

## Task 6: Tạo exercise library service

**Files:**

- Create: `backend/src/exercise-library/types/exercise-filter.type.ts`
- Create: `backend/src/exercise-library/exercise-library.service.ts`
- Create: `backend/src/exercise-library/exercise-library.module.ts`
- Test: `backend/src/exercise-library/exercise-library.service.spec.ts`

- [ ] **Step 1: Viết failing test bằng Prisma mock tối giản**

Create `backend/src/exercise-library/exercise-library.service.spec.ts`:

```ts
import { ExerciseLibraryService } from './exercise-library.service';

describe('ExerciseLibraryService', () => {
  it('queries exercises by equipment and excludes limitation-sensitive contraindications', async () => {
    const findMany = jest.fn().mockResolvedValue([
      { slug: 'glute-bridge', name: 'Glute Bridge' },
    ]);
    const prisma = { exercise: { findMany } };
    const service = new ExerciseLibraryService(prisma as never);

    await expect(
      service.findRecommendedExercises({
        equipment: ['bodyweight'],
        primaryGoal: 'fat_loss',
        experienceLevel: 'beginner',
        limitations: ['knee_sensitive'],
      }),
    ).resolves.toEqual([{ slug: 'glute-bridge', name: 'Glute Bridge' }]);

    expect(findMany).toHaveBeenCalledWith({
      where: {
        equipment: { hasSome: ['bodyweight'] },
        goalTags: { has: 'fat_loss' },
        difficulty: 'beginner',
        NOT: {
          contraindications: { hasSome: ['knee_sensitive_deep_flexion', 'high_impact'] },
        },
      },
      orderBy: { name: 'asc' },
    });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- exercise-library/exercise-library.service.spec.ts
```

Expected: FAIL vì service chưa tồn tại.

- [ ] **Step 3: Tạo filter type**

Create `backend/src/exercise-library/types/exercise-filter.type.ts`:

```ts
import { ExperienceLevel, FitnessGoal } from '../../ai-analysis/types/fitness-profile-analysis.type';

export type ExerciseFilter = {
  equipment: string[];
  primaryGoal: FitnessGoal;
  experienceLevel: ExperienceLevel;
  limitations: string[];
};
```

- [ ] **Step 4: Tạo exercise library service**

Create `backend/src/exercise-library/exercise-library.service.ts`:

```ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { ExerciseFilter } from './types/exercise-filter.type';

const limitationContraindications: Record<string, string[]> = {
  knee_sensitive: ['knee_sensitive_deep_flexion', 'high_impact'],
  avoid_high_impact: ['high_impact'],
  back_sensitive: ['back_sensitive_uncontrolled_hinge'],
  shoulder_sensitive: ['shoulder_sensitive_high_load', 'shoulder_sensitive_overhead'],
};

@Injectable()
export class ExerciseLibraryService {
  constructor(private readonly prisma: PrismaService) {}

  findRecommendedExercises(filter: ExerciseFilter) {
    const contraindications = filter.limitations.flatMap(
      (limitation) => limitationContraindications[limitation] ?? [],
    );

    return this.prisma.exercise.findMany({
      where: {
        equipment: { hasSome: filter.equipment.length > 0 ? filter.equipment : ['bodyweight'] },
        goalTags: { has: filter.primaryGoal },
        difficulty: filter.experienceLevel,
        NOT: {
          contraindications: { hasSome: contraindications },
        },
      },
      orderBy: { name: 'asc' },
    });
  }
}
```

- [ ] **Step 5: Tạo module**

Create `backend/src/exercise-library/exercise-library.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { ExerciseLibraryService } from './exercise-library.service';

@Module({
  providers: [ExerciseLibraryService],
  exports: [ExerciseLibraryService],
})
export class ExerciseLibraryModule {}
```

- [ ] **Step 6: Run test để pass**

Run:

```bash
cd backend && npm test -- exercise-library/exercise-library.service.spec.ts
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add backend/src/exercise-library
git commit -m "feat(backend): add exercise library service"
```

---

## Task 7: Tạo workout plan builder

**Files:**

- Create: `backend/src/recommendation/types/recommendation.type.ts`
- Create: `backend/src/recommendation/workout-plan.builder.ts`
- Test: `backend/src/recommendation/workout-plan.builder.spec.ts`

- [ ] **Step 1: Viết failing test**

Create `backend/src/recommendation/workout-plan.builder.spec.ts`:

```ts
import { buildWorkoutPlan } from './workout-plan.builder';

describe('buildWorkoutPlan', () => {
  it('returns journal-only plan for self-directed users', () => {
    const plan = buildWorkoutPlan(
      {
        userMode: 'self_directed',
        experienceLevel: 'intermediate',
        primaryGoal: 'muscle_gain',
        trainingLocation: 'gym',
        weeklySessions: 4,
        sessionDurationMinutes: 60,
        equipment: ['full_gym'],
        limitations: [],
        nutritionGoal: 'maintenance',
        recommendationStrategy: 'journal_only',
        needsWorkoutRecommendation: false,
        needsNutritionRecommendation: false,
        confidence: 0.8,
      },
      [],
    );

    expect(plan.days).toHaveLength(0);
    expect(plan.title).toBe('Workout journal mode');
  });

  it('builds weekly guided plan from available exercises', () => {
    const plan = buildWorkoutPlan(
      {
        userMode: 'guided',
        experienceLevel: 'beginner',
        primaryGoal: 'fat_loss',
        trainingLocation: 'home',
        weeklySessions: 3,
        sessionDurationMinutes: 45,
        equipment: ['bodyweight'],
        limitations: [],
        nutritionGoal: 'calorie_deficit',
        recommendationStrategy: 'home_fat_loss',
        needsWorkoutRecommendation: true,
        needsNutritionRecommendation: true,
        confidence: 0.8,
      },
      [
        { id: '1', slug: 'glute-bridge', name: 'Glute Bridge', muscleGroups: ['glutes'], movementPattern: 'hinge' },
        { id: '2', slug: 'incline-push-up', name: 'Incline Push-up', muscleGroups: ['chest'], movementPattern: 'push' },
        { id: '3', slug: 'dead-bug', name: 'Dead Bug', muscleGroups: ['core'], movementPattern: 'core' },
      ],
    );

    expect(plan.days).toHaveLength(3);
    expect(plan.days[0].exercises).toHaveLength(3);
    expect(plan.days[0].exercises[0]).toMatchObject({ sets: 3, reps: '8-12' });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- recommendation/workout-plan.builder.spec.ts
```

Expected: FAIL vì builder chưa tồn tại.

- [ ] **Step 3: Tạo recommendation types**

Create `backend/src/recommendation/types/recommendation.type.ts`:

```ts
import { RecommendationStrategy } from '../../ai-analysis/types/fitness-profile-analysis.type';

export type RecommendationExercise = {
  id: string;
  slug: string;
  name: string;
  muscleGroups: string[];
  movementPattern: string;
};

export type WorkoutPlanDay = {
  dayNumber: number;
  title: string;
  focus: string;
  exercises: Array<{
    exerciseId: string;
    slug: string;
    name: string;
    sets: number;
    reps: string;
    restSeconds: number;
  }>;
};

export type WorkoutPlanDraft = {
  title: string;
  summary: string;
  strategy: RecommendationStrategy;
  days: WorkoutPlanDay[];
};

export type NutritionPlanDraft = {
  title: string;
  summary: string;
  targets: Record<string, string | number>;
  guidance: Array<{ title: string; description: string }>;
};
```

- [ ] **Step 4: Tạo workout plan builder**

Create `backend/src/recommendation/workout-plan.builder.ts`:

```ts
import { FitnessProfileAnalysis } from '../ai-analysis/types/fitness-profile-analysis.type';
import { RecommendationExercise, WorkoutPlanDraft } from './types/recommendation.type';

export const buildWorkoutPlan = (
  profile: FitnessProfileAnalysis,
  exercises: RecommendationExercise[],
): WorkoutPlanDraft => {
  if (!profile.needsWorkoutRecommendation) {
    return {
      title: 'Workout journal mode',
      summary: 'User đã có routine riêng, hệ thống chỉ hỗ trợ lưu, tracking và phân tích sau.',
      strategy: profile.recommendationStrategy,
      days: [],
    };
  }

  const selectedExercises = exercises.slice(0, Math.min(5, exercises.length));
  const days = Array.from({ length: profile.weeklySessions }, (_, index) => ({
    dayNumber: index + 1,
    title: `Buổi ${index + 1}: Full body foundation`,
    focus: profile.recommendationStrategy === 'beginner_full_body_low_impact' ? 'low-impact full body' : 'full body',
    exercises: selectedExercises.map((exercise) => ({
      exerciseId: exercise.id,
      slug: exercise.slug,
      name: exercise.name,
      sets: profile.experienceLevel === 'beginner' ? 3 : 4,
      reps: profile.primaryGoal === 'strength' ? '5-8' : '8-12',
      restSeconds: profile.primaryGoal === 'strength' ? 120 : 75,
    })),
  }));

  return {
    title: profile.primaryGoal === 'fat_loss' ? 'Fat loss foundation plan' : 'Strength and muscle foundation plan',
    summary: `Kế hoạch ${profile.weeklySessions} buổi/tuần, mỗi buổi khoảng ${profile.sessionDurationMinutes} phút, dựa trên mục tiêu và thiết bị hiện có.`,
    strategy: profile.recommendationStrategy,
    days,
  };
};
```

- [ ] **Step 5: Run test để pass**

Run:

```bash
cd backend && npm test -- recommendation/workout-plan.builder.spec.ts
```

Expected: PASS.

- [ ] **Step 6: Commit**

```bash
git add backend/src/recommendation
git commit -m "feat(backend): build workout recommendation drafts"
```

---

## Task 8: Tạo nutrition plan builder

**Files:**

- Create: `backend/src/recommendation/nutrition-plan.builder.ts`
- Test: `backend/src/recommendation/nutrition-plan.builder.spec.ts`

- [ ] **Step 1: Viết failing test**

Create `backend/src/recommendation/nutrition-plan.builder.spec.ts`:

```ts
import { buildNutritionPlan } from './nutrition-plan.builder';

describe('buildNutritionPlan', () => {
  it('returns empty guidance for self-directed users who do not need nutrition recommendation', () => {
    const plan = buildNutritionPlan({
      userMode: 'self_directed',
      experienceLevel: 'intermediate',
      primaryGoal: 'muscle_gain',
      trainingLocation: 'gym',
      weeklySessions: 4,
      sessionDurationMinutes: 60,
      equipment: ['full_gym'],
      limitations: [],
      nutritionGoal: 'maintenance',
      recommendationStrategy: 'journal_only',
      needsWorkoutRecommendation: false,
      needsNutritionRecommendation: false,
      confidence: 0.8,
    });

    expect(plan.title).toBe('Nutrition tracking mode');
    expect(plan.guidance).toHaveLength(0);
  });

  it('builds calorie deficit guidance for fat loss users', () => {
    const plan = buildNutritionPlan({
      userMode: 'guided',
      experienceLevel: 'beginner',
      primaryGoal: 'fat_loss',
      trainingLocation: 'home',
      weeklySessions: 3,
      sessionDurationMinutes: 45,
      equipment: ['bodyweight'],
      limitations: [],
      nutritionGoal: 'calorie_deficit',
      recommendationStrategy: 'home_fat_loss',
      needsWorkoutRecommendation: true,
      needsNutritionRecommendation: true,
      confidence: 0.8,
    });

    expect(plan.targets).toMatchObject({ calorieDirection: 'deficit nhẹ' });
    expect(plan.guidance[0].title).toBe('Ưu tiên protein mỗi bữa');
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- recommendation/nutrition-plan.builder.spec.ts
```

Expected: FAIL vì builder chưa tồn tại.

- [ ] **Step 3: Tạo nutrition plan builder**

Create `backend/src/recommendation/nutrition-plan.builder.ts`:

```ts
import { FitnessProfileAnalysis } from '../ai-analysis/types/fitness-profile-analysis.type';
import { NutritionPlanDraft } from './types/recommendation.type';

export const buildNutritionPlan = (profile: FitnessProfileAnalysis): NutritionPlanDraft => {
  if (!profile.needsNutritionRecommendation) {
    return {
      title: 'Nutrition tracking mode',
      summary: 'User chưa cần khuyến nghị ăn uống, chỉ cần hỗ trợ lưu và theo dõi khi có dữ liệu.',
      targets: {},
      guidance: [],
    };
  }

  const calorieDirection =
    profile.nutritionGoal === 'calorie_deficit'
      ? 'deficit nhẹ'
      : profile.nutritionGoal === 'lean_bulk'
        ? 'surplus nhẹ'
        : profile.nutritionGoal === 'maintenance'
          ? 'duy trì'
          : 'ổn định thói quen';

  return {
    title: 'Nutrition foundation plan',
    summary: 'Định hướng ăn uống an toàn ở mức thói quen và mục tiêu năng lượng, không thay thế tư vấn y tế.',
    targets: {
      calorieDirection,
      proteinPriority: 'cao',
      hydration: 'ưu tiên uống nước đều trong ngày',
    },
    guidance: [
      {
        title: 'Ưu tiên protein mỗi bữa',
        description: 'Mỗi bữa chính nên có một nguồn protein rõ ràng như trứng, thịt nạc, cá, đậu hoặc sữa chua nếu phù hợp.',
      },
      {
        title: 'Giữ tinh bột có kiểm soát',
        description: 'Không cần cắt tinh bột hoàn toàn; điều chỉnh khẩu phần theo mục tiêu năng lượng.',
      },
      {
        title: 'Theo dõi phản hồi cơ thể',
        description: 'Nếu mệt mỏi, đói quá mức hoặc hiệu suất tập giảm mạnh, cần điều chỉnh lại mức ăn.',
      },
    ],
  };
};
```

- [ ] **Step 4: Run test để pass**

Run:

```bash
cd backend && npm test -- recommendation/nutrition-plan.builder.spec.ts
```

Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add backend/src/recommendation/nutrition-plan.builder.ts backend/src/recommendation/nutrition-plan.builder.spec.ts
git commit -m "feat(backend): build nutrition recommendation drafts"
```

---

## Task 9: Tạo recommendation service và current endpoint

**Files:**

- Create: `backend/src/recommendation/recommendation.service.ts`
- Create: `backend/src/recommendation/recommendation.controller.ts`
- Create: `backend/src/recommendation/recommendation.module.ts`
- Modify: `backend/src/app.module.ts`
- Test: `backend/src/recommendation/recommendation.service.spec.ts`

- [ ] **Step 1: Viết failing test cho service**

Create `backend/src/recommendation/recommendation.service.spec.ts`:

```ts
import { RecommendationService } from './recommendation.service';

describe('RecommendationService', () => {
  it('returns current workout and nutrition plans', async () => {
    const prisma = {
      workoutPlan: {
        findFirst: jest.fn().mockResolvedValue({ id: 'workout-1', title: 'Plan', days: [] }),
      },
      nutritionPlan: {
        findFirst: jest.fn().mockResolvedValue({ id: 'nutrition-1', title: 'Nutrition', guidance: [] }),
      },
    };
    const service = new RecommendationService(prisma as never, {} as never);

    await expect(service.getCurrentRecommendation('user-1')).resolves.toEqual({
      workoutPlan: { id: 'workout-1', title: 'Plan', days: [] },
      nutritionPlan: { id: 'nutrition-1', title: 'Nutrition', guidance: [] },
    });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- recommendation/recommendation.service.spec.ts
```

Expected: FAIL vì service chưa tồn tại.

- [ ] **Step 3: Tạo recommendation service**

Create `backend/src/recommendation/recommendation.service.ts`:

```ts
import { Injectable } from '@nestjs/common';
import { FitnessProfileAnalysis } from '../ai-analysis/types/fitness-profile-analysis.type';
import { ExerciseLibraryService } from '../exercise-library/exercise-library.service';
import { PrismaService } from '../prisma/prisma.service';
import { buildNutritionPlan } from './nutrition-plan.builder';
import { buildWorkoutPlan } from './workout-plan.builder';

@Injectable()
export class RecommendationService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly exerciseLibraryService: ExerciseLibraryService,
  ) {}

  async createRecommendationForUser(userId: string, profile: FitnessProfileAnalysis) {
    await this.prisma.workoutPlan.updateMany({
      where: { userId, status: 'active' },
      data: { status: 'archived' },
    });

    const exercises = profile.needsWorkoutRecommendation
      ? await this.exerciseLibraryService.findRecommendedExercises({
          equipment: profile.equipment,
          primaryGoal: profile.primaryGoal,
          experienceLevel: profile.experienceLevel,
          limitations: profile.limitations,
        })
      : [];

    const workoutDraft = buildWorkoutPlan(profile, exercises);
    const nutritionDraft = buildNutritionPlan(profile);

    const workoutPlan = await this.prisma.workoutPlan.create({
      data: {
        userId,
        title: workoutDraft.title,
        summary: workoutDraft.summary,
        strategy: workoutDraft.strategy,
        days: workoutDraft.days,
      },
    });

    const nutritionPlan = await this.prisma.nutritionPlan.create({
      data: {
        userId,
        title: nutritionDraft.title,
        summary: nutritionDraft.summary,
        goal: profile.nutritionGoal,
        targets: nutritionDraft.targets,
        guidance: nutritionDraft.guidance,
      },
    });

    return { workoutPlan, nutritionPlan };
  }

  async getCurrentRecommendation(userId: string) {
    const [workoutPlan, nutritionPlan] = await Promise.all([
      this.prisma.workoutPlan.findFirst({
        where: { userId, status: 'active' },
        orderBy: { createdAt: 'desc' },
      }),
      this.prisma.nutritionPlan.findFirst({
        where: { userId },
        orderBy: { createdAt: 'desc' },
      }),
    ]);

    return { workoutPlan, nutritionPlan };
  }
}
```

- [ ] **Step 4: Tạo recommendation controller**

Create `backend/src/recommendation/recommendation.controller.ts`:

```ts
import { Controller, Get, Request, UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { RecommendationService } from './recommendation.service';

@Controller('recommendations')
@UseGuards(JwtAuthGuard)
export class RecommendationController {
  constructor(private readonly recommendationService: RecommendationService) {}

  @Get('current')
  getCurrentRecommendation(@Request() request: { user: { sub: string } }) {
    return this.recommendationService.getCurrentRecommendation(request.user.sub);
  }
}
```

- [ ] **Step 5: Tạo recommendation module**

Create `backend/src/recommendation/recommendation.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { ExerciseLibraryModule } from '../exercise-library/exercise-library.module';
import { RecommendationController } from './recommendation.controller';
import { RecommendationService } from './recommendation.service';

@Module({
  imports: [ExerciseLibraryModule],
  controllers: [RecommendationController],
  providers: [RecommendationService],
  exports: [RecommendationService],
})
export class RecommendationModule {}
```

- [ ] **Step 6: Import module trong app**

Modify `backend/src/app.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { PrismaModule } from './prisma/prisma.module';
import { RecommendationModule } from './recommendation/recommendation.module';

@Module({
  imports: [ConfigModule.forRoot({ isGlobal: true }), PrismaModule, AuthModule, RecommendationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

- [ ] **Step 7: Run test để pass**

Run:

```bash
cd backend && npm test -- recommendation/recommendation.service.spec.ts
```

Expected: PASS.

- [ ] **Step 8: Commit**

```bash
git add backend/src/recommendation backend/src/app.module.ts
git commit -m "feat(backend): expose current recommendations"
```

---

## Task 10: Tạo onboarding service/controller tích hợp AI + recommendation

**Files:**

- Create: `backend/src/onboarding/onboarding.service.ts`
- Create: `backend/src/onboarding/onboarding.controller.ts`
- Create: `backend/src/onboarding/onboarding.module.ts`
- Modify: `backend/src/app.module.ts`
- Test: `backend/src/onboarding/onboarding.service.spec.ts`

- [ ] **Step 1: Viết failing test cho onboarding service**

Create `backend/src/onboarding/onboarding.service.spec.ts`:

```ts
import { OnboardingService } from './onboarding.service';

describe('OnboardingService', () => {
  it('stores answers, profile, and creates recommendations', async () => {
    const profile = {
      userMode: 'guided',
      experienceLevel: 'beginner',
      primaryGoal: 'fat_loss',
      trainingLocation: 'home',
      weeklySessions: 3,
      sessionDurationMinutes: 45,
      equipment: ['bodyweight'],
      limitations: [],
      nutritionGoal: 'calorie_deficit',
      recommendationStrategy: 'home_fat_loss',
      needsWorkoutRecommendation: true,
      needsNutritionRecommendation: true,
      confidence: 0.8,
    };
    const prisma = {
      onboardingResponse: { create: jest.fn().mockResolvedValue({ id: 'response-1' }) },
      fitnessProfile: { upsert: jest.fn().mockResolvedValue({ id: 'profile-1', ...profile }) },
    };
    const aiAnalysis = { analyzeFitnessProfile: jest.fn().mockResolvedValue(profile) };
    const recommendation = { createRecommendationForUser: jest.fn().mockResolvedValue({ workoutPlan: {}, nutritionPlan: {} }) };
    const service = new OnboardingService(prisma as never, aiAnalysis as never, recommendation as never);

    await expect(service.submitOnboarding('user-1', [{ questionId: 'mode', value: 'guided' }])).resolves.toMatchObject({
      profile: { id: 'profile-1' },
      recommendation: { workoutPlan: {}, nutritionPlan: {} },
    });
  });
});
```

- [ ] **Step 2: Run test để xác nhận fail**

Run:

```bash
cd backend && npm test -- onboarding/onboarding.service.spec.ts
```

Expected: FAIL vì service chưa tồn tại.

- [ ] **Step 3: Tạo onboarding service**

Create `backend/src/onboarding/onboarding.service.ts`:

```ts
import { Injectable } from '@nestjs/common';
import { AiAnalysisService } from '../ai-analysis/ai-analysis.service';
import { FitnessProfileAnalysis } from '../ai-analysis/types/fitness-profile-analysis.type';
import { PrismaService } from '../prisma/prisma.service';
import { RecommendationService } from '../recommendation/recommendation.service';
import { OnboardingAnswer } from './types/onboarding-answer.type';

@Injectable()
export class OnboardingService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly aiAnalysisService: AiAnalysisService,
    private readonly recommendationService: RecommendationService,
  ) {}

  async submitOnboarding(userId: string, answers: OnboardingAnswer[]) {
    await this.prisma.onboardingResponse.create({
      data: {
        userId,
        answers,
      },
    });

    const analysis = await this.aiAnalysisService.analyzeFitnessProfile(answers);
    const profile = await this.upsertFitnessProfile(userId, analysis);
    const recommendation = await this.recommendationService.createRecommendationForUser(userId, analysis);

    return { profile, recommendation };
  }

  private upsertFitnessProfile(userId: string, analysis: FitnessProfileAnalysis) {
    return this.prisma.fitnessProfile.upsert({
      where: { userId },
      update: {
        userMode: analysis.userMode,
        experienceLevel: analysis.experienceLevel,
        primaryGoal: analysis.primaryGoal,
        trainingLocation: analysis.trainingLocation,
        weeklySessions: analysis.weeklySessions,
        sessionDurationMinutes: analysis.sessionDurationMinutes,
        equipment: analysis.equipment,
        limitations: analysis.limitations,
        nutritionGoal: analysis.nutritionGoal,
        recommendationStrategy: analysis.recommendationStrategy,
        needsWorkoutRecommendation: analysis.needsWorkoutRecommendation,
        needsNutritionRecommendation: analysis.needsNutritionRecommendation,
        confidence: analysis.confidence,
        analysisSource: analysis.confidence === 0.65 ? 'fallback' : 'ai',
      },
      create: {
        userId,
        userMode: analysis.userMode,
        experienceLevel: analysis.experienceLevel,
        primaryGoal: analysis.primaryGoal,
        trainingLocation: analysis.trainingLocation,
        weeklySessions: analysis.weeklySessions,
        sessionDurationMinutes: analysis.sessionDurationMinutes,
        equipment: analysis.equipment,
        limitations: analysis.limitations,
        nutritionGoal: analysis.nutritionGoal,
        recommendationStrategy: analysis.recommendationStrategy,
        needsWorkoutRecommendation: analysis.needsWorkoutRecommendation,
        needsNutritionRecommendation: analysis.needsNutritionRecommendation,
        confidence: analysis.confidence,
        analysisSource: analysis.confidence === 0.65 ? 'fallback' : 'ai',
      },
    });
  }
}
```

- [ ] **Step 4: Tạo onboarding controller**

Create `backend/src/onboarding/onboarding.controller.ts`:

```ts
import { Body, Controller, Get, Post, Request, UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../common/guards/jwt-auth.guard';
import { SubmitOnboardingDto } from './dto/submit-onboarding.dto';
import { ONBOARDING_QUESTIONS } from './onboarding.questions';
import { OnboardingService } from './onboarding.service';

@Controller('onboarding')
@UseGuards(JwtAuthGuard)
export class OnboardingController {
  constructor(private readonly onboardingService: OnboardingService) {}

  @Get('questions')
  getQuestions() {
    return { questions: ONBOARDING_QUESTIONS };
  }

  @Post('submit')
  submitOnboarding(
    @Request() request: { user: { sub: string } },
    @Body() body: SubmitOnboardingDto,
  ) {
    return this.onboardingService.submitOnboarding(request.user.sub, body.answers);
  }
}
```

- [ ] **Step 5: Tạo onboarding module**

Create `backend/src/onboarding/onboarding.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { AiAnalysisModule } from '../ai-analysis/ai-analysis.module';
import { RecommendationModule } from '../recommendation/recommendation.module';
import { OnboardingController } from './onboarding.controller';
import { OnboardingService } from './onboarding.service';

@Module({
  imports: [AiAnalysisModule, RecommendationModule],
  controllers: [OnboardingController],
  providers: [OnboardingService],
})
export class OnboardingModule {}
```

- [ ] **Step 6: Import onboarding module trong app**

Modify `backend/src/app.module.ts`:

```ts
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { OnboardingModule } from './onboarding/onboarding.module';
import { PrismaModule } from './prisma/prisma.module';
import { RecommendationModule } from './recommendation/recommendation.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    PrismaModule,
    AuthModule,
    RecommendationModule,
    OnboardingModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

- [ ] **Step 7: Run test để pass**

Run:

```bash
cd backend && npm test -- onboarding/onboarding.service.spec.ts
```

Expected: PASS.

- [ ] **Step 8: Commit**

```bash
git add backend/src/onboarding backend/src/app.module.ts
git commit -m "feat(backend): submit onboarding recommendations"
```

---

## Task 11: Thêm e2e tests cho onboarding và current recommendation

**Files:**

- Create: `backend/test/onboarding.e2e-spec.ts`
- Create: `backend/test/recommendation.e2e-spec.ts`

- [ ] **Step 1: Viết e2e test cho onboarding questions auth guard**

Create `backend/test/onboarding.e2e-spec.ts`:

```ts
import { INestApplication } from '@nestjs/common';
import { Test } from '@nestjs/testing';
import request from 'supertest';
import { AppModule } from '../src/app.module';

describe('OnboardingController (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleFixture = await Test.createTestingModule({ imports: [AppModule] }).compile();
    app = moduleFixture.createNestApplication();
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  it('/onboarding/questions requires authentication', () => {
    return request(app.getHttpServer()).get('/onboarding/questions').expect(401);
  });
});
```

- [ ] **Step 2: Viết e2e test cho recommendation current auth guard**

Create `backend/test/recommendation.e2e-spec.ts`:

```ts
import { INestApplication } from '@nestjs/common';
import { Test } from '@nestjs/testing';
import request from 'supertest';
import { AppModule } from '../src/app.module';

describe('RecommendationController (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleFixture = await Test.createTestingModule({ imports: [AppModule] }).compile();
    app = moduleFixture.createNestApplication();
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  it('/recommendations/current requires authentication', () => {
    return request(app.getHttpServer()).get('/recommendations/current').expect(401);
  });
});
```

- [ ] **Step 3: Run e2e tests**

Run:

```bash
cd backend && npm run test:e2e -- onboarding.e2e-spec.ts recommendation.e2e-spec.ts
```

Expected: PASS.

Nếu Jest e2e config không nhận file args, chạy:

```bash
cd backend && npm run test:e2e
```

Expected: PASS toàn bộ e2e hiện có.

- [ ] **Step 4: Commit**

```bash
git add backend/test/onboarding.e2e-spec.ts backend/test/recommendation.e2e-spec.ts
git commit -m "test(backend): cover onboarding recommendation guards"
```

---

## Task 12: Verification cuối cùng

**Files:**

- No code changes expected.

- [ ] **Step 1: Format code**

Run:

```bash
cd backend && npm run format
```

Expected: Prettier hoàn tất không lỗi.

- [ ] **Step 2: Lint**

Run:

```bash
cd backend && npm run lint
```

Expected: ESLint hoàn tất không lỗi.

- [ ] **Step 3: Unit tests**

Run:

```bash
cd backend && npm test
```

Expected: PASS toàn bộ unit tests.

- [ ] **Step 4: E2E tests**

Run:

```bash
cd backend && npm run test:e2e
```

Expected: PASS toàn bộ e2e tests.

- [ ] **Step 5: Build**

Run:

```bash
cd backend && npm run build
```

Expected: Build NestJS thành công.

- [ ] **Step 6: Prisma validate**

Run:

```bash
cd backend && npx prisma validate
```

Expected:

```text
The schema at prisma/schema.prisma is valid
```

- [ ] **Step 7: Commit nếu format/lint có chỉnh file**

Nếu `npm run format` hoặc `npm run lint` chỉnh file:

```bash
git status --short
git add backend/src backend/test backend/prisma backend/package.json backend/package-lock.json
git commit -m "chore(backend): format onboarding recommendation code"
```

---

## API contract cho frontend

### GET /onboarding/questions

Auth: Bearer access token.

Response:

```json
{
  "questions": [
    {
      "id": "mode",
      "title": "Bạn muốn ForgeAI hỗ trợ theo cách nào?",
      "type": "single_choice",
      "required": true,
      "options": [
        { "label": "Tạo lộ trình tập và ăn uống cho tôi", "value": "guided" },
        { "label": "Tôi đã có routine, chỉ muốn lưu và tracking", "value": "self_directed" },
        { "label": "Tôi muốn AI phân tích routine hiện tại", "value": "routine_review" }
      ]
    }
  ]
}
```

### POST /onboarding/submit

Auth: Bearer access token.

Request:

```json
{
  "answers": [
    { "questionId": "mode", "value": "guided" },
    { "questionId": "primary_goal", "value": "fat_loss" },
    { "questionId": "experience_level", "value": "beginner" },
    { "questionId": "training_location", "value": "home" },
    { "questionId": "weekly_sessions", "value": "3" },
    { "questionId": "session_duration_minutes", "value": "45" },
    { "questionId": "equipment", "value": ["bodyweight", "dumbbell"] },
    { "questionId": "limitations", "value": ["knee_sensitive"] },
    { "questionId": "nutrition_goal", "value": "calorie_deficit" }
  ]
}
```

Response:

```json
{
  "profile": {
    "userMode": "guided",
    "experienceLevel": "beginner",
    "primaryGoal": "fat_loss",
    "trainingLocation": "home",
    "weeklySessions": 3,
    "sessionDurationMinutes": 45,
    "equipment": ["bodyweight", "dumbbell"],
    "limitations": ["knee_sensitive"],
    "nutritionGoal": "calorie_deficit",
    "recommendationStrategy": "beginner_full_body_low_impact",
    "needsWorkoutRecommendation": true,
    "needsNutritionRecommendation": true,
    "confidence": 0.86
  },
  "recommendation": {
    "workoutPlan": {
      "title": "Fat loss foundation plan",
      "days": []
    },
    "nutritionPlan": {
      "title": "Nutrition foundation plan",
      "targets": {}
    }
  }
}
```

### GET /recommendations/current

Auth: Bearer access token.

Response:

```json
{
  "workoutPlan": {
    "id": "uuid",
    "title": "Fat loss foundation plan",
    "summary": "Kế hoạch 3 buổi/tuần...",
    "strategy": "beginner_full_body_low_impact",
    "status": "active",
    "days": []
  },
  "nutritionPlan": {
    "id": "uuid",
    "title": "Nutrition foundation plan",
    "summary": "Định hướng ăn uống an toàn...",
    "targets": {},
    "guidance": []
  }
}
```

---

## Rủi ro và quyết định kỹ thuật

- **AI hallucination:** Giảm bằng cách chỉ nhận JSON schema và backend tự chọn bài tập từ database.
- **AI API outage:** Có fallback analyzer để user vẫn hoàn tất onboarding.
- **Nguồn exercise chưa thật sự external/uy tín:** MVP seed dùng `ForgeAI curated`; sau MVP cần thay bằng content có license rõ hoặc CMS nội bộ.
- **Nutrition safety:** MVP chỉ đưa định hướng thói quen và calorie direction, không kê thực đơn y tế.
- **Self-directed user:** Không ép recommendation; tạo journal mode để frontend có thể đưa user vào flow tracking.

---

## Sau MVP nên làm tiếp

- Thêm `WorkoutLog`, `WorkoutTemplate`, `ExerciseFavorite` cho journal mode.
- Thêm routine review endpoint cho user đã quen tập.
- Thêm admin/CMS để quản lý exercise library.
- Thêm source/license field chi tiết hơn cho bài tập.
- Thêm AI chat coach sau khi có workout history.
- Thêm env validation để không deploy thiếu `GEMINI_API_KEY` ngoài production.
- Thêm Swagger/OpenAPI để frontend dễ tích hợp.

---

## Self-review

- Spec coverage: Plan đã bao phủ onboarding sau đăng ký, AI API trực tiếp, phân loại guided/self-directed, recommendation workout/nutrition, fallback khi AI lỗi, và endpoint cho frontend lấy dữ liệu.
- Placeholder scan: Không có `TBD`, `TODO`, hoặc bước yêu cầu tự suy luận mà không có code/command cụ thể.
- Type consistency: Các union type trong analysis, Prisma enum, builder, service dùng cùng tên giá trị như `guided`, `self_directed`, `journal_only`, `home_fat_loss`.
