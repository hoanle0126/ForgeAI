# ForgeAI — Flutter Architecture Rules

> **Tài liệu này là luật tối cao.** Mọi code được viết trong project phải tuân thủ 100%.
> Agent AI (Gemini/Claude/GPT) khi code cho project này **PHẢI đọc file này trước khi viết bất kỳ dòng code nào.**

---

## R0. Nguyên tắc vàng — REUSE FIRST, CREATE NEVER

> [!CAUTION]
> **Đây là quy tắc quan trọng nhất của toàn bộ project.**

- **LUÔN tìm kiếm component/widget/function đã có TRƯỚC KHI viết mới.**
- Nếu một widget tương tự đã tồn tại → mở rộng nó bằng `parameter` / `enum variant`, KHÔNG tạo file mới.
- Nếu một logic đã tồn tại ở chỗ khác → extract thành `shared utility`, KHÔNG copy-paste.
- Khi tạo widget mới → **thiết kế nó để tái sử dụng ngay từ đầu** (nghĩa là nhận `props` linh hoạt, không hardcode giá trị).

**Checklist bắt buộc trước khi tạo file mới:**

```
□ Tôi đã grep/search toàn bộ project tìm widget tương tự chưa?
□ Tôi đã kiểm tra thư mục lib/shared/widgets/ chưa?
□ Widget hiện có có thể mở rộng thêm variant không?
□ Nếu tạo mới — nó có khả năng dùng lại ở ≥2 nơi không?
```

---

## R1. Tech Stack — Cố định, không thay đổi

| Vai trò            | Package                                          | Phiên bản     |
| ------------------ | ------------------------------------------------ | ------------- |
| State Management   | `flutter_riverpod` + `riverpod_annotation`       | latest stable |
| Code Generation    | `freezed` + `json_serializable` + `build_runner` | latest stable |
| Routing            | `go_router`                                      | latest stable |
| Local DB (offline) | `hive` + `hive_flutter`                          | latest stable |
| Key-Value Storage  | `shared_preferences`                             | latest stable |
| Charts             | `fl_chart`                                       | latest stable |
| Fonts              | `google_fonts`                                   | latest stable |
| Icons              | `phosphor_flutter`                               | latest stable |
| SVG                | `flutter_svg`                                    | latest stable |
| Animation          | `flutter_animate`                                | latest stable |
| Rich Animation     | `lottie` hoặc `rive`                             | latest stable |
| Progress Ring      | `percent_indicator`                              | latest stable |

> [!WARNING]
> **KHÔNG được thêm package mới** mà không có lý do rõ ràng và được User approve trước. Mỗi package thêm vào = thêm 1 dependency phải maintain.

---

## R2. Cấu trúc thư mục — Feature-First Architecture

```
lib/
├── main.dart                         # Entry point duy nhất
├── app.dart                          # MaterialApp + GoRouter + ProviderScope
│
├── core/                             # ⚙️ Nền tảng dùng chung toàn app
│   ├── constants/                    # Màu, font size, spacing, strings
│   │   ├── app_colors.dart           # Tất cả màu sắc (#F05A1F, #F9F7F4...)
│   │   ├── app_typography.dart       # TextStyle cho heading, body, mono
│   │   ├── app_spacing.dart          # 8px grid constants
│   │   └── app_strings.dart          # Chuỗi text tĩnh
│   ├── theme/
│   │   └── app_theme.dart            # ThemeData chính (light theme)
│   ├── router/
│   │   └── app_router.dart           # GoRouter config + tất cả routes
│   └── utils/                        # Helper functions dùng chung
│       ├── formatters.dart           # Format số, ngày, thời gian
│       └── validators.dart           # Validate input
│
├── shared/                           # 🧩 Widget tái sử dụng toàn app
│   ├── widgets/                      # UI components dùng chung
│   │   ├── app_card.dart             # Card chuẩn (white, border, shadow)
│   │   ├── app_button.dart           # Primary, Secondary, Outline buttons
│   │   ├── app_badge.dart            # Pill badge (streak, tag)
│   │   ├── app_bottom_nav.dart       # Bottom Tab Bar (1 chỗ duy nhất!)
│   │   ├── app_avatar.dart           # Avatar tròn có viền
│   │   ├── app_progress_ring.dart    # Vòng progress (readiness, calories)
│   │   ├── app_chip.dart             # Chip pill (equipment, filter)
│   │   ├── app_section_header.dart   # Label + optional action link
│   │   └── ...
│   └── extensions/                   # Extension methods cho Dart types
│       ├── context_ext.dart          # context.colorScheme, context.textTheme
│       └── num_ext.dart              # 8.h, 16.w (spacing shortcuts)
│
├── features/                         # 📱 Mỗi feature = 1 folder độc lập
│   ├── onboarding/
│   │   ├── screens/                  # Các màn hình
│   │   │   ├── welcome_screen.dart
│   │   │   ├── goal_selection_screen.dart
│   │   │   └── ...
│   │   ├── widgets/                  # Widget CHỈ dùng trong onboarding
│   │   │   ├── goal_card.dart
│   │   │   └── equipment_chip.dart
│   │   ├── providers/                # Riverpod providers
│   │   │   └── onboarding_provider.dart
│   │   └── models/                   # Data models (freezed)
│   │       └── user_goal.dart
│   │
│   ├── dashboard/
│   │   ├── screens/
│   │   │   └── dashboard_screen.dart # Logic chọn variant bên trong
│   │   ├── widgets/
│   │   │   ├── readiness_card.dart
│   │   │   ├── workout_hero_card.dart
│   │   │   ├── weekly_dots.dart
│   │   │   └── stats_row.dart
│   │   └── providers/
│   │       └── dashboard_provider.dart
│   │
│   ├── workout/                      # Workout flow (active, rest, complete)
│   ├── ai_coach/                     # Chat, insights, weekly review
│   ├── planning/                     # Calendar, timeline, mood-to-workout
│   ├── progress/                     # Stats, charts, photos, records
│   ├── nutrition/                    # Macros, meal plan, scanner
│   ├── profile/                      # User profile, equipment, settings
│   └── gamification/                 # Streaks, badges, challenges, leaderboard
│
└── data/                             # 💾 Data layer
    ├── models/                       # Freezed data classes dùng chung
    │   ├── workout.dart
    │   ├── exercise.dart
    │   ├── user_profile.dart
    │   └── ...
    ├── repositories/                 # Repository pattern (abstract + impl)
    │   ├── workout_repository.dart
    │   └── user_repository.dart
    └── datasources/                  # Hive DB, SharedPrefs, future API
        ├── local/
        │   ├── hive_service.dart
        │   └── prefs_service.dart
        └── remote/                   # Để dành cho tương lai (API, Firebase)
            └── api_service.dart
```

### Quy tắc cấu trúc:

- **Feature-First**: Mỗi feature (dashboard, workout, progress...) có thư mục riêng chứa `screens/`, `widgets/`, `providers/`, `models/`.
- **Shared widgets** (`lib/shared/widgets/`) = widget dùng ở **≥2 features**. Nếu widget chỉ dùng trong 1 feature → để trong `features/xxx/widgets/`.
- **KHÔNG BAO GIỜ** import widget từ `features/A/widgets/` sang `features/B/`. Nếu cần dùng chung → chuyển lên `shared/widgets/`.

---

## R3. Design System — Single Source of Truth

### R3.1 Màu sắc — Chỉ dùng qua `AppColors`

```dart
// lib/core/constants/app_colors.dart
abstract final class AppColors {
  // Backgrounds
  static const warmIvory = Color(0xFFF9F7F4);
  static const cardWhite = Color(0xFFFFFFFF);
  static const inputBg = Color(0xFFF3F1ED);

  // Primary
  static const sportOrange = Color(0xFFF05A1F);
  static const sportOrangeLight = Color(0xFFFFF0EB); // badge/tint bg

  // Secondary Accents
  static const aiBlue = Color(0xFF2070CC);
  static const success = Color(0xFF2BA86A);
  static const energy = Color(0xFFF5A623);
  static const recovery = Color(0xFF7C5CC4);
  static const recoveryLight = Color(0xFFF5F0FF); // rest day tint

  // Text
  static const textDark = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF5C5C5C);
  static const textDisabled = Color(0xFF8C8C8C);

  // Borders & Dividers
  static const border = Color(0xFFE2E0DC);
}
```

> [!CAUTION]
> **TUYỆT ĐỐI KHÔNG hardcode màu.** Không `Color(0xFFF05A1F)` trong widget. Luôn dùng `AppColors.sportOrange`.

### R3.2 Typography — Chỉ dùng qua `AppTypography`

```dart
// lib/core/constants/app_typography.dart
abstract final class AppTypography {
  // Headings — DM Sans
  static TextStyle h1 = GoogleFonts.dmSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textDark);
  static TextStyle h2 = GoogleFonts.dmSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.textDark);
  static TextStyle h3 = GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static TextStyle h4 = GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);

  // Body — Manrope
  static TextStyle bodyLarge = GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static TextStyle bodyMedium = GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static TextStyle bodySmall = GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textMuted);
  static TextStyle bodySemiBold = GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textMuted);

  // Labels — Manrope SemiBold
  static TextStyle label = GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textDisabled);
  static TextStyle labelUppercase = GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textDisabled, letterSpacing: 1);

  // Mono — JetBrains Mono (stats, timers, numbers)
  static TextStyle statLarge = GoogleFonts.jetBrainsMono(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static TextStyle statMedium = GoogleFonts.jetBrainsMono(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static TextStyle statSmall = GoogleFonts.jetBrainsMono(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textDark);
}
```

> **KHÔNG** dùng `TextStyle(fontSize: 18, ...)` trực tiếp. Luôn dùng `AppTypography.h4`.
> Nếu cần đổi màu: `AppTypography.h4.copyWith(color: AppColors.sportOrange)`.

### R3.3 Spacing — 8px Grid bắt buộc

```dart
// lib/core/constants/app_spacing.dart
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double base = 16;   // Chuẩn screen padding
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;
  static const double xxxl = 48;

  // Radius
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusFull = 999;

  // Screen
  static const screenPadding = EdgeInsets.symmetric(horizontal: base);
  static const cardPadding = EdgeInsets.all(base);
}
```

> **TUYỆT ĐỐI KHÔNG viết** `padding: EdgeInsets.all(15)` hay `SizedBox(height: 10)`.
> Chỉ dùng bội số 8: `4, 8, 12, 16, 24, 32, 40, 48`. Padding 12px được chấp nhận cho card nhỏ.

---

## R4. Widget Rules — Viết widget đúng cách

### R4.1 Phân tách Widget — Không quá 80 dòng

- Một Widget file **KHÔNG được quá 120 dòng** (bao gồm cả import).
- Nếu `build()` method dài hơn **50 dòng** → extract ra widget con.
- Mỗi file `.dart` chỉ chứa **1 public widget** (có thể có private helper widget bên trong).

### R4.2 Đặt tên Widget

```
✅ Đúng:
  WorkoutHeroCard        → rõ nghĩa, biết ngay là cái gì
  ReadinessProgressRing  → rõ nghĩa
  WeeklyDots             → rõ nghĩa

❌ Sai:
  MyWidget               → vô nghĩa
  Card1                  → không ai hiểu
  CustomButton           → "Custom" cái gì?
```

### R4.3 Tham số Widget — Dùng `required` thông minh

```dart
// ✅ Đúng — widget linh hoạt, tái sử dụng được
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.color = AppColors.cardWhite,
    this.borderRadius = AppSpacing.radiusLg,
    this.hasShadow = true,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final double borderRadius;
  final bool hasShadow;
  // ...
}

// ❌ Sai — hardcode hết, không tái sử dụng được
class WorkoutCard extends StatelessWidget {
  // Không nhận parameter nào cả, hardcode bên trong build()
}
```

### R4.4 StatelessWidget vs StatefulWidget

- **Mặc định dùng `StatelessWidget`**. Hầu hết UI của ForgeAI là hiển thị data từ Riverpod.
- Chỉ dùng `StatefulWidget` khi cần: `AnimationController`, `TextEditingController`, `ScrollController`, hoặc lifecycle (`initState`/`dispose`).
- **KHÔNG BAO GIỜ** dùng `setState()` để quản lý business logic. Business logic → Riverpod Provider.

### R4.5 const Constructor — Bắt buộc

```dart
// ✅ Luôn dùng const constructor
const AppBadge({super.key, required this.text});

// ✅ Luôn dùng const khi khởi tạo widget tĩnh
child: const SizedBox(height: AppSpacing.base)
```

---

## R5. Riverpod — Quy tắc State Management

### R5.1 Loại Provider

| Khi nào                           | Dùng gì                                           |
| --------------------------------- | ------------------------------------------------- |
| Giá trị tĩnh, computed, không đổi | `Provider`                                        |
| State đơn giản (toggle, counter)  | `StateProvider`                                   |
| State phức tạp (object, list)     | `NotifierProvider` (hoặc `AsyncNotifierProvider`) |
| Fetch data 1 lần (Future)         | `FutureProvider`                                  |
| Stream realtime                   | `StreamProvider`                                  |

### R5.2 Đặt tên Provider

```dart
// ✅ Đúng — tên rõ ràng, kết thúc bằng Provider
final dashboardStateProvider = NotifierProvider<DashboardNotifier, DashboardState>(DashboardNotifier.new);
final currentWorkoutProvider = StateProvider<Workout?>((ref) => null);
final weeklyVolumeProvider = FutureProvider<double>((ref) async { ... });

// ❌ Sai
final data = StateProvider(...);     // "data" cái gì?
final provider1 = Provider(...);     // vô nghĩa
```

### R5.3 Provider scope

- Provider cho **toàn app** (user profile, settings) → đặt trong `lib/data/` hoặc `lib/core/`.
- Provider cho **1 feature** (dashboard state, workout timer) → đặt trong `features/xxx/providers/`.
- **KHÔNG BAO GIỜ** sửa state trực tiếp trong Widget. Gọi method trên Notifier:

```dart
// ✅ Đúng
ref.read(workoutProvider.notifier).startWorkout();

// ❌ Sai — manipulate trực tiếp
ref.read(workoutProvider.notifier).state = newState;
```

---

## R6. Data Models — Freezed bắt buộc

```dart
// ✅ Luôn dùng freezed cho data model
@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required int durationMinutes,
    required List<Exercise> exercises,
    @Default(false) bool isCompleted,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}
```

- **Tất cả data models phải dùng `@freezed`.** Không viết class thường với mutable fields.
- Đặt model trong `features/xxx/models/` nếu chỉ dùng trong 1 feature.
- Đặt model trong `lib/data/models/` nếu dùng chung ≥2 features.

---

## R7. Routing — GoRouter Rules

```dart
// Tất cả route paths định nghĩa ở 1 chỗ duy nhất
abstract final class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const dashboard = '/dashboard';
  static const workout = '/workout/:id';
  static const aiChat = '/ai-coach';
  static const progress = '/progress';
  static const profile = '/profile';
}
```

- **KHÔNG hardcode** route string trong code: `context.go('/dashboard')` → `context.go(AppRoutes.dashboard)`.
- Bottom Tab Bar sử dụng `StatefulShellRoute` của GoRouter.
- Onboarding flow kiểm tra qua `redirect` guard trong router config.

---

## R8. Quy tắc Import

```dart
// ✅ Đúng — thứ tự import chuẩn, separated by blank lines
import 'package:flutter/material.dart';               // 1. Flutter SDK

import 'package:flutter_riverpod/flutter_riverpod.dart'; // 2. Packages bên ngoài
import 'package:go_router/go_router.dart';

import 'package:forge_ai/core/constants/app_colors.dart'; // 3. Project imports
import 'package:forge_ai/shared/widgets/app_card.dart';

// ❌ Sai — relative import, không có thứ tự
import '../../shared/widgets/app_card.dart';
import 'dart:math';
import 'package:flutter/material.dart';
```

- **Luôn dùng absolute import** (`package:forge_ai/...`) — chỉ dùng relative import cho file cùng thư mục.
- Thứ tự: `dart:` → `package:flutter/` → `package:third_party/` → `package:forge_ai/`.

---

## R9. Quy tắc đặt tên

| Loại              | Convention                        | Ví dụ                             |
| ----------------- | --------------------------------- | --------------------------------- |
| File              | `snake_case`                      | `workout_hero_card.dart`          |
| Class/Widget      | `PascalCase`                      | `WorkoutHeroCard`                 |
| Variable/Function | `camelCase`                       | `currentStreak`, `startWorkout()` |
| Constant          | `camelCase`                       | `sportOrange`, `radiusLg`         |
| Enum              | `PascalCase` + `camelCase` values | `WorkoutType.upperBody`           |
| Provider          | `camelCase` + đuôi `Provider`     | `dashboardStateProvider`          |
| Private           | prefix `_`                        | `_buildHeader()`, `_timer`        |

---

## R10. Performance Rules

### R10.1 Widget rebuild

- Dùng `ConsumerWidget` thay vì `Consumer` builder khi toàn bộ widget phụ thuộc vào provider.
- Dùng `ref.watch()` cho UI cần reactive. Dùng `ref.read()` trong callbacks (`onPressed`, `onTap`).
- **KHÔNG watch() trong callbacks**, **KHÔNG read() trong build()**.

### R10.2 Image & Assets

- Ảnh tĩnh (icon, illustration) → dùng SVG (`flutter_svg`) khi có thể.
- Ảnh user upload (progress photo) → cache với size constraint, dùng `Image.file` + resize.
- **KHÔNG** load ảnh full resolution vào ListView.

### R10.3 List Performance

- List dài (workout history, exercise list) → **luôn dùng `ListView.builder`**, KHÔNG dùng `Column` + `List.map`.
- Nếu list > 100 items → xem xét dùng `ListView.separated` với item caching.

---

## R11. Error Handling

```dart
// ✅ Đúng — xử lý lỗi rõ ràng
try {
  await workoutRepository.saveWorkout(workout);
} on HiveError catch (e) {
  // Xử lý lỗi database cụ thể
  debugPrint('DB Error: $e');
} catch (e, stackTrace) {
  // Fallback cho lỗi không mong đợi
  debugPrint('Unexpected: $e\n$stackTrace');
}

// ❌ Sai — nuốt lỗi im lặng
try {
  await workoutRepository.saveWorkout(workout);
} catch (_) {} // KHÔNG BAO GIỜ LÀM THẾ NÀY
```

- **KHÔNG BAO GIỜ** catch lỗi và bỏ qua (`catch (_) {}`).
- Dùng `AsyncValue` từ Riverpod để handle loading/error/data states trong UI.

---

## R12. Do's & Don'ts Tổng Hợp

### ✅ LUÔN làm:

- Tìm widget có sẵn trong `shared/widgets/` trước khi tạo mới
- Dùng `AppColors`, `AppTypography`, `AppSpacing` cho mọi giá trị visual
- Viết `const` constructor cho mọi widget có thể
- Tách widget khi `build()` > 50 dòng
- Dùng `freezed` cho data models
- Test trên cả iOS và Android simulator
- Comment bằng tiếng Anh khi logic phức tạp

### ❌ KHÔNG BAO GIỜ làm:

- Hardcode màu (`Color(0xFF...)`) trong widget
- Hardcode spacing (`SizedBox(height: 15)`) không theo 8px grid
- Copy-paste widget để tạo variant → mở rộng widget gốc bằng parameter
- Dùng `setState()` cho business logic
- Để file widget > 120 dòng
- Import relative khi cross-feature (`../../features/other/...`)
- Thêm package mới mà không được approve
- Dùng `print()` → dùng `debugPrint()`
- Viết widget không có `const` constructor khi có thể

---

## R13. Quy trình khi Agent AI viết code

```
1. ĐỌC file này (AGENTS.md) TRƯỚC
2. SEARCH project tìm widget/component tương tự
3. Nếu có → REUSE hoặc MỞ RỘNG
4. Nếu không → TẠO MỚI theo đúng folder structure (R2)
5. Dùng ĐÚNG Design System (R3): AppColors, AppTypography, AppSpacing
6. ĐẶT TÊN đúng convention (R9)
7. KIỂM TRA widget < 120 dòng (R4.1)
8. CHẠY `flutter analyze` đảm bảo 0 warnings
```

---

> _Rules version 1.0 — ForgeAI Flutter Project_
> _Last updated: 2026-04-18_
