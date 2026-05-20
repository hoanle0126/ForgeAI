# Design System: ForgeAI

**Project ID:** local/forge_ai  
**Scope:** Toàn bộ Flutter app trong thư mục hiện tại  
**Last updated:** 2026-04-22

> `DESIGN.md` là nguồn tham chiếu semantic cho ngôn ngữ thiết kế của ForgeAI. Khi viết code, rule kiến trúc trong `AGENTS.md` vẫn là luật bắt buộc. Mọi implementation phải dùng token và component có sẵn: `AppColors`, `AppTypography`, `AppSpacing`, `appTheme`, `AppCard`, `AppButton` và các shared widget hiện hữu.

## 1. Visual Theme & Atmosphere

ForgeAI là một **AI athletic command center**: ấm, sạch, cao cấp, nhưng vẫn có cảm giác training nghiêm túc. App không đi theo hướng fitness generic trắng-xanh. Bản sắc chính là sự kết hợp giữa **warm ivory**, **graphite performance panels**, **sport orange accents**, **technical uppercase labels** và **AI/recovery signals**.

Tính cách thị giác:

- **Warm Precision:** nền ivory mềm, card trắng, spacing rộng, typography rõ để tạo cảm giác được hướng dẫn và đáng tin.
- **Performance-Oriented:** workout hero, AI protocol và analysis panel được phép dùng nền tối, ảnh gym tối màu, gradient và số liệu mono để tạo cảm giác thiết bị huấn luyện chuyên nghiệp.
- **Human + AI:** AI không phải neon/gamer. Dùng blue như tín hiệu thông minh, icon sparkle, copy ngắn và insight card gọn.
- **Bold But Controlled:** heading có thể lớn và chắc, nhưng phần còn lại phải gọn, ít decoration, ít màu.
- **Recovery-Aware:** success, energy, recovery violet dùng như tín hiệu sinh lý: recovered, moderate, overloaded, rest, readiness.

Cần tránh:

- Không dùng gradient tím/xanh cyberpunk làm default.
- Không dùng nền đen toàn app. Nền tối chỉ dành cho workout hero, AI protocol, analysis card hoặc media-heavy moment.
- Không thêm màu mới nếu `AppColors` đã có màu phù hợp.
- Không làm UI quá nhiều border/shadow. ForgeAI ưu tiên card sạch, shadow rất nhẹ và hierarchy bằng typography.

## 2. Color Palette & Roles

Tất cả màu phải đi qua `AppColors` trong `forge_ai/lib/core/constants/app_colors.dart`. Không hardcode `Color(0x...)` trong widget.

| Semantic Name | Token | Hex | Role |
| --- | --- | --- | --- |
| Warm Ivory Canvas | `AppColors.warmIvory` | `#F9F7F4` | Nền chính của app, onboarding, dashboard, training, insight. Tạo cảm giác ấm và cao cấp hơn nền trắng thuần. |
| Pure Card White | `AppColors.cardWhite` | `#FFFFFF` | Surface card, nav bar, selected segment, pill trên nền tối, text/icon trên primary button. |
| Soft Input Clay | `AppColors.inputBg` | `#F3F1ED` | Input field, chip chưa selected, progress track, segmented control background, neutral chart well. |
| Transparent | `AppColors.transparent` | `#00000000` | Ink/overlay trong suốt, border inactive, gradient fade. |
| Sport Orange | `AppColors.sportOrange` | `#F05A1F` | Primary action, selected state, active bottom nav, CTA, training intensity, error text, important metric accent. |
| Pale Sport Orange | `AppColors.sportOrangeLight` | `#FFF0EB` | Selected card tint, icon well, badge tint, state background khi không cần fill orange mạnh. |
| AI Signal Blue | `AppColors.aiBlue` | `#2070CC` | AI insight, smart recommendation, assistant identity, non-training intelligence signal. |
| Recovery Success Green | `AppColors.success` | `#2BA86A` | Readiness tốt, recovered muscle, completed/healthy state, positive progress. |
| Energy Amber | `AppColors.energy` | `#F5A623` | Energy/intensity, warning-light signal, protocol sparkle, moderate state. |
| Recovery Violet | `AppColors.recovery` | `#7C5CC4` | Recovery/rest feature, mobility, sleep/recovery recommendation. |
| Pale Recovery Violet | `AppColors.recoveryLight` | `#F5F0FF` | Recovery card tint, rest-day background, low-intensity recommendation surface. |
| Graphite Text / Panel | `AppColors.textDark` | `#1A1A1A` | Primary text, dark cards, workout/protocol panel background, strongest contrast. |
| Muted Graphite | `AppColors.textMuted` | `#5C5C5C` | Body copy, secondary text, inactive descriptive content. |
| Disabled Ash | `AppColors.textDisabled` | `#8C8C8C` | Placeholder, helper text, inactive nav, low-priority labels. |
| Fine Warm Border | `AppColors.border` | `#E2E0DC` | Card outline khi tắt shadow, input/chip boundary, subtle separator. |

Color usage:

- Primary action dùng `sportOrange` fill và `cardWhite` text.
- Secondary action dùng `sportOrangeLight` fill và `sportOrange` text.
- Outline action dùng transparent fill, `border` và `sportOrange` text.
- Dark performance surface dùng `textDark` background với `cardWhite` text, secondary copy dùng alpha thấp.
- AI surface chỉ dùng `aiBlue` như accent, không dùng làm global primary.
- Readiness và muscle status dùng `success`, `energy`, `sportOrange`, `textDisabled` nhất quán.
- Tint phải tạo từ token hiện có bằng `withValues(alpha: ...)`; không tạo near-duplicate hex color.

## 3. Typography Rules

Typography token nằm trong `forge_ai/lib/core/constants/app_typography.dart`. Mọi text phải bắt đầu từ `AppTypography` và chỉ dùng `copyWith` cho color, line-height hoặc size adjustment hiếm.

| Use | Token Family | Role |
| --- | --- | --- |
| Headings | DM Sans | Confident, compact, high-impact title. Dùng cho screen title, hero title, card heading. |
| Body | Manrope | UI copy ấm và dễ đọc. Dùng cho description, prompt, helper text, form input. |
| Labels | Manrope SemiBold/Bold | Uppercase metadata, nav label, section tag, compact status caption. |
| Numbers & Stats | JetBrains Mono | Metric, timer, readiness score, calories, percentage, protocol value. |

Type scale:

| Token | Size / Weight | Usage |
| --- | --- | --- |
| `AppTypography.h1` | 28 / w800 | Screen title, high-priority feature title. Có thể scale lên 40-48 cho welcome/hero moment. |
| `AppTypography.h2` | 22 / w800 | Secondary screen title, major panel title. |
| `AppTypography.h3` | 20 / w700 | Card title, section header. |
| `AppTypography.h4` | 18 / w700 | Compact card title, panel subsection. |
| `AppTypography.bodyLarge` | 16 / w400 | Intro copy, onboarding description, empty-state copy. |
| `AppTypography.bodyMedium` | 14 / w400 | Default paragraph, form hint, list detail. |
| `AppTypography.bodySmall` | 13 / w400 | Dense helper text, metric explanation, compact card body. |
| `AppTypography.bodySemiBold` | 14 / w600 | Button label base, interactive text, emphasized body. |
| `AppTypography.label` | 12 / w600 | Small label, inactive metadata. |
| `AppTypography.labelUppercase` | 12 / w700, letter spacing 1 | Section tag, nav label, protocol metadata. |
| `AppTypography.statLarge` | 20 / w700 mono | Major metric và dashboard value. |
| `AppTypography.statMedium` | 18 / w700 mono | Medium metric. |
| `AppTypography.statSmall` | 14 / w700 mono | Pill, compact stat, readiness number. |

Typography behavior:

- Dùng uppercase label cho ngôn ngữ machine/protocol: `AI PROTOCOL`, `PRECISION PROTOCOL`, `WEEKLY PLAN`, `GOAL FIT`.
- Heading phải ngắn và trực tiếp. Ưu tiên "Upper Strength" hơn câu marketing dài.
- Mono chỉ dùng cho data, không dùng cho paragraph.
- Trên dark card, title dùng `cardWhite`; secondary text dùng `cardWhite.withValues(alpha: 0.70-0.78)`.
- Hero title có thể dùng negative letter spacing và line-height chặt, nhưng normal card giữ rhythm của token.

## 4. Component Stylings

### Buttons

Canonical button là `AppButton` trong `forge_ai/lib/shared/widgets/app_button.dart`.

- Shape: pill-shaped, `AppSpacing.radiusFull`.
- Height: 56.
- Text: `AppTypography.bodySemiBold.copyWith(fontSize: 16)`.
- Variants: `primary`, `secondary`, `outline`.
- Optional icons: leading/trailing icon size 20.
- Loading: spinner 24x24, stroke 2.5, không làm layout nhảy.
- Disabled: `AppColors.border` background và `AppColors.textDisabled` text.

Rules:

- Không tạo button clone trong feature.
- Nếu cần behavior mới, mở rộng `AppButton` bằng parameter hoặc enum variant.
- CTA copy phải action-oriented: "Start Workout", "Get Started", "Continue", "Generate Plan".

### Cards & Containers

Canonical card là `AppCard` trong `forge_ai/lib/shared/widgets/app_card.dart`.

- Default surface: `cardWhite`.
- Default radius: `AppSpacing.radiusLg` (16).
- Default padding: `AppSpacing.cardPadding` (16).
- Default depth: shadow rất nhẹ, `textDark` alpha 4%, blur 16, offset 0/4.
- Border mode: khi `hasShadow` là false, dùng `AppColors.border`.
- Tap target: dùng `onTap` có sẵn của `AppCard`, không bọc thêm gesture layer nếu không cần.

Card types:

- **Standard data card:** white surface, radius 16, light shadow, padding 16.
- **Dense chart card:** white surface, no shadow, border, padding 16.
- **Selection card:** `inputBg` hoặc `sportOrangeLight`, border selected 2px `sportOrange`, optional orange shadow alpha 15%.
- **Dark performance card:** `textDark` surface, radius 16, white text, orange/energy accents.
- **Media hero card:** image background, graphite overlay gradient, radius 16, white text.

### Inputs & Forms

Canonical pattern là `AuthTextField`.

- Label: uppercase Manrope label, dark, bold.
- Fill: `inputBg`.
- Radius: `AppSpacing.radiusMd` (12).
- Border: none by default.
- Focused border: `sportOrange`.
- Prefix icon: disabled ash, size 20.
- Input text: `bodySemiBold` in `textDark`.
- Hint: `bodyMedium` in `textDisabled`.
- Error: `bodySmall` in `sportOrange`.

Rules:

- Form phải calm và low-friction; tránh outline dày quanh mọi field.
- Validation error dùng orange, không dùng red nếu chưa có critical-error token.

### Pills, Chips & Segmented Controls

- Default shape: `radiusFull`.
- Neutral background: `inputBg`.
- Selected background: `sportOrange` cho strong state, `cardWhite` cho segmented control trên `inputBg`, hoặc `sportOrangeLight` cho soft selection.
- Padding: horizontal 12-16, vertical 4-8.
- Label style: `labelUppercase` cho state/category; `bodySemiBold` cho choice label dễ đọc.
- Status pill trên dark surface có thể dùng `cardWhite.withValues(alpha: 0.12)` với white text.

### Navigation

Bottom navigation dùng canonical `AppBottomNav` trong `lib/shared/widgets/app_bottom_nav.dart`.

- Surface: floating graphite dock dùng `textDark`, đặt trong `SafeArea` với horizontal screen padding.
- Shape: `radiusXl` outer dock, `radiusLg` selected tab, icon well dạng pill.
- Selected state: `cardWhite` tab surface, `sportOrange` icon well, selected label/icon dùng `sportOrange`.
- Inactive state: transparent tab, white icon well alpha thấp, label/icon dùng `cardWhite` alpha khoảng 58%.
- Shadow: graphite shadow rõ hơn card thường để dock nổi trên warm ivory canvas.
- Label: uppercase, 10px, bold, letter spacing 0.5.
- Motion: selected tab và icon well animate ngắn 220ms ease-out để state change có cảm giác tactile.

Rules:

- Bottom tab bar chỉ tồn tại một chỗ và shell phải dùng `AppBottomNav`.
- Không thêm colored navigation background theo từng feature.
- Active state phải có surface + icon well riêng, không chỉ đổi màu text/icon.

### Progress, Metrics & Charts

- Circular readiness ring dùng `success` cho progress tốt và `inputBg` cho track.
- Macro/progress bar dùng `inputBg` track và semantic accent theo metric: `aiBlue`, `energy`, `recovery`, `sportOrange`.
- Metric value dùng JetBrains Mono qua `statLarge`, `statMedium`, `statSmall`.
- Chart container ưu tiên `AppCard(hasShadow: false)` để data dễ đọc.
- Chart label nên muted; line/bar data là nơi mang accent color.

### Icons

- Preferred icon library: `phosphor_flutter`.
- Dùng filled style cho active nav, primary workout icon và AI sparkle.
- Dùng bold/regular style cho secondary action icon.
- Default sizes: 16 inline label, 18-20 row metadata, 24 nav/action, 48 large icon well.
- Icon well dùng `sportOrangeLight`, `inputBg` hoặc `cardWhite` tùy context.

### Imagery

Existing asset direction:

- Bright premium gym imagery cho welcome/onboarding.
- Dark gym và graphite body imagery cho workout/analysis.
- Warm orange AI grid texture cho precision/automation moment.

Usage rules:

- Luôn làm mềm transition ảnh bằng gradient vào `warmIvory` hoặc `textDark`.
- Media card cần text overlay đọc được; dùng left-to-right hoặc bottom gradient trước khi đặt white text.
- Không dùng stock photo ngẫu nhiên làm vỡ palette warm ivory + graphite + orange.
- Workout imagery nên mạnh, sculptural, không crowded.

## 5. Layout Principles

### Grid & Spacing

Toàn bộ spacing đi qua `AppSpacing` trong `forge_ai/lib/core/constants/app_spacing.dart`.

| Token | Value | Usage |
| --- | --- | --- |
| `xs` | 4 | Tiny text/icon gap, compact pill vertical padding. |
| `sm` | 8 | Icon-label gap, chip gap, small vertical rhythm. |
| `md` | 12 | Compact card padding, section sub-gap, selected chip padding. |
| `base` | 16 | Standard screen/card rhythm, default horizontal screen padding. |
| `lg` | 24 | Hero/card inner padding, section group, premium whitespace. |
| `xl` | 32 | Large onboarding gap, page-level separation. |
| `xxl` | 40 | Bottom scroll breathing room, major content break. |
| `xxxl` | 48 | Large icon well, tall structural spacing. |

Rules:

- Default screen padding là `AppSpacing.screenPadding` (horizontal 16).
- Default card padding là `AppSpacing.cardPadding` (all 16).
- Large hero card có thể dùng padding 24.
- Không dùng arbitrary 10, 14, 15, 18, 22 cho spacing.
- Nếu layout cần value ngoài scale, chỉ thêm token khi value đó reusable.

### Radius

| Token | Value | Usage |
| --- | --- | --- |
| `radiusSm` | 8 | Mini chart well, tiny icon tile, compact inner element. |
| `radiusMd` | 12 | Input, day chip, icon tile, medium chip. |
| `radiusLg` | 16 | Card, hero container, analysis block. |
| `radiusXl` | 24 | Large premium container khi cần cảm giác mềm hơn. |
| `radiusFull` | 999 | Button, pill, segmented control, capsule. |

### Screen Composition

- Bắt đầu screen bằng `Scaffold(backgroundColor: AppColors.warmIvory)`.
- Dùng `SafeArea` cho mobile screen.
- Dùng `SingleChildScrollView` cho page nhiều nội dung, có bottom breathing room.
- Dashboard-style screen stack card theo chiều dọc với rhythm 16px.
- Onboarding screen có thể dùng rhythm lớn hơn 24-40px và staggered page-load motion.
- Wide/tablet view dùng two-column panels nhưng giữ cùng card/radius/token language.

### Density

- Dashboard: medium density, một primary insight gần top, sau đó là workout/nutrition/progress module.
- Training: hierarchy mạnh hơn, dark current-workout card, supporting white list/cards bên dưới.
- Onboarding: low density, hero/title mạnh, một decision group mỗi screen.
- Insight: analytical density được phép, nhưng chart phải tách thành card rõ.
- Auth: calm form layout cộng dark AI protocol panel để tăng brand depth.

## 6. Motion & Interaction

ForgeAI motion phải **precise, fast, purposeful**, không decorative.

- Onboarding reveal: fade + small vertical slide, stagger 200-700ms.
- Selection state: `AnimatedContainer`, 180-200ms, `Curves.easeInOut`.
- Segmented control: selected pill đổi background/color trong 180ms.
- Button loading: thay label bằng spinner, không shift layout.
- Tránh pulsing liên tục trừ khi nó đại diện live data hoặc active workout timer.
- Không animate toàn bộ dashboard card; dành motion cho onboarding, state change và high-value transition.

## 7. Copy & Content Voice

ForgeAI copy ngắn, technical và coaching-oriented.

Preferred language patterns:

- "ForgeAI Insight"
- "AI protocol"
- "Recovery-aware volume"
- "Readiness sync"
- "Precision protocol"
- "Upper Strength"
- "Today's Workout"

Rules:

- Label metadata nên ngắn và uppercase.
- Body copy phải giải thích vì sao plan thay đổi, không chỉ nói thay đổi gì.
- Tránh hype quá mức. App nên nói như một coach có năng lực, không như sales landing page.
- Dùng "AI" như functional signal, không gắn vào mọi title.

## 8. Feature-Level Patterns

### Onboarding

- Visual direction: premium gym imagery + warm ivory content panel.
- Heading có thể rất lớn, 40-48, line-height chặt ở hero screen.
- Mỗi step chỉ tập trung vào một choice group.
- Selected option dùng orange border/tint và subtle orange shadow.
- Action bar đơn giản: primary continue button, optional secondary text action.
- Staggered entry motion được khuyến khích.

### Dashboard

- Visual direction: daily command center.
- Top area nên có greeting, readiness và today's workout.
- Giữ background warm ivory và card trắng, trừ hero/performance card.
- Dùng mono number để scan nhanh.
- Tránh quá nhiều card ngang weight; phải có một module dominate.

### Training

- Visual direction: performance panel first, plan detail second.
- Current workout card có thể dark graphite với white copy và orange action.
- Weekly plan chip dùng white neutral state và orange current-day state.
- Workout stat là icon + label row compact.

### Insight / AI Coach

- Visual direction: analytical nhưng approachable.
- AI message dùng white card với `aiBlue` identity accent.
- User message bubble dùng `sportOrange` với white text.
- Chart nằm trong quiet card surface; semantic status color mang meaning.
- Muscle status: recovered = success, moderate = energy, overloaded = sport orange, neutral = disabled/input.

### Auth

- Visual direction: low-friction entry với premium AI protocol panel.
- Form field là soft filled surface, không phải outlined box.
- Mode switcher dùng `inputBg` shell và white selected pill.
- Dark protocol card reinforce brand nhưng phải secondary so với form.

## 9. Reuse Rules For Future UI Work

Trước khi thêm bất kỳ visual component nào:

- Search `forge_ai/lib/shared/widgets/`.
- Search feature `widgets/` hiện tại.
- Extend `AppCard`, `AppButton` hoặc widget feature có sẵn nếu shape đã tồn tại.
- Chỉ promote widget lên `shared/widgets/` khi thật sự dùng ở ít nhất hai feature.
- Widget mới phải nhận parameter linh hoạt và tránh hardcode text, color, spacing, asset nếu không thật sự feature-specific.

Reusable components nên thêm tiếp nếu cần:

- `AppBadge` cho semantic pill/status label.
- `AppChip` cho filter/equipment/schedule choice.
- `AppSectionHeader` cho title + optional action.
- `AppProgressRing` wrapper quanh `percent_indicator`.
- `AppIconTile` cho reusable icon well.

## 10. Do / Don't

Do:

- Dùng `AppColors`, `AppTypography`, `AppSpacing` cho mọi visual value.
- Dùng `AppCard` và `AppButton` làm base cho shared surface/action.
- Dùng `PhosphorIcons` cho phần lớn icon.
- Dùng `cardWhite` surface trên `warmIvory` background.
- Dùng `textDark` panel có kiểm soát cho performance và AI protocol emphasis.
- Dùng semantic color chính xác cho health/training state.
- Giữ shadow mềm và ít.

Don't:

- Không hardcode color trong widget.
- Không tạo one-off button/card variant khi có thể mở rộng bằng enum hoặc parameter.
- Không thêm package UI mới nếu chưa được approve.
- Không mix visual style không liên quan như neon cyberpunk, glassmorphism-heavy panel hoặc default Material blue.
- Không dùng spacing ngoài `AppSpacing`.
- Không biến mọi AI element thành blue; blue là identity accent, không phải layout theme.
- Không biến mọi screen thành dark dashboard.
