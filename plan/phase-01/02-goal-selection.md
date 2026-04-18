# Goal Selection

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

A mobile goal selection screen for a fitness coaching app. Athletic Clean Sport design — warm, light-first, inviting. The user picks their primary fitness goal.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card surfaces, Sport Orange (#F05A1F) selected state accent, Border Gray (#E2E0DC) default card border, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body text
- Styles: Generously rounded corners (16px radius), whisper-soft diffused shadows, solid flat cards — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Top Navigation Bar (16px padding):**
   - Left: Back arrow icon (Phosphor Bold, 24px, #1A1A1A)
   - Center: Step indicator — "Step 1 of 5" in Manrope SemiBold, 14px, muted gray #5C5C5C
   - Right: "Skip" text link in Manrope SemiBold, 14px, muted gray #5C5C5C

2. **Header Section (24px below nav, 16px horizontal padding):**
   - Heading: "What's your goal?" in DM Sans ExtraBold, 28px, dark #1A1A1A
   - Subheading: "We'll personalize your training plan" in Manrope Regular, 16px, muted gray #5C5C5C
   - 8px gap between heading and subheading

3. **Goal Cards (24px below header, 16px horizontal padding, 12px vertical gap between cards):**
   Four vertically stacked white cards, each:
   - White (#FFFFFF) background, 16px border-radius, 1px border #E2E0DC
   - Whisper-soft diffused shadow
   - Height ~72px, full-width
   - Left side: Phosphor Bold icon, 28px, inside a 48×48 soft-rounded (#F9F7F4) icon container, centered vertically with 16px left padding
   - Right of icon (12px gap): Goal name in DM Sans Bold, 17px, #1A1A1A. Below goal name: short description in Manrope Regular, 13px, #8C8C8C
   - Right edge: Subtle chevron-right indicator, #E2E0DC

   **Card 1 — "Lose Fat":** Flame icon. Description: "Burn calories, lean out"
   **Card 2 — "Build Muscle":** Barbell icon. Description: "Gain size and strength"
   **Card 3 — "Get Stronger":** Lightning icon. Description: "Increase your max lifts"
   **Card 4 — "Stay Active":** Heartbeat icon. Description: "Move daily, feel great"

   **Selected state (show "Lose Fat" selected):**
   - Border changes to 2px solid Sport Orange (#F05A1F)
   - Background gains a very subtle orange tint (#FFF5F0)
   - Left icon container background changes to light orange (#FEE8DE), icon color becomes Sport Orange (#F05A1F)
   - Chevron-right becomes a filled orange checkmark circle
   - Shadow slightly stronger for emphasis

4. **Bottom Section (pinned to bottom safe area, 16px padding):**
   - Full-width primary CTA: "Continue" in white text, DM Sans Bold, 16px
   - Button: solid Sport Orange (#F05A1F), pill-shaped (rounded-full), height 56px
   - Whisper-soft shadow beneath

5. **Overall Feel:** Clean, focused selection. Cards are easy to scan and tap. Single-selection pattern — tapping one card deselects the others. Warm, encouraging, goal-oriented.

## Notes

- Only one goal can be selected at a time — radio-button behavior.
- The selected card must be visually distinct but not jarring. Subtle orange tint + orange border is enough.
- Icons should be clearly recognizable at a glance — use thick-stroke Phosphor Bold variants.
- Cards should have generous tap targets (min 48px height).
