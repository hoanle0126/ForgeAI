# Body Profile

## Design Context

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

## Prompt

A mobile body profile form screen for a fitness app. Athletic Clean Sport design — warm ivory, clean input fields, comfortable data entry. Users enter basic body metrics and activity level.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card surface, Input Background (#F3F1ED) for text fields, Sport Orange (#F05A1F) for CTA and active states, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body and labels
- Styles: Generously rounded corners (16px card radius, 12px input radius), whisper-soft diffused shadows, solid surfaces — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Top Navigation Bar (16px padding):**
   - Left: Back arrow icon (Phosphor Bold, 24px, #1A1A1A)
   - Center: Step indicator — "Step 3 of 5" in Manrope SemiBold, 14px, muted gray #5C5C5C
   - Right: "Skip" text link in Manrope SemiBold, 14px, muted gray #5C5C5C

2. **Header Section (24px below nav, 16px horizontal padding):**
   - Heading: "Tell us about yourself" in DM Sans ExtraBold, 28px, dark #1A1A1A
   - Subheading: "This helps AI calibrate your workouts" in Manrope Regular, 16px, muted gray #5C5C5C
   - 8px gap between heading and subheading

3. **Form Card (24px below header, 16px horizontal padding):**
   A single elevated white (#FFFFFF) card container, 16px border-radius, 1px border #E2E0DC, whisper-soft shadow, 24px internal padding.

   **Form Fields (16px vertical gap between fields):**

   **Row 1 — Height & Weight (side by side, 12px gap):**
   - Left field (50%): Label "Height" in Manrope SemiBold, 13px, #5C5C5C. Input below: rounded 12px, background #F3F1ED, height 48px, 16px horizontal padding. Placeholder "175" in #ABABAB. Unit suffix "cm" in Manrope SemiBold, 13px, #8C8C8C, inside the field aligned right
   - Right field (50%): Label "Weight" in Manrope SemiBold, 13px, #5C5C5C. Input below: same style. Placeholder "70". Unit suffix "kg"

   **Row 2 — Age (full width):**
   - Label "Age" in Manrope SemiBold, 13px, #5C5C5C. Input: same rounded style, full-width. Placeholder "25". No unit suffix.

   **Active input state (show Height field as focused):**
   - Border: 2px solid Sport Orange (#F05A1F)
   - Background stays #F3F1ED
   - Value text: JetBrains Mono Bold, 16px, #1A1A1A

4. **Activity Level Section (24px below form card, 16px horizontal padding):**
   - Label: "Activity level" in DM Sans Bold, 17px, #1A1A1A
   - 12px below label: Horizontal scrollable chip row, 8px gap between chips

   **Chips:** "Sedentary" | "Light" | "Active" | "Very Active"
   - Default: white (#FFFFFF) bg, 1px border #E2E0DC, Manrope SemiBold 14px #5C5C5C, rounded-full (pill-shaped), padding 12px 20px, height 40px
   - Selected ("Active" shown as selected): solid Sport Orange (#F05A1F) bg, white text, no border

5. **Bottom Section (pinned to bottom safe area, 16px padding):**
   - "Skip for now" text link: Manrope SemiBold, 14px, muted gray #5C5C5C, centered. Tappable.
   - 12px below: Full-width primary CTA: "Continue" in white text, DM Sans Bold, 16px. Solid Sport Orange (#F05A1F), pill-shaped, height 56px, whisper-soft shadow

6. **Overall Feel:** Friendly form interface, not clinical. Warm input backgrounds make data entry feel comfortable. Information feels optional and low-pressure with "Skip for now" option. Clean, organized, no clutter.

## Notes

- Numeric inputs only for height, weight, age — mobile keyboard should show numpad.
- Unit suffixes (cm, kg) are decorative labels inside the field, not editable.
- Activity level is single-select (radio behavior) via pill chips.
- "Skip for now" must be clearly visible but secondary to the "Continue" CTA.
- Maintain 8px grid for all spacing.
