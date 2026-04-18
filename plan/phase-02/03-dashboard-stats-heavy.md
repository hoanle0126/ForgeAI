# Dashboard Stats-Heavy

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

A data-rich mobile home dashboard variant for "ForgeAI" fitness app. This version emphasizes visual analytics and performance metrics with micro-charts and data visualizations. Athletic Clean Sport — warm, light-first, data-dense but clean and scannable.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card backgrounds with border (#E2E0DC), Sport Orange (#F05A1F) primary accent and chart lines, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body, Green (#2BA86A) positive trends, Amber (#F5A623) energy metrics, Blue (#2070CC) AI elements, Purple (#7C5CC4) recovery
- Styles: 16px rounded cards, solid flat surfaces, clean chart styling with minimal gridlines — NO glassmorphism, NO neon

**PAGE STRUCTURE:**

1. **Status Bar:** Standard iOS status bar, dark text on warm ivory

2. **Top Bar (16px horizontal padding):**
   - Left: Circular avatar (40×40px) + "Good morning, Alex" in DM Sans Bold, 18px, dark
   - Right: Notification bell icon (Phosphor BellSimple, 24px, #8C8C8C) with small orange dot indicator

3. **Today's Summary Strip (16px margin top):**
   - Horizontal scrollable row of 4 compact metric chips (no card border, just subtle background #F3F1ED, pill-shaped, 8px padding horizontal, 4px vertical)
   - Chip 1: Flame icon + "12 streak" (Sport Orange)
   - Chip 2: Lightning icon + "156 cal" (Amber #F5A623)
   - Chip 3: Barbell icon + "2.3k lbs" (Dark #1A1A1A)
   - Chip 4: Clock icon + "28 min" (Blue #2070CC)
   - All text: JetBrains Mono Bold, 12px

4. **Calories Burned Today Card (16px margin top, white card):**
   - "Calories Burned" label, Manrope SemiBold, 12px, muted gray, left-aligned
   - Right-aligned: "156 / 420 kcal" in JetBrains Mono Bold, 14px, dark
   - Horizontal thin progress bar below: filled portion in gradient from Amber (#F5A623) to Sport Orange (#F05A1F), unfilled in #E2E0DC, height 6px, fully rounded
   - Card: white bg, 16px radius, border #E2E0DC, 16px padding

5. **Weekly Volume Mini Chart (8px margin top, white card):**
   - "Weekly Volume" label, DM Sans SemiBold, 14px, dark, left-aligned
   - Trend indicator: "▲ 8%" in Green (#2BA86A), Manrope SemiBold, 12px, right-aligned
   - Bar chart: 7 vertical bars (Mon–Sun), each bar rounded-top (4px radius)
   - Completed days: solid Sport Orange (#F05A1F) bars with varying heights
   - Today: Sport Orange bar with a subtle pulsing glow outline
   - Upcoming: light gray (#E2E0DC) bars
   - Day labels (M T W T F S S) below bars in Manrope Regular, 10px, muted gray
   - Chart area height ~80px. Clean minimal style, no gridlines, no axis labels
   - Card: white bg, 16px radius, border #E2E0DC, 16px padding

6. **Muscle Group Radar (8px margin top, half-width card, left side):**
   - "Muscle Balance" label, Manrope SemiBold, 11px, muted gray
   - Small radar/spider chart (~100px diameter) with 5 axes: Chest, Back, Shoulders, Arms, Legs
   - Chart fill: semi-transparent Sport Orange (#F05A1F at 20% opacity), outline Sport Orange solid
   - Axis labels: Manrope Regular, 9px, muted gray
   - Card: white bg, 12px radius, border #E2E0DC, 12px padding

7. **Workout Card (8px margin top for right-side / 8px gap from radar, half-width card + stacked below radar):**
   - Compact workout card spanning full width below the radar/calorie row
   - "Upper Body Focus" in DM Sans Bold, 16px, dark
   - "28 min · 6 exercises" in Manrope Regular, 13px, muted gray
   - Compact pill CTA "Start" — Sport Orange background, white text, DM Sans Bold, 14px, width auto (right-aligned), height 36px
   - Card: white bg, 16px radius, border #E2E0DC, 12px padding

8. **Bottom Tab Bar (fixed, above home indicator):**
   - 4 tabs: Home (active, Sport Orange), Plan, Progress, Me (inactive, #8C8C8C)
   - Phosphor Bold icons 24px + Manrope SemiBold 10px labels
   - White background, top border #E2E0DC

9. **Overall Feel:** A data nerd's dream dashboard — every key metric is visible at a glance through well-designed micro-visualizations. Despite being information-dense, the clean Athletic Sport aesthetic prevents it from feeling cluttered. Charts use consistent sport-orange accents. The workout CTA is still present but intentionally smaller to give space to analytics.

## Notes

- This variant targets users who love tracking metrics and data.
- The micro-charts (bar chart, radar, progress bar) should all feel part of the same visual system — Sport Orange as primary chart color, minimal gridlines, rounded shapes.
- Muscle Balance radar chart is intentionally tiny — it's a glanceable overview, not a detailed analysis tool.
- Horizontal metric chips at top create a quick "at a glance" summary layer.
- The radar and calorie cards can sit side-by-side as a 2-column layout if screen width allows, or stack vertically.
- All chart data is static/illustrative for the design — no interactive states needed.
- 8px grid spacing throughout.
