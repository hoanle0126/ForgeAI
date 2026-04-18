# Dashboard Compact

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

A compact, action-oriented mobile home dashboard variant for "ForgeAI" fitness app. This version removes the AI Readiness Card to prioritize quick workout access. Athletic Clean Sport — warm, light-first, minimal, and fast.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card backgrounds with border (#E2E0DC), Sport Orange (#F05A1F) for primary CTA, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body, Green (#2BA86A) completed states
- Styles: Generously rounded corners (16px radius), pill-shaped buttons, solid flat surfaces — NO glassmorphism, NO neon

**PAGE STRUCTURE:**

1. **Status Bar:** Standard iOS status bar, dark text on warm ivory

2. **Top Bar (16px horizontal padding):**
   - Left: Circular user avatar (40×40px) + "Good morning, Alex" in DM Sans Bold, 18px, dark #1A1A1A
   - Right: Streak badge pill — "12🔥" in DM Sans Bold, 14px, orange-tinted background (#FFF0EB), Sport Orange text

3. **Quick Start Workout Card (16px margin top, white card — compact variant):**
   - This card is smaller than the default — no readiness info, straight to the workout
   - "Upper Body Focus" in DM Sans Bold, 18px, dark #1A1A1A
   - Meta row: Phosphor clock icon + "28 min" + dot + Phosphor dumbbell icon + "6 exercises" in Manrope Regular, 13px, muted gray #5C5C5C
   - Equipment tags: Small rounded chips below meta — "Dumbbells" + "Mat" — gray background (#F3F1ED), Manrope SemiBold, 12px, dark text
   - Large pill CTA "Start Workout" — full-width, Sport Orange (#F05A1F), white text, DM Sans Bold, 16px, height 48px
   - Card: white bg, border #E2E0DC, 16px radius, 16px padding

4. **Next Workout Preview (8px margin top, subtle section):**
   - "Up Next" label in DM Sans SemiBold, 12px, muted gray #8C8C8C, uppercase, letter-spacing 1px
   - Compact white card: "Lower Body Strength" + "Tomorrow · 32 min" in Manrope Regular, 13px
   - Right side: Chevron-right icon in muted gray (#8C8C8C)
   - Card: white bg, border #E2E0DC, 12px radius, 12px padding

5. **Weekly Progress Row (16px margin top):**
   - "This Week" label, DM Sans SemiBold, 14px, dark
   - 7 circular dots for Mon–Sun with day labels below
   - Completed = Green (#2BA86A) filled, Today = Orange (#F05A1F) ring, Upcoming = empty with border #E2E0DC

6. **Quick Stats Row (16px margin top, 3 compact cards, 8px gap):**
   - Card 1: Phosphor FlameSimple icon (Sport Orange) + "12" + "day streak" — stacked vertically
   - Card 2: Phosphor TrendUp icon (Green) + "12.4k" + "lbs volume" — stacked vertically
   - Card 3: Phosphor Timer icon (Blue #2070CC) + "4.2h" + "this week" — stacked vertically
   - All values in JetBrains Mono Bold, 16px. Labels in Manrope Regular, 11px, muted gray
   - Cards: white bg, border #E2E0DC, 12px radius, 12px padding

7. **Bottom Tab Bar (fixed, above home indicator):**
   - 4 tabs: Home (active, Sport Orange), Plan, Progress, Me (inactive, #8C8C8C)
   - Phosphor Bold icons 24px + Manrope SemiBold 10px labels
   - White background, top border #E2E0DC

8. **Overall Feel:** Streamlined and fast — designed for users who want to jump straight into their workout. More vertical space means less scrolling. The Workout Card is the unambiguous focal point with zero distractions above it. Extra breathing room gives the compact layout a premium, spacious feel despite fewer elements.

## Notes

- Removing the AI Readiness Card makes this variant feel faster and more action-oriented.
- The "Up Next" section adds planning awareness without bloating the screen.
- 3-column stats row packs more data into a tighter space than the default's 2-column layout.
- This variant is ideal for returning users who already know their routine and just want to start.
- All spacing on 8px grid. Cards have consistent 12–16px internal padding.
