# 🎯 FORGE AI — Stitch Prompt Writing Plan

> **Mục tiêu của file này: VIẾT PROMPT rồi LƯU VÀO FILE `.md`.**
> Mỗi phase = 1 session. Mỗi session viết prompt cho 4-7 screens.
> Khi bắt đầu session, nói: _"Làm Phase X của stitch_gen_plan.md"_

---

## ⚠️ QUY TẮC TUYỆT ĐỐI (Agent PHẢI tuân thủ)

### Output = File `.md` chứa prompt

- **VIỆC CẦN LÀM**: Viết prompt text cho Stitch, lưu vào `stitch-prompt/[tên-screen].md`
- **KHÔNG được**: Chạy Stitch MCP tool, gọi stitch API, hoặc tạo code/app
- **KHÔNG được**: Tạo component, page, layout, hay bất kỳ file code nào
- **KHÔNG được**: Dùng `generate_image` tool

### Output path

```
/home/hoanle0126/PersonalProject/ForgeAI/stitch-prompt/
├── phase-01/
│   ├── 01-welcome-splash.md
│   ├── 02-goal-selection.md
│   ├── 03-equipment-inventory.md
│   └── ...
├── phase-02/
│   ├── 01-dashboard-default.md
│   └── ...
└── ...
```

### Mỗi file prompt phải có format:

```markdown
# [Tên Screen]

## Design Context

[Copy nguyên khối Design Context bên dưới]

## Prompt

[Prompt chi tiết cho Stitch để gen screen này]

## Notes

[Ghi chú bổ sung nếu cần]
```

---

## Design Context (Đính kèm cho MỌI prompt Stitch)

```
App: ForgeAI — AI Home Gym Coach
Style: Athletic Clean Sport — light-first, sport energy
Background: warm ivory #F9F7F4
Cards: white #FFFFFF, border #E2E0DC, radius 16px, subtle shadow
Primary accent: Sport Orange #F05A1F
Secondary accents: Blue #2070CC (AI), Green #2BA86A (success), Amber #F5A623 (energy), Purple #7C5CC4 (recovery)
Headings: DM Sans ExtraBold/Bold, dark #1A1A1A
Body: Manrope Regular/SemiBold, #5C5C5C
Stats/Timers: JetBrains Mono Bold
Icons: Phosphor Bold, 24px, #8C8C8C inactive → #F05A1F active
Spacing: 8px grid. Screen padding 16px.
Platform: Mobile app (iPhone 15 Pro frame, 393×852)
NO glassmorphism. NO neon. NO dark-mode-first. Clean, solid, sporty.
```

---

## Phase 1: Onboarding Flow (6 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.
>
> **Ưu tiên cao nhất** — first impression, conversion point.

| #   | Screen                  | Prompt gợi ý                                                                                                                                                                                                                                                                                      |
| --- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.1 | **Welcome Splash**      | Welcome screen, centered logo (abstract geometric "F" mark), tagline "Your AI Coach Lives Here" in DM Sans bold. Full-width orange CTA "Get Started". Warm ivory bg. Clean, confident, minimal.                                                                                                   |
| 1.2 | **Goal Selection**      | Goal selection screen, 4 stacked white cards with Phosphor bold icons on left: "Lose Fat" (flame), "Build Muscle" (barbell), "Get Stronger" (lightning), "Stay Active" (heartbeat). Selected card has orange border + soft orange tint. Bottom orange CTA "Continue".                             |
| 1.3 | **Equipment Inventory** | Equipment selection screen, 2-column chip grid. Items: Dumbbells, Resistance Bands, Yoga Mat, Pull-up Bar, Bench, Kettlebell, Jump Rope, None. Chips are white rounded cards. Selected chips have orange border + check icon. Bottom CTA.                                                         |
| 1.4 | **Body Profile**        | Body profile form inside white elevated card. Height (cm), Weight (kg), Age fields with rounded input bg #F3F1ED. Activity level chips below: Sedentary, Light, Active, Very Active. "Skip for now" text link + orange "Continue" CTA.                                                            |
| 1.5 | **Schedule Preference** | Training schedule screen. Day selector = 7 circle chips (Mon-Sun), orange fill when selected. Session length slider 15-60min with orange thumb. Time preference chips: Morning, Afternoon, Evening, Flexible. Clean layout.                                                                       |
| 1.6 | **AI Plan Preview**     | AI plan preview screen. Small abstract AI avatar animation top. "Here's your 12-week plan" heading. Vertical timeline with 3 phases: Foundation (orange node), Build (blue node), Peak (green node). Each phase shows sessions per week. AI quote at bottom in italic. Orange CTA "Let's Start!". |

**Sau khi gen xong Phase 1**: Review → chỉnh sửa → chốt style guide cho phần còn lại.

---

## Phase 2: Dashboard "Today" Screen (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.
>
> **Screen quan trọng nhất app** — user mở app = thấy screen này.

| #   | Screen                     | Prompt gợi ý                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --- | -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 2.1 | **Dashboard Default**      | Home dashboard "Today" screen. Top: avatar 40px + "Good morning, Alex" + streak badge "12🔥" orange pill. Readiness card (white, segmented progress bar 72% green-to-amber, AI message "Slept 6h, today is lighter"). Workout card (largest, white elevated, "Upper Body Focus", "28 min · 6 exercises", orange CTA "Start Workout" + outline "Make it shorter"). Weekly progress row (7 dots Mon-Sun, filled=green). Stats row (2 mini cards: Volume 12.4k lbs + Streak 12 days). Bottom tab bar (Home, Plan, Progress, Me) with Phosphor bold icons. |
| 2.2 | **Dashboard Compact**      | Same layout but without readiness card. Workout card smaller. More vertical space. Emphasize quick start.                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 2.3 | **Dashboard Stats-heavy**  | Dashboard variant with extra mini charts: calories burned today, muscle group radar chart micro, weekly volume bar chart. Data-dense but clean.                                                                                                                                                                                                                                                                                                                                                                                                        |
| 2.4 | **Dashboard Motivational** | Dashboard variant with hero motivational quote card at top, progress photo comparison thumbnail, streak celebration animation, big "Day 45" counter. Warm, encouraging feel.                                                                                                                                                                                                                                                                                                                                                                           |
| 2.5 | **Dashboard Rest Day**     | Rest day state. Soft purple tint elements. "Today is rest. Your muscles are rebuilding." illustration. Gentle stretching suggestion card. Next workout preview. Calm, restorative mood.                                                                                                                                                                                                                                                                                                                                                                |

---

## Phase 3: Workout Flow — Part 1 (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen               | Prompt gợi ý                                                                                                                                                                                                                                                                                                                   |
| --- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 3.1 | **Workout Overview** | Workout preview screen. "Upper Body Focus" DM Sans bold heading. "28 min · 6 exercises · Chest, Shoulders" meta. Equipment chips (Dumbbells, Mat). Numbered exercise list in white card: 1. Push-ups 3×12, 2. DB Press 3×10, etc. Orange CTA "Start Workout" + outline "Swap exercises".                                       |
| 3.2 | **Exercise Detail**  | Individual exercise detail. Top half: exercise animation placeholder (rounded corner container). "Dumbbell Press" heading, "Chest · Dumbbells" tags, muscle group indicator. Step-by-step instructions numbered list. AI tip card at bottom with blue-soft bg tint.                                                            |
| 3.3 | **Active Workout**   | Active workout screen. Exercise counter progress bar at top "2/6". Exercise animation area. "Dumbbell Press" + "Set 2 of 3" in DM Sans. Rep/weight display "10 reps × 10kg" in JetBrains Mono bold large. Full-width orange "Log Set" button. Minus/Plus buttons for reps. Timer "12:34" mono. Pause + Skip secondary buttons. |
| 3.4 | **Rest Timer**       | Rest between sets. Large countdown ring center screen (stroke purple). "0:47 / 1:30" in JetBrains Mono bold. "Next: Dumbbell Row · 3×10" preview below. "Skip Rest" text button. AI tip card with subtle elevated bg. Calm, restful feel.                                                                                      |
| 3.5 | **Exercise Swap**    | Bottom sheet over workout. "Swap Push-ups" heading. 3 alternative exercise cards: each with icon + name + "Same muscle group" tag + equipment indicator. Tap to swap. Clean white bottom sheet.                                                                                                                                |

---

## Phase 4: Workout Flow — Part 2 (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen                     | Prompt gợi ý                                                                                                                                                                                                                                                           |
| --- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 4.1 | **Mid-Workout Mood Check** | Light scrim overlay. 3 mood option cards centered: "Going strong 💪" (green tint), "Getting tired 😮‍💨" (amber tint), "Done for today ✋" (muted). Auto-dismiss indicator. Non-intrusive, optional feel.                                                                 |
| 4.2 | **Workout Complete**       | Celebration screen! "WORKOUT COMPLETE!" DM Sans ExtraBold. Confetti animation area. Stats grid: 28:12 time, 6 exercises, 2340 lbs volume, 156 cal. Streak card "🔥 Streak: 13! New personal best!" green tint. "Share Achievement" outline button + "Done" orange CTA. |
| 4.3 | **Post-Workout Summary**   | AI-generated workout summary. Stats cards row. AI insight paragraph in blue-soft card: "Your pressing strength improved 8% this week. Try adding lateral raises next session." Next workout preview. 5-star rating prompt at bottom.                                   |
| 4.4 | **Rate Workout**           | Simple feedback screen. 5 stars tap-to-rate (orange filled). Quick tag chips: "Too easy", "Too hard", "Too long", "Perfect", "Loved it". Optional textarea "What could be better?". Submit orange CTA.                                                                 |
| 4.5 | **Workout History**        | Timeline list of past workouts. Each item = white card (date, workout name, duration, volume, completion badge). Filter pills at top: "This week", "This month", "All". Tap card to expand.                                                                            |

---

## Phase 5: AI Coach (3 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen               | Prompt gợi ý                                                                                                                                                                                                                                                                                                                               |
| --- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 5.1 | **Chat with Coach**  | AI chat interface. "Coach ForgeAI" header. AI messages = left align, white card, blue-soft bg tint, blue left border. User messages = right align, orange-soft bg tint. AI avatar small icon. Suggestion chips at bottom: "Change my plan", "More chest work", "I'm tired today". Text input with mic icon. 3-dot typing indicator for AI. |
| 5.2 | **AI Weekly Review** | Weekly summary screen. AI narrative card (white, blue left border): "Great week! 4/5 sessions complete. Upper body volume +12%." Stats pills row: Volume ▲12% (green), Consistency 80% (orange), Strength ▲5% (blue). Muscle balance radar chart mini. Next week plan preview card. "Accept Plan" orange CTA + "Adjust" outline.           |
| 5.3 | **AI Insight Card**  | Bottom sheet modal. Phosphor insight icon (lightbulb) + "Training Insight" label. Insight text: "You've been training chest 40% more than back. Balance it out with more rows." Action button "Add rows to my plan". Swipe-down dismiss handle.                                                                                            |

---

## Phase 6: Planning (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen               | Prompt gợi ý                                                                                                                                                                                                                                             |
| --- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 6.1 | **Weekly Calendar**  | Weekly view, 7 columns (Mon-Sun). Each day cell shows workout type card: strength=orange accent, HIIT=amber, recovery=purple, rest=empty. Cards show workout name + duration mini. Current day highlighted. Swipe between weeks.                         |
| 6.2 | **Monthly Overview** | Month calendar grid. Days with workouts = green dot. Missed = muted dot. Upcoming = outline dot. Activity heatmap effect — darker green = more volume. Month stats summary at bottom.                                                                    |
| 6.3 | **Program Timeline** | Full 12-week program view. Vertical timeline with 3 phase sections. Phase nodes: Foundation (orange), Build (blue), Peak (green). Current position marker. Phase cards expandable showing weekly breakdown.                                              |
| 6.4 | **Plan Adjustment**  | AI plan adjustment screen. Sliders: Days per week (3-6), Session length (15-60min), Intensity (Easy-Medium-Hard). AI preview card: "With 4 days, I'd add more HIIT and reduce per-session volume." Confirm orange CTA.                                   |
| 6.5 | **Mood-to-Workout**  | Mood selection screen. "How are you feeling?" heading. 5 mood option cards with illustrations: Lazy (couch), Stressed (lightning), Low confidence (cloud), Energized (fire), Sleepy (moon). AI converts mood → workout style. Result preview card below. |

---

## Phase 7: Progress (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen                     | Prompt gợi ý                                                                                                                                                                                                                                             |
| --- | -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 7.1 | **Stats Dashboard**        | Progress overview. White bg, sport-colored charts. Volume trend line chart (orange line, subtle orange fill gradient). Consistency ring (green, percentage center). Personal records list (3-4 cards). Body weight trend line. Clean data visualization. |
| 7.2 | **Strength Progress**      | Single exercise progress. Dropdown picker at top to select exercise. Line chart: weight over time (orange line). PR markers on chart (star icons). Best set highlight card. Trend arrow indicator.                                                       |
| 7.3 | **Photo Comparison**       | Before/after comparison. Split screen with slider divider (drag left/right). Date labels on each side. Date picker to select comparison photos. Full-screen toggle.                                                                                      |
| 7.4 | **Personal Records Wall**  | Achievement grid. Cards with PR info: exercise name, weight in JetBrains Mono bold, date earned, badge icon (trophy/medal). Earned = full color. Locked = grayscale outline. 3D badge on recent PR.                                                      |
| 7.5 | **Future Self Projection** | Motivational projection screen. Two paths visualization: "If you keep going" (upward trend, green) vs "If you stop now" (flat/down, muted). Projected stats: volume, streak, body confidence. Encouraging AI message.                                    |

---

## Phase 8: Progress (cont.) + Nutrition (4 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen                        | Prompt gợi ý                                                                                                                                                                                                                   |
| --- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 8.1 | **Body Composition Timeline** | Dual-axis chart: weight (line) + body fat % (dashed line). Photo timeline markers on X-axis. AI composition estimate cards. Clean data layout.                                                                                 |
| 8.2 | **AI Monthly Report**         | AI-generated long-form report. Sections with charts + narrative text alternating. Header "March Report" + AI avatar. Shareable — "Share as Image" button. Premium content feel.                                                |
| 8.3 | **Daily Macro Dashboard**     | Nutrition screen. Calorie ring (large, center, filled = consumed vs target). Macro bars below: Protein (blue), Carbs (amber), Fat (purple). Meal log list cards: Breakfast, Lunch, Dinner, Snacks. Add meal FAB button orange. |
| 8.4 | **Photo-to-Macro Scanner**    | Camera viewfinder screen. Crosshair overlay on food. "Snap to analyze" prompt. Result card slides up: food name, estimated calories, protein/carb/fat breakdown. "Adjust" + "Log meal" buttons.                                |

---

## Phase 9: Nutrition (cont.) + Profile (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #   | Screen                  | Prompt gợi ý                                                                                                                                                                                                     |
| --- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 9.1 | **AI Meal Plan**        | Weekly meal plan. Cards per meal (Breakfast/Lunch/Dinner/Snack). Each card: meal name, macro badges, prep time, cuisine tag. Swipe between days. Regenerate button for AI to create new plan.                    |
| 9.2 | **Meal Detail**         | Single meal recipe. Food photo area. Title + cuisine tag. Macro info row. Ingredients checklist. Step-by-step instructions. "Add to Today's Log" orange CTA.                                                     |
| 9.3 | **Supplement Schedule** | Timeline view of supplement reminders. Creatine, Whey, Multivitamin cards with time + toggle switch. Reminder notification settings. Clean schedule layout.                                                      |
| 9.4 | **Profile Overview**    | User profile screen. Large avatar circle + name + "Member since Mar 2025". Stats row: total workouts, longest streak, total volume. Achievement badges mini row. Edit profile button. Settings gear icon header. |
| 9.5 | **Equipment Inventory** | Equipment management screen. Grid of equipment chips (same style as onboarding). Add/remove toggle per item. "AI uses this to generate your workouts" helper text. Add custom equipment option.                  |

---

## Phase 10: Settings + Gamification (5 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #    | Screen                   | Prompt gợi ý                                                                                                                                                                                                                      |
| ---- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 10.1 | **AI Coach Settings**    | Coach customization screen. Personality selector: Motivational / Strict / Chill (radio chips). Voice coaching toggle. Notification frequency slider: Minimal / Balanced / Active. Coach name display.                             |
| 10.2 | **App Settings**         | Settings list screen. Sections: Appearance (Light/Dark/Auto toggle), Language, Units (kg/lbs), Notifications toggles, Sound & Haptics toggles. Clean list with dividers.                                                          |
| 10.3 | **Achievements Gallery** | Badge collection grid. 3-column. Earned badges = full color with label. Locked = grayscale with "?" and earn condition on tap. Categories: Consistency, Strength, Milestones, Social.                                             |
| 10.4 | **Challenges Hub**       | Active + available challenges. Active section: progress bar cards (e.g., "7-Day Core Challenge — Day 4/7"). Available section: locked cards with descriptions. AI-generated personal challenge card highlighted with blue accent. |
| 10.5 | **Leaderboard**          | Tab pills: Friends / Global / Weekly. Rank list: position number, avatar, name, score in JetBrains Mono, trend arrow (green up / red down). Top 3 highlighted with medal icons (gold/silver/bronze). Current user row sticky.     |

---

## Phase 11: Gamification (cont.) + Paywall + States (7 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #    | Screen                        | Prompt gợi ý                                                                                                                                                                                                                                               |
| ---- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 11.1 | **Streak & Level**            | Streak celebration screen. Large flame animation area. "12 Day Streak!" DM Sans ExtraBold. Level progress bar: "Level 7 → 8". XP breakdown: "+120 XP today". Milestone timeline (5-day, 10-day, 30-day markers).                                           |
| 11.2 | **Share Card Generator**      | Social share screen. Preview card template with workout stats, streak, avatar. Template style options (3 variants). "Customize" toggle for showing/hiding specific stats. "Export as Image" + "Share to Stories" buttons.                                  |
| 11.3 | **Paywall — Feature Gate**    | Bottom sheet. "Unlock AI Form Coach" header with lock icon. Feature list with checkmarks: unlimited workouts, AI form check, voice coaching, progress reports. Price "$6.99/month" emphasized. Orange "Upgrade to Pro" CTA. "Restore purchases" text link. |
| 11.4 | **Paywall — Full Screen**     | Full-page upgrade screen. Hero comparison table: Free vs Pro vs Elite. Feature rows with check/cross icons. Annual savings badge "Save 40%". Social proof "12,000+ athletes upgraded". Price cards. Primary orange CTA for recommended plan.               |
| 11.5 | **Paywall — Soft Upsell**     | Post-workout subtle upsell card. After completion stats, a card: "Want AI to check your form next time?" with preview screenshot. "Try 7 days free" orange CTA. "Not now" dismiss. Non-intrusive.                                                          |
| 11.6 | **Empty State — No Workouts** | Empty dashboard state. Friendly illustration (person stretching). "Your gym awaits" heading. "Let's plan your first workout." subtitle. Orange CTA "Create My Plan".                                                                                       |
| 11.7 | **Empty State — No Progress** | Empty progress state. Skeleton preview showing faded chart outlines. "Complete your first workout to see progress here." Light, encouraging, not depressing.                                                                                               |

---

## Phase 12: Error States + App Store Screenshots (4 screens)

> ⚠️ **Pre-flight**: Đọc `stitch-design/SKILL.md` + `design-md/SKILL.md` trước khi bắt đầu.

| #    | Screen                      | Prompt gợi ý                                                                                                                                                                                 |
| ---- | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 12.1 | **Error — Offline**         | Offline state. Cloud-with-X icon. "No connection" heading. "Your workout is saved locally. We'll sync when you're back." subtitle. Retry button outline.                                     |
| 12.2 | **Error — AI Unavailable**  | AI unavailable state. AI avatar with thinking indicator. "Coach is thinking..." heading. "Try again in a moment. Here's your last plan." Show cached workout card below as fallback.         |
| 12.3 | **Wearable Connections**    | Wearable setup screen. Connection cards: Apple Health (connected ✅), Google Fit (connect →), Garmin (connect →), Xiaomi Mi Band (connect →). Each card with device icon + status indicator. |
| 12.4 | **Subscription Management** | Current plan card (Pro tier highlighted). Plan comparison mini. Payment method display. "Change Plan" + "Cancel Subscription" options. Next billing date.                                    |

---

## Checklist Tổng Hợp

| Phase     | Screens | Category                         | Status |
| --------- | :-----: | -------------------------------- | :----: |
| 1         |    6    | Onboarding                       |   ✅   |
| 2         |    5    | Dashboard + variants             |   ✅   |
| 3         |    5    | Workout Flow (Part 1)            |   ⬜   |
| 4         |    5    | Workout Flow (Part 2)            |   ⬜   |
| 5         |    3    | AI Coach                         |   ⬜   |
| 6         |    5    | Planning                         |   ⬜   |
| 7         |    5    | Progress                         |   ⬜   |
| 8         |    4    | Progress (cont.) + Nutrition     |   ⬜   |
| 9         |    5    | Nutrition (cont.) + Profile      |   ⬜   |
| 10        |    5    | Settings + Gamification          |   ⬜   |
| 11        |    7    | Gamification + Paywall + States  |   ⬜   |
| 12        |    4    | Errors + Wearable + Subscription |   ⬜   |
| **TOTAL** | **59**  | —                                |   —    |

> **Note**: App Store Screenshots (5) sẽ gen riêng sau khi tất cả screens hoàn thành — lấy screen thật làm content.

---

## Quy trình mỗi Phase

```
1. User nói: "Làm Phase X của stitch_gen_plan.md"

2. Agent đọc SKILL bắt buộc:
   → view_file ~/.gemini/antigravity/skills/stitch-design/SKILL.md
   → view_file ~/.gemini/antigravity/skills/design-md/SKILL.md

3. Agent đọc file này (stitch_gen_plan.md) → tìm đúng phase

4. Với MỖI screen trong phase:
   a. Tạo thư mục stitch-prompt/phase-XX/ (nếu chưa có)
   b. Viết file .md chứa prompt (dựa trên "Prompt gợi ý" + Design Context)
   c. Lưu vào stitch-prompt/phase-XX/[số thứ tự]-[tên-screen].md

5. Báo user: "Đã viết X prompt files, review tại stitch-prompt/phase-XX/"

6. Đánh dấu ✅ trong checklist phía dưới
```

> [!CAUTION]
> **KHÔNG chạy Stitch MCP.** KHÔNG gọi `generate_image`. KHÔNG tạo code app.
> Chỉ VIẾT FILE `.md` chứa prompt text và LƯU vào `stitch-prompt/`.

### Skills bắt buộc đọc trước MỖI phase

| Skill           | Path                                                  | Mục đích                           |
| --------------- | ----------------------------------------------------- | ---------------------------------- |
| `stitch-design` | `~/.gemini/antigravity/skills/stitch-design/SKILL.md` | Học cách viết prompt Stitch tối ưu |
| `design-md`     | `~/.gemini/antigravity/skills/design-md/SKILL.md`     | Hiểu cách tổ chức design system    |

> [!IMPORTANT]
> **Agent PHẢI `view_file` cả 2 SKILL.md trên TRƯỚC KHI viết bất kỳ prompt nào.** Không được skip.

---

> _Plan version 1.2 — Clarified: output = .md prompt files, NOT running Stitch MCP._
