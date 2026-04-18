# Schedule Preference

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

A mobile training schedule preference screen for a fitness app. Athletic Clean Sport design — warm ivory, clean, sporty. Users select which days they train, session length, and preferred time of day.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) surfaces, Sport Orange (#F05A1F) for selected/active states, Border Gray (#E2E0DC) inactive borders, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body text
- Styles: Generously rounded corners (16px card radius), pill-shaped chips, whisper-soft shadows, solid surfaces — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Top Navigation Bar (16px padding):**
   - Left: Back arrow icon (Phosphor Bold, 24px, #1A1A1A)
   - Center: Step indicator — "Step 4 of 5" in Manrope SemiBold, 14px, muted gray #5C5C5C
   - Right: "Skip" text link in Manrope SemiBold, 14px, muted gray #5C5C5C

2. **Header Section (24px below nav, 16px horizontal padding):**
   - Heading: "When do you train?" in DM Sans ExtraBold, 28px, dark #1A1A1A
   - Subheading: "Pick the days and times that work for you" in Manrope Regular, 16px, muted gray #5C5C5C
   - 8px gap between heading and subheading

3. **Day Selector Section (24px below header, 16px horizontal padding):**
   - Section label: "Training days" in DM Sans Bold, 15px, #1A1A1A
   - 12px below: Horizontal row of 7 circle chips, evenly distributed across width, 8px gap

   **Day circles (each 44×44px, centered text):**
   - Default: White (#FFFFFF) fill, 1px border #E2E0DC, day abbreviation (Mo, Tu, We, Th, Fr, Sa, Su) in Manrope SemiBold, 13px, #5C5C5C
   - Selected (show Mon, Wed, Fri, Sat selected): Solid Sport Orange (#F05A1F) fill, white text, no border
   - Multi-select behavior

4. **Session Length Section (32px below day selector, 16px horizontal padding):**
   - Section label: "Session length" in DM Sans Bold, 15px, #1A1A1A
   - 12px below: A white (#FFFFFF) card, 16px border-radius, 1px border #E2E0DC, 20px internal padding, whisper-soft shadow

   **Inside card:**
   - Current value display: "30 min" in JetBrains Mono Bold, 32px, dark #1A1A1A, centered
   - 16px below: Continuous horizontal slider track
     - Track background: #E2E0DC, 4px height, rounded-full
     - Filled portion: Sport Orange (#F05A1F)
     - Thumb: 24px circle, solid Sport Orange (#F05A1F), whisper-soft shadow, positioned at ~37% (representing 30min on 15-60 range)
   - 8px below track: Min/max labels — "15 min" left, "60 min" right, Manrope Regular, 12px, #8C8C8C

5. **Time Preference Section (32px below session length, 16px horizontal padding):**
   - Section label: "Preferred time" in DM Sans Bold, 15px, #1A1A1A
   - 12px below: Horizontal chip row (wrapping if needed), 8px gap

   **Chips:** "Morning" | "Afternoon" | "Evening" | "Flexible"
   - Default: White (#FFFFFF) bg, 1px border #E2E0DC, Manrope SemiBold 14px #5C5C5C, pill-shaped (rounded-full), padding 10px 20px, height 40px
   - Each chip has a small Phosphor icon left of text (Sunrise, Sun, Moon, ArrowsClockwise), 16px, same color as text
   - Selected ("Morning" shown as selected): Solid Sport Orange (#F05A1F) bg, white text, white icon
   - Single-select behavior

6. **Bottom Section (pinned to bottom safe area, 16px padding):**
   - Full-width primary CTA: "Continue" in white text, DM Sans Bold, 16px
   - Button: solid Sport Orange (#F05A1F), pill-shaped (rounded-full), height 56px
   - Whisper-soft shadow beneath

7. **Overall Feel:** Clean, well-organized schedule configuration. Three distinct sections with clear hierarchy. The slider feels tactile and interactive. Day circles have a calendar-like familiarity. Warm, approachable, goal-oriented.

## Notes

- Day circles are multi-select. Time preference chips are single-select.
- The slider should show the current value dynamically above the track.
- "Flexible" time preference is a valid option — no specific icon needed, use ArrowsClockwise.
- All sections should feel visually balanced without crowding the screen.
