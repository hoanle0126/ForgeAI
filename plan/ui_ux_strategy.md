# 🎨 FORGE AI — UI/UX Strategy

> **Tài liệu chiến lược giao diện & trải nghiệm người dùng toàn diện.**
> Screen-by-screen specification. Design language. Motion system.

---

## 1. Design Language: "Athletic Clean Sport"

### 1.1 Triết lý thiết kế

Không phải neon cyberpunk. Không phải dark moody luxury.

Đây là **sport premium** — lấy cảm hứng từ Nike Training Club, Strava, Apple Fitness+:

- **Clean & Confident** — nền sáng, khoảng trắng rộng, tạo cảm giác chuyên nghiệp và đáng tin cậy
- **Bold Athletic** — typography mạnh mẽ, accent cam/đỏ năng động, truyền cảm hứng hành động
- **Smart Warmth** — không lạnh lẽo tech, mà ấm áp như có huấn luyện viên thật bên cạnh

> **Một câu:** _"Mở app = mở cuốn sổ tập luyện cá nhân — sạch sẽ, rõ ràng, sẵn sàng chiến."_

### 1.2 Color System

#### Core Palette (Light Mode — Primary)

| Token             | HSL                 | Hex       | Vai trò                                  |
| ----------------- | ------------------- | --------- | ---------------------------------------- |
| `--bg-base`       | `hsl(40, 20%, 97%)` | `#F9F7F4` | Nền chính — warm ivory, không trắng cứng |
| `--bg-surface`    | `hsl(0, 0%, 100%)`  | `#FFFFFF` | Card, bottom sheet                       |
| `--bg-elevated`   | `hsl(40, 15%, 95%)` | `#F3F1ED` | Section background, input field          |
| `--bg-muted`      | `hsl(40, 10%, 92%)` | `#ECEAE6` | Disabled, skeleton, chip unselected      |
| `--border-subtle` | `hsl(40, 8%, 88%)`  | `#E2E0DC` | Card border, divider                     |
| `--border-active` | `hsl(16, 90%, 50%)` | `#F05A1F` | Selected card border                     |

#### Text Colors

| Token              | Hex       | Vai trò                                |
| ------------------ | --------- | -------------------------------------- |
| `--text-primary`   | `#1A1A1A` | Headings, primary text (contrast 15:1) |
| `--text-secondary` | `#5C5C5C` | Body text, descriptions (contrast 7:1) |
| `--text-muted`     | `#8C8C8C` | Captions, timestamps (contrast 4.6:1)  |
| `--text-inverse`   | `#FFFFFF` | Text trên nền accent                   |

#### Accent Colors

| Token                   | HSL                  | Hex       | Khi dùng                                |
| ----------------------- | -------------------- | --------- | --------------------------------------- |
| `--accent-primary`      | `hsl(16, 90%, 50%)`  | `#F05A1F` | Primary CTA, active state, sport energy |
| `--accent-primary-soft` | `hsl(16, 90%, 95%)`  | `#FEF0EB` | Primary tint cho background             |
| `--accent-blue`         | `hsl(215, 75%, 50%)` | `#2070CC` | AI features, coach, data, links         |
| `--accent-blue-soft`    | `hsl(215, 75%, 95%)` | `#EBF2FC` | Blue tint background                    |
| `--accent-green`        | `hsl(150, 60%, 42%)` | `#2BA86A` | Success, completed, streak              |
| `--accent-green-soft`   | `hsl(150, 60%, 94%)` | `#E8F8F0` | Green tint background                   |
| `--accent-amber`        | `hsl(35, 95%, 55%)`  | `#F5A623` | Warning, energy, fat burn               |
| `--accent-purple`       | `hsl(260, 55%, 55%)` | `#7C5CC4` | Recovery, rest, meditation              |

#### Workout Mode Colors

Accent thay đổi dựa trên workout mode hiện tại:

| Mode                  | Primary accent   | Card accent bg | Vibe                 |
| --------------------- | ---------------- | -------------- | -------------------- |
| **Performance**       | Orange `#F05A1F` | `#FEF0EB`      | "Let's go!"          |
| **Fat Burn**          | Amber `#F5A623`  | `#FFF8E8`      | "Sweat it out"       |
| **Recovery**          | Purple `#7C5CC4` | `#F3EFFC`      | "Breathe and heal"   |
| **Quick / Fallback**  | Blue `#2070CC`   | `#EBF2FC`      | "Efficient, no fuss" |
| **Quiet / Apartment** | Green `#2BA86A`  | `#E8F8F0`      | "Gentle and silent"  |

#### Dark Mode (Secondary)

| Token              | Light value | Dark value                               |
| ------------------ | ----------- | ---------------------------------------- |
| `--bg-base`        | `#F9F7F4`   | `#141414`                                |
| `--bg-surface`     | `#FFFFFF`   | `#1E1E1E`                                |
| `--bg-elevated`    | `#F3F1ED`   | `#282828`                                |
| `--text-primary`   | `#1A1A1A`   | `#F0F0F0`                                |
| `--text-secondary` | `#5C5C5C`   | `#A0A0A0`                                |
| `--border-subtle`  | `#E2E0DC`   | `#333333`                                |
| `--accent-primary` | `#F05A1F`   | `#F06A35` (slightly lighter for dark bg) |

### 1.3 Typography

| Role                            | Font           | Weight          | Size                           |
| ------------------------------- | -------------- | --------------- | ------------------------------ |
| **Display** (hero, big numbers) | DM Sans        | 800 (ExtraBold) | `clamp(2rem, 5vw, 3.5rem)`     |
| **Heading** (section titles)    | DM Sans        | 700 (Bold)      | `clamp(1.25rem, 3vw, 1.75rem)` |
| **Body** (descriptions)         | Manrope        | 400             | `clamp(0.875rem, 2vw, 1rem)`   |
| **Label** (buttons, tags)       | Manrope        | 600             | `0.8125rem`                    |
| **Caption** (timestamps, meta)  | Manrope        | 400             | `0.75rem`                      |
| **Mono** (stats, timers)        | JetBrains Mono | 600             | varies                         |

> **DM Sans** — geometric, bold, athletic feel (kiểu Nike/Adidas typography). **Manrope** — geometric sans-serif rất sạch, dễ đọc trên mobile. Cả 3 font đều **OFL licensed** — an toàn cho commercial.

### 1.4 Spacing & Grid

- **Base unit**: 8px
- **Giá trị cho phép**: 4, 8, 12, 16, 24, 32, 40, 48, 56, 64, 80, 96, 120, 160
- **Screen padding**: 16px (mobile), 24px (tablet)
- **Card gap**: 12px hoặc 16px
- **Section gap**: 32px hoặc 48px

### 1.5 Radius System

| Element                 | Radius             |
| ----------------------- | ------------------ |
| Small pill (tag, badge) | 8px                |
| Button                  | 12px               |
| Card                    | 16px               |
| Modal / Bottom sheet    | 24px (top corners) |
| Avatar                  | 50% (circle)       |

### 1.6 Elevation & Surfaces

| Level             | Style                                                                                   |
| ----------------- | --------------------------------------------------------------------------------------- |
| **Base card**     | `bg: --bg-surface` + `border: 1px solid --border-subtle` + `border-radius: 16px`        |
| **Elevated card** | Base card + `box-shadow: 0 2px 8px hsla(0,0%,0%,0.06), 0 1px 2px hsla(0,0%,0%,0.04)`    |
| **Active card**   | Base card + `border: 2px solid --accent-primary` + `bg: --accent-primary-soft`          |
| **Bottom sheet**  | `bg: --bg-surface` + `shadow: 0 -4px 24px hsla(0,0%,0%,0.08)` + `radius: 24px 24px 0 0` |
| **Modal overlay** | `bg: hsla(0,0%,0%,0.3)` — light scrim, not heavy                                        |

> **Không glassmorphism**. Card clean, solid surface, subtle border. Shadow nhẹ tạo depth thay vì blur.

### 1.7 Iconography

- **Library**: Phosphor Icons — **bold** variant (sport feel mạnh hơn duotone)
- **Size**: 24x24 default, 20x20 compact, 32x32 header
- **Color**: `--text-muted` (#8C8C8C) inactive → `--accent-primary` (#F05A1F) active

---

## 2. Motion System

### 2.1 Nguyên tắc

- **Chỉ animate**: `transform` (translate, scale, rotate) + `opacity` — GPU-accelerated
- **KHÔNG animate**: width, height, top, left, margin, padding
- **Spring-based**: natural feel, không linear
- **Respect**: `prefers-reduced-motion` → tắt hết animation

### 2.2 Motion Tokens

| Token            | Duration | Easing            | Dùng cho                          |
| ---------------- | -------- | ----------------- | --------------------------------- |
| `MOTION.instant` | 100ms    | ease-out          | Hover feedback, toggle            |
| `MOTION.fast`    | 200ms    | ease-out          | Button press, tab switch          |
| `MOTION.normal`  | 300ms    | spring(0.5, 0.8)  | Card transitions, modal open      |
| `MOTION.slow`    | 500ms    | spring(0.3, 0.7)  | Page transitions, celebrations    |
| `MOTION.breath`  | 2000ms   | ease-in-out, loop | Readiness ring pulse, AI thinking |

### 2.3 Interaction Patterns

| Interaction             | Animation                                            |
| ----------------------- | ---------------------------------------------------- |
| Card tap                | scale(0.97) → scale(1) + haptic light                |
| Page enter              | translateY(24px) + opacity(0) → origin, stagger 50ms |
| Bottom sheet            | translateY(100%) → translateY(0), spring             |
| Confetti (workout done) | Lottie/Rive file, 2s, one-shot                       |
| Streak flame            | Rive animation, loop khi visible                     |
| Progress ring fill      | SVG stroke-dashoffset animate, 800ms                 |
| AI typing               | 3-dot pulse, 400ms cycle                             |
| Skeleton loading        | shimmer gradient translate, 1.5s loop                |

---

## 3. Screen Inventory — 65 Screens

### Tổng quan

| Category              |    Screens     | Tier |
| --------------------- | :------------: | :--: |
| Onboarding            |       6        | MVP  |
| Dashboard             | 1 + 4 variants | MVP  |
| Workout Flow          |       10       | MVP  |
| AI Coach              |       3        | MVP  |
| Planning              |       5        | MVP  |
| Progress              |       7        | MVP  |
| Nutrition             |       5        | v1.0 |
| Profile & Settings    |       7        | MVP  |
| Gamification          |       5        | v1.0 |
| Paywall               |   3 variants   | MVP  |
| Empty / Error States  |       4        | MVP  |
| App Store Screenshots |       5        | MVP  |
| **TOTAL**             |     **65**     |  —   |

---

### 3.1 🚀 Onboarding (6 screens)

#### Screen 1: Welcome Splash

```
┌────────────────────────┐
│                        │
│     [Logo Animation]   │
│                        │
│    "Your AI Coach       │
│     Lives Here"         │
│                        │
│  [Get Started → ]      │
│  [I have an account]   │
│                        │
└────────────────────────┘
```

- **Mục đích**: First impression — 3 giây quyết định install hay delete
- **Visual**: Nền warm ivory `--bg-base`. Logo animate nhẹ (scale up + fade). Tagline bold DM Sans. Clean, breathable whitespace.
- **CTA**: Nút primary "Get Started" full-width, `--accent-primary` (sport orange), text trắng, bold. Text link "I have an account" `--text-muted`.
- **Motion**: Logo entrance 0.8s spring → tagline fade 0.3s delay 0.5s → CTA slide up 0.3s delay 0.8s

#### Screen 2: Goal Selection

```
┌────────────────────────┐
│  ← Back                │
│                        │
│  What's your #1 goal?  │
│                        │
│  ┌──────────────────┐  │
│  │ 🔥 Lose Fat      │  │
│  └──────────────────┘  │
│  ┌──────────────────┐  │
│  │ 💪 Build Muscle   │  │
│  └──────────────────┘  │
│  ┌──────────────────┐  │
│  │ ⚡ Get Stronger   │  │
│  └──────────────────┘  │
│  ┌──────────────────┐  │
│  │ 🧘 Stay Active    │  │
│  └──────────────────┘  │
│                        │
│  [Continue → ]         │
└────────────────────────┘
```

- **Mục đích**: Xác định mục tiêu chính → AI dùng cho toàn bộ plan
- **Visual**: Mỗi option là elevated card (white surface, subtle border). Icon bên trái (Phosphor bold, KHÔNG emoji — emoji ở wireframe chỉ minh họa). Selected card có orange border 2px + soft orange bg tint `--accent-primary-soft` + check icon.
- **Interaction**: Single select. Tap card → scale bounce 0.97 → 1 + haptic. Auto-scroll nếu cần.
- **Copy**: KHÔNG viết cứng text — t("onboarding.goal.title"), t("onboarding.goal.loseFat") v.v.

#### Screen 3: Equipment Inventory

```
┌────────────────────────┐
│  ← Back                │
│                        │
│  What equipment do     │
│  you have at home?     │
│                        │
│  [Dumbbells] [Bands]   │
│  [Yoga Mat] [Pull Bar] │
│  [Bench]   [Kettlebell]│
│  [None - Bodyweight]   │
│                        │
│  ── or ──              │
│  [📷 Scan Your Room]   │ ← v1.0 feature
│                        │
│  [Continue → ]         │
└────────────────────────┘
```

- **Mục đích**: AI biết user có gì → generate workout chính xác
- **Visual**: Grid chip layout, 2 cột. Mỗi chip = white card nhỏ, icon + label. Multi-select — selected chip có orange border + soft orange tint + check icon.
- **"None" option**: Riêng 1 hàng full-width, nhấn mạnh — bodyweight là OK.
- **Scan Room**: Placeholder ở MVP (disabled, nhãn "Coming soon"). v1.0 mở AR camera scan.

#### Screen 4: Body Profile

```
┌────────────────────────┐
│  ← Back                │
│                        │
│  Quick body profile    │
│                        │
│  Height: [___] cm      │
│  Weight: [___] kg      │
│  Age:    [___]         │
│                        │
│  Activity level:       │
│  [Sedentary] [Light]   │
│  [Active] [Very Active]│
│                        │
│  [ Skip for now ]      │
│  [Continue → ]         │
└────────────────────────┘
```

- **Mục đích**: Data cho AI tính TDEE, đề xuất cường độ
- **Visual**: White elevated card chứa form. Input field rounded, bg `--bg-elevated`, border on focus `--accent-primary`. Number picker wheel cho mobile native.
- **Privacy**: Nhỏ text dưới form — "Your data stays on this device. We never share it."
- **Skip option**: Không ép buộc — user có thể bỏ qua, AI dùng defaults.

#### Screen 5: Schedule Preference

```
┌────────────────────────┐
│  ← Back                │
│                        │
│  When do you want      │
│  to train?             │
│                        │
│  Preferred days:       │
│  [M] [T] [W] [T] [F]  │
│  [S] [S]               │
│                        │
│  Session length:       │
│  ◄────●──────────► 30m │
│                        │
│  Preferred time:       │
│  [Morning] [Afternoon] │
│  [Evening] [Flexible]  │
│                        │
│  [Continue → ]         │
└────────────────────────┘
```

- **Mục đích**: AI fit workout vào cuộc sống thật của user
- **Visual**: Day selector = circle chips, orange fill + white text khi selected, muted bg khi unselected. Slider cho session length (15-60 phút, step 5), thumb = orange. Time preference = chip group single select.
- **Smart default**: 3 ngày/tuần, 30 phút, flexible — thấp ngưỡng để user không sợ.

#### Screen 6: AI Plan Preview

```
┌────────────────────────┐
│                        │
│  [AI Avatar Animation] │
│                        │
│  "Here's your          │
│   12-week plan"        │
│                        │
│  Week 1-4: Foundation  │
│  ├── 3x strength       │
│  └── 1x mobility       │
│                        │
│  Week 5-8: Build       │
│  ├── 4x strength       │
│  └── 1x HIIT           │
│                        │
│  Week 9-12: Peak       │
│  ├── 4x progressive    │
│  └── 1x challenge      │
│                        │
│  "I'll adjust this     │
│   every day based on   │
│   how you feel."       │
│                        │
│  [Let's Start! → ]     │
└────────────────────────┘
```

- **Mục đích**: "Wow moment" — user thấy AI đã lắng nghe và tạo kế hoạch riêng
- **Visual**: AI avatar (Rive animation, nhỏ, abstract geometric shape — KHÔNG mặt người). Timeline dạng vertical line + nodes. Mỗi phase khác color (orange → blue → green). Nền warm ivory, cards trắng.
- **Copy**: AI "nói" ở first person — tạo cảm giác có personality.
- **CTA**: Primary button "Let's Start!" full-width, `--accent-primary` sport orange, text trắng bold. Đây là conversion point #1.

---

### 3.2 🏠 Dashboard — "Today" Screen (1 screen + 4 variants)

> _Đây là screen quan trọng nhất toàn app. Mở app = mở screen này._

#### Main Dashboard

```
┌────────────────────────┐
│ [Avatar]  Good evening │
│           Day 12 🔥     │
├────────────────────────┤
│                        │
│ ┌────────────────────┐ │
│ │ READINESS          │ │
│ │ ●●●●●●●○○○  72%   │ │
│ │ "Slept 6h, energy  │ │
│ │  moderate. I made  │ │
│ │  today lighter."   │ │
│ └────────────────────┘ │
│                        │
│ ┌────────────────────┐ │
│ │ TODAY'S WORKOUT    │ │
│ │ Upper Body Focus   │ │
│ │ 28 min · 6 exercises│ │
│ │                    │ │
│ │ [▶ Start Workout]  │ │
│ │ [Make it shorter]  │ │
│ └────────────────────┘ │
│                        │
│ ┌────────────────────┐ │
│ │ WEEKLY PROGRESS    │ │
│ │ ●●●○○○○  3/5 days  │ │
│ │ Mon Tue Wed ...    │ │
│ └────────────────────┘ │
│                        │
│ ┌──────┐ ┌──────────┐ │
│ │ Vol  │ │ Streak   │ │
│ │ 12.4k│ │ 12 days  │ │
│ │ lbs  │ │ 🔥        │ │
│ └──────┘ └──────────┘ │
│                        │
│ [──  ──  ──  ──  ──]  │
│  Home Plan Progress Me │
└────────────────────────┘
```

**Nguyên tắc**: Screen trả lời 5 câu hỏi trong 3 giây:

1. Hôm nay tập gì? → **Today's Workout card**
2. Mất bao lâu? → **"28 min · 6 exercises"**
3. Có hợp trạng thái hôm nay? → **Readiness meter + AI note**
4. Đang tiến bộ không? → **Weekly progress + streak**
5. Lỡ bận thì sao? → **"Make it shorter" secondary CTA**

**Components chi tiết:**

| Widget             | Layout                                                                                                                 | Data                                                |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| **Header**         | Avatar circle (40px) + greeting text DM Sans bold + streak badge (orange pill)                                         | User name, current time → greeting, streak count    |
| **Readiness Card** | White elevated card, readiness bar (segmented, fill = green→amber→orange), AI message text `--text-secondary`          | Sleep data, mood input, AI-generated note           |
| **Workout Card**   | White elevated card **largest**, icon + title DM Sans bold + meta Manrope, 2 CTAs (primary orange + secondary outline) | AI-generated workout name, duration, exercise count |
| **Weekly Ring**    | 7 circles (Mon-Sun), filled = orange, done = green check, faint = `--bg-muted`                                         | Weekly completion data                              |
| **Stats Row**      | 2 mini white cards side-by-side, number in JetBrains Mono bold, label Manrope caption                                  | Total volume, streak                                |
| **Tab Bar**        | Bottom fixed, white bg, 4 tabs (Phosphor bold icons + labels), `--accent-primary` active                               | Navigation state                                    |

**4 Dashboard Variants** (cho marketplace value):

1. **Default** — như trên
2. **Compact** — không có readiness card, workout card nhỏ hơn
3. **Stats-heavy** — thêm calories burned, muscle group radar chart mini
4. **Motivational** — hero quote card + progress photo comparison mini

---

### 3.3 🏋️ Workout Flow (10 screens)

#### Screen W1: Workout Overview

```
┌────────────────────────┐
│ ← Back        [Edit]   │
│                        │
│  Upper Body Focus      │
│  28 min · 6 exercises  │
│  Muscle: Chest, Shoulders│
│                        │
│  Equipment needed:     │
│  [Dumbbells] [Mat]     │
│                        │
│  ┌──────────────────┐  │
│  │ 1. Push-ups  3×12│  │
│  │ 2. DB Press  3×10│  │
│  │ 3. DB Row    3×10│  │
│  │ 4. Plank     3×30s│ │
│  │ 5. Lat Raise 3×12│  │
│  │ 6. Cooldown  5min│  │
│  └──────────────────┘  │
│                        │
│  [▶ Start Workout]     │
│  [🔄 Swap exercises]   │
└────────────────────────┘
```

- **Mục đích**: Preview trước khi tập. User phải đồng ý trước khi bắt đầu.
- **Visual**: Exercise list dạng numbered rows, white surface, subtle dividers. Mỗi row có tên (Manrope 600) + sets/reps (muted). Tap row → mở Exercise Detail. Equipment chips ở trên (filled pills, icon + text).
- **Swap**: Secondary action outline button — AI gợi ý bài thay thế nếu không thích/không có dụng cụ.

#### Screen W2: Exercise Detail

- **Mục đích**: Hướng dẫn chi tiết 1 bài tập
- **Visual**: 3D exercise animation (Lottie/Rive) hoặc video loop phía trên. Tên + muscle group + equipment tag dưới. Instructions dạng numbered steps. Tips card từ AI.

#### Screen W3: Active Workout (Timer Mode)

```
┌────────────────────────┐
│      Exercise 2/6      │
│                        │
│   [Exercise Animation] │
│                        │
│    Dumbbell Press       │
│    Set 2 of 3          │
│                        │
│    ┌────────────────┐  │
│    │  10 reps × 10kg│  │
│    └────────────────┘  │
│                        │
│  [ - ]   [Log Set]   [+]│
│                        │
│  Time: 12:34           │
│                        │
│  [⏸ Pause] [⏭ Skip]  │
└────────────────────────┘
```

- **Mục đích**: Core workout experience — phải tối giản, focus, dễ thao tác 1 tay
- **Visual**: Full-screen clean layout, bg `--bg-base`. Nút lớn (min 48x48 tap target). "Log Set" button = primary orange, full-width. Timer mono font (JetBrains Mono, extra bold). Exercise counter progress bar ở top.
- **Interaction**: Tap "Log Set" → haptic medium + counter animate + button ripple. Plus/minus adjust reps. Swipe left = skip exercise.

#### Screen W4: Rest Timer

```
┌────────────────────────┐
│                        │
│         REST           │
│                        │
│      ┌────────┐        │
│      │  0:47  │        │
│      │  /1:30 │        │
│      └────────┘        │
│   [Ring animation]     │
│                        │
│  Next: Dumbbell Row    │
│  3 × 10 reps           │
│                        │
│  [Skip Rest →]         │
│                        │
│  💡 AI tip:             │
│  "Keep water nearby"   │
│                        │
└────────────────────────┘
```

- **Mục đích**: Nghỉ giữa set. Đếm ngược tự động. Nhẹ nhàng.
- **Visual**: Countdown ring circle lớn (center screen, stroke = `--accent-purple`). Nền `--bg-base` nhẹ nhàng. Next exercise preview card nhỏ phía dưới. AI tip card subtle bg `--bg-elevated` (rotate tips mỗi rest).
- **Sound**: Gentle beep khi hết rest (customizable).

#### Screen W5: Exercise Swap

- **Mục đích**: User không thích/không thể làm bài này → AI gợi ý 3 bài thay thế
- **Visual**: Bottom sheet với 3 alternative cards. Mỗi card: icon + tên + "Same muscle group" tag. Tap để swap.

#### Screen W6: Mood Check (Mid-Workout)

- **Mục đích**: Giữa buổi tập, AI hỏi "Cảm thấy thế nào?" → adjust volume còn lại
- **Visual**: Overlay nhẹ (light scrim), 3 option cards: "Going strong" (green) / "Getting tired" (amber) / "Done for today" (muted). Không ép. Ephemeral — auto-dismiss 5s nếu không chọn.

#### Screen W7: Workout Complete

```
┌────────────────────────┐
│                        │
│   [Confetti Animation] │
│                        │
│    WORKOUT COMPLETE!   │
│                        │
│    28:12  total time   │
│    6      exercises    │
│    2,340  volume (lbs) │
│    156    calories est │
│                        │
│  ┌──────────────────┐  │
│  │ 🔥 Streak: 13!    │  │
│  │ New personal best!│  │
│  └──────────────────┘  │
│                        │
│  [Share Achievement]   │
│  [Done →]              │
│                        │
└────────────────────────┘
```

- **Mục đích**: Celebration moment — reward user, trigger dopamine
- **Visual**: Confetti Lottie 2s. Big stats cards. Streak animation (flame Rive). Personal record badge nếu có.
- **Share**: Generate share card (image) cho Instagram/TikTok story.

#### Screen W8: Post-Workout Summary

- **Mục đích**: AI phân tích buổi tập — so sánh với tuần trước, gợi ý cải thiện
- **Visual**: Stats cards + AI insight paragraph. "Next workout suggestion" card. Rate workout (1-5 stars) cho AI learning.

#### Screen W9: Rate Workout (feedback)

- **Mục đích**: 5-star rating + optional text — AI dùng để improve
- **Visual**: 5 stars tap-to-rate. Optional textarea "What could be better?". Quick tags: "Too easy" / "Too hard" / "Too long" / "Loved it".

#### Screen W10: Workout History

- **Mục đích**: Danh sách buổi tập đã hoàn thành, filter by week/month
- **Visual**: Timeline list, mỗi item = glass card nhỏ (date + workout name + duration + volume). Tap → expand chi tiết.

---

### 3.4 🤖 AI Coach (3 screens)

#### Screen AI1: Chat with Coach

```
┌────────────────────────┐
│ ← Back    Coach ForgeAI│
│                        │
│ ┌──────────────────┐   │
│ │ "You've been      │  │
│ │  consistent for   │  │
│ │  12 days! Let's   │  │
│ │  talk about your  │  │
│ │  next phase."     │  │
│ └──────────────────┘   │
│                        │
│        ┌──────────────┐│
│        │"Can I do more││
│        │ chest work?" ││
│        └──────────────┘│
│                        │
│ ┌──────────────────┐   │
│ │ AI typing...      │  │
│ └──────────────────┘   │
│                        │
│ [Suggestion chips]     │
│ [Type a message... 🎤] │
└────────────────────────┘
```

- **Mục đích**: Tương tác trực tiếp với AI coach. Không phải generic chatbot — có personality, nhớ context.
- **Visual**: Chat bubble layout. AI = left (white card, `--accent-blue-soft` bg tint, blue left border), User = right (`--accent-primary-soft` bg tint). AI avatar icon nhỏ. Suggestion chips dưới input (outline pills). Typing indicator = 3-dot pulse.
- **Tone**: AI nói kiểu PT thân thiện, KHÔNG robotic. First person.

#### Screen AI2: AI Weekly Review

```
┌────────────────────────┐
│ ← Back   Week 3 Review │
│                        │
│ ┌────────────────────┐ │
│ │ "Great week! You   │ │
│ │  hit 4/5 sessions. │ │
│ │  Your upper body   │ │
│ │  volume is up 12%. │ │
│ │  Let's add more    │ │
│ │  leg work next     │ │
│ │  week."            │ │
│ └────────────────────┘ │
│                        │
│  📊 Volume: ▲ 12%      │
│  🔥 Consistency: 80%   │
│  💪 Strength: ▲ 5%     │
│                        │
│  Muscle balance:       │
│  [Radar Chart]         │
│                        │
│  Next week plan:       │
│  [Preview Card]        │
│                        │
│  [Accept Plan]         │
│  [Adjust →]            │
└────────────────────────┘
```

- **Mục đích**: Tổng kết tuần AI-generated. User thấy progress + plan tuần tới.
- **Visual**: AI narrative card (white surface, blue left border accent). Stats row (3 colored pills: green/orange/blue). Radar chart mini cho muscle balance. Next week preview card. Dual CTA (primary orange + outline).

#### Screen AI3: AI Insights Card (modal)

- **Mục đích**: Pop-up insights xuất hiện random — "Bạn tập chest nhiều hơn back 40%", "Hãy thử thêm mobility vào warmup"
- **Visual**: Bottom sheet glass. Icon + insight text + action button. Dismissable swipe down.

---

### 3.5 🗓 Planning (5 screens)

#### Screen P1: Weekly Calendar

- **Mục đích**: Xem lịch tập tuần, kéo thả đổi ngày
- **Visual**: 7-column grid, mỗi ô = 1 ngày, nền `--bg-base`. Workout card nhỏ trong ô (color-coded by type: strength=orange, HIIT=amber, recovery=purple, rest=empty). Tap card → xem chi tiết. Long-press + drag để đổi ngày.

#### Screen P2: Monthly Overview

- **Mục đích**: Bird's eye view — tháng này tập bao nhiêu
- **Visual**: Calendar grid, ngày tập = dot (green filled), ngày miss = faint dot (muted), ngày tới = outline. Heatmap style nhẹ — darker green = more volume.

#### Screen P3: Program Timeline

- **Mục đích**: Xem toàn bộ 12-week plan
- **Visual**: Vertical timeline, 3 phases (Foundation/Build/Peak) với node markers. Current position highlighted. Expandable phase cards.

#### Screen P4: Plan Adjustment

- **Mục đích**: User muốn đổi plan — AI gợi ý options
- **Visual**: Slider adjustments (days/week, session length, intensity). AI preview: "If you change to 4 days, I'd add more HIIT".

#### Screen P5: Rest Day Screen

- **Mục đích**: Ngày nghỉ — không bỏ trống, vẫn có content
- **Visual**: Soft purple tint background `--accent-purple` + white. "Today is rest. Your muscles are rebuilding." Illustration nhẹ. Gentle stretching suggestion card. Hydration reminder. Next workout preview.

---

### 3.6 📈 Progress (7 screens)

#### Screen PR1: Stats Dashboard

- **Mục đích**: Tổng quan tiến bộ — charts đẹp là selling point
- **Visual**: Clean white background, bold sport-colored charts. Total volume trend line (orange). Consistency ring (green). Personal records list (cards). Body weight trend (nếu có data). Charts dùng fill gradient subtle.

#### Screen PR2: Strength Progress

- **Mục đích**: Xem sự tiến bộ từng bài tập
- **Visual**: Exercise picker dropdown → line chart weight over time. Best set highlight. Trend arrow.

#### Screen PR3: Body Composition Timeline

- **Mục đích**: Weight / body fat % over time
- **Visual**: Dual-axis line chart. Photo timeline markers. AI body composition estimate (nếu có).

#### Screen PR4: Photo Comparison

- **Mục đích**: Before/after side-by-side
- **Visual**: Slider comparison (drag left/right). Date pickers cho 2 photos. Full-screen mode.

#### Screen PR5: Personal Records Wall

- **Mục đích**: Hall of fame — best performances
- **Visual**: Card grid, mỗi card = 1 PR (exercise name + weight + date + badge). 3D badge animation khi unlock.

#### Screen PR6: AI Insights Report

- **Mục đích**: AI-generated monthly report
- **Visual**: Long-form card layout. Charts + narrative text xen kẽ. Shareable as image.

#### Screen PR7: Future Self Projection

- **Mục đích**: "Nếu giữ nhịp, 6 tuần nữa bạn sẽ..."
- **Visual**: Projected stats (projected volume, projected streak, projected body change). Motivational. Dual path: "Keep going" vs "If you stop now".

---

### 3.7 🍽 Nutrition (5 screens) — v1.0

#### Screen N1: Daily Macro Dashboard

- Calorie ring + macro breakdown (protein/carb/fat bars). Meal log list.

#### Screen N2: Photo-to-Macro Scanner

- Camera → AI identify food → estimate macros. Result card with adjust option.

#### Screen N3: AI Meal Plan

- Weekly meal plan generated by AI dựa trên goal + preferences. Card per meal.

#### Screen N4: Meal Detail / Recipe

- Ingredients list + instructions + macro info. "Add to today's log" button.

#### Screen N5: Supplement Schedule

- Timeline view: creatine, whey, multivitamin. Reminder toggles.

---

### 3.8 👤 Profile & Settings (7 screens)

#### Screen S1: Profile Overview

- Avatar + name + stats (member since, total workouts, longest streak). Edit button.

#### Screen S2: Body Profile Edit

- Height, weight, age, activity level. Update anytime.

#### Screen S3: Equipment Inventory

- Grid of equipment chips. Add/remove. Use ở workout generation.

#### Screen S4: Wearable Connections

- Apple Health / Google Fit toggle. Garmin, Xiaomi connections. Status indicators.

#### Screen S5: AI Coach Settings

- Coach personality (Motivational / Strict / Chill). Voice on/off. Notification frequency.

#### Screen S6: Subscription Management

- Current plan + upgrade/downgrade. Payment method. Cancel flow.

#### Screen S7: App Settings

- Theme (dark/light/auto). Language. Units (kg/lbs). Notifications. Sound/haptics.

---

### 3.9 🎮 Gamification (5 screens) — v1.0

#### Screen G1: Achievements Gallery

- Badge grid (earned = full color, locked = grayscale). Tap badge → detail + earn condition.

#### Screen G2: Challenges Hub

- Active + available challenges. AI-generated personal challenges. Timer/progress bar per challenge.

#### Screen G3: Leaderboard

- Tabs: Friends / Global / Weekly. Rank list with avatar + score + trend arrow.

#### Screen G4: Streak & Level

- Current streak flame animation. Level progress bar. XP history. Milestone timeline.

#### Screen G5: Share Card Generator

- Auto-generate achievement/workout cards cho social. Customize template, add stats, export as image.

---

### 3.10 💰 Paywall (3 variants)

#### Variant A: Feature Gate

- User hits locked feature → bottom sheet showing what they get with Pro. Feature list + price + CTA.

#### Variant B: Full-Screen Upgrade

- Dedicated page after trial ends. Hero comparison (Free vs Pro vs Elite). Annual savings highlight. Social proof ("12k users upgraded this month").

#### Variant C: Soft Upsell

- After workout complete, subtle card: "Unlock AI Form Coach to perfect your squat." Non-intrusive, dismissable.

---

### 3.11 🚫 Empty & Error States (4 screens)

#### Empty: No Workouts Yet

- Illustration + "Your gym awaits. Let's plan your first workout." CTA to generate first plan.

#### Empty: No Progress Data

- "Complete your first workout to see progress here." Skeleton preview of what charts will look like.

#### Error: Network Offline

- "No connection. Your workout is saved locally. We'll sync when you're back."

#### Error: AI Unavailable

- "Coach is thinking... Try again in a moment." Fallback: show cached last plan.

---

### 3.12 📱 App Store Screenshots (5 screens)

| #   | Screenshot                | Tagline                                        |
| --- | ------------------------- | ---------------------------------------------- |
| 1   | Dashboard "Today" screen  | "Your AI coach adapts to your day"             |
| 2   | Active workout timer      | "Personalized workouts for your equipment"     |
| 3   | Mood-to-Workout selection | "Tell us how you feel. We'll handle the rest." |
| 4   | Progress charts           | "Watch yourself transform"                     |
| 5   | AI Coach chat             | "A coach that learns your rhythm"              |

- **Visual**: Mỗi screenshot = phone frame + clean white/warm background + bold tagline text. Light theme primary showcase.

---

## 4. Tổng Kết

| Metric                         | Target                                                          |
| ------------------------------ | --------------------------------------------------------------- |
| **Total screens**              | 65                                                              |
| **Design language**            | Athletic Clean Sport                                            |
| **Primary mode**               | Light (warm ivory `#F9F7F4`)                                    |
| **Secondary mode**             | Dark (`#141414`)                                                |
| **Primary accent**             | Sport Orange `#F05A1F`                                          |
| **Typography**                 | DM Sans (headings) + Manrope (body) + JetBrains Mono (stats)    |
| **Design system tokens**       | 30+ color, 6 typography, 5 radius, 7 motion                     |
| **Variants** (cho marketplace) | 4 dashboard + 3 paywall = 7 variant                             |
| **Workout mode colors**        | 5 (Performance / Fat Burn / Recovery / Quick / Quiet)           |
| **Surfaces**                   | Clean solid (NO glassmorphism), subtle shadow depth             |
| **Icons**                      | Phosphor Bold                                                   |
| **Marketplace value**          | 65 screens + design system + light/dark + variants = $49-69 UI8 |

---

> _Document version 2.0 — Updated to Athletic Clean Sport, light-first._
