# Dashboard Default

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

A feature-rich mobile home dashboard screen for a fitness coaching app called "ForgeAI." This is the primary "Today" screen — the first thing users see when opening the app daily. Athletic Clean Sport aesthetic — warm, light-first, information-dense yet breathable.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card backgrounds with subtle border (#E2E0DC) and whisper-soft diffused shadow, Sport Orange (#F05A1F) for primary CTA and active states, Dark (#1A1A1A) for headings, Muted Gray (#5C5C5C) for body text, Green (#2BA86A) for success/completion, Amber (#F5A623) for energy/warning, Blue (#2070CC) for AI elements
- Styles: Generously rounded corners (16px radius on cards), pill-shaped badges and buttons, solid flat surfaces — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Status Bar:** Standard iOS status bar at top, dark text on warm ivory background

2. **Top Bar (16px horizontal padding):**
   - Left side: Circular user avatar (40×40px), with greeting text beside it — "Good morning, Alex" in DM Sans Bold, 18px, dark #1A1A1A
   - Right side: Streak badge — pill-shaped chip with "12🔥" text in DM Sans Bold, 14px, warm orange-tinted background (#FFF0EB), Sport Orange (#F05A1F) text. Compact, celebratory feel

3. **AI Readiness Card (white elevated card, 16px margin top):**
   - Left side: Segmented circular progress ring showing 72% — green (#2BA86A) filling transitioning to amber (#F5A623) near the end. Percentage "72%" inside the ring in JetBrains Mono Bold, 20px, dark #1A1A1A
   - Right side: "Today's Readiness" label in Manrope SemiBold, 12px, muted gray. AI message below: "Slept 6h — today's session is lighter" in Manrope Regular, 14px, #5C5C5C. Small blue AI sparkle icon (#2070CC) before the message
   - Card: white background, border #E2E0DC, 16px radius, whisper-soft shadow, 16px internal padding

4. **Today's Workout Card (largest card, 16px margin top, white elevated card):**
   - Top: "Upper Body Focus" in DM Sans Bold, 20px, dark #1A1A1A
   - Meta row below: "28 min" + dot separator + "6 exercises" in Manrope Regular, 14px, muted gray #5C5C5C. Small Phosphor icons (clock, dumbbell) before each value
   - Primary CTA: Full-width pill-shaped button "Start Workout" — solid Sport Orange (#F05A1F) background, white text, DM Sans Bold, 16px, height 48px
   - Secondary action below: Full-width outlined pill-shaped button "Make it shorter" — white background, thin Sport Orange border (#F05A1F), Sport Orange text, DM Sans SemiBold, 14px, height 40px
   - Card: white background, border #E2E0DC, 16px radius, slightly stronger shadow than other cards (this is the hero card), 16px internal padding

5. **Weekly Progress Row (16px margin top):**
   - Label: "This Week" in DM Sans SemiBold, 14px, dark #1A1A1A, left-aligned
   - 7 circular dot indicators in a horizontal row — one for each day (Mon–Sun) with 3-letter day labels below each
   - Completed days: filled circles in Green (#2BA86A)
   - Today: filled circle with Sport Orange (#F05A1F) ring highlight
   - Upcoming days: empty circles with border #E2E0DC
   - Even horizontal spacing between dots

6. **Stats Row (16px margin top, 2 cards side-by-side, 8px gap):**
   - Card 1: "Volume" label in Manrope Regular, 12px, muted gray. Value "12.4k lbs" in JetBrains Mono Bold, 18px, dark #1A1A1A. Small up-arrow trend icon in Green (#2BA86A)
   - Card 2: "Streak" label in Manrope Regular, 12px, muted gray. Value "12 days" in JetBrains Mono Bold, 18px, dark #1A1A1A. Small flame icon in Sport Orange (#F05A1F)
   - Both cards: white background, border #E2E0DC, 12px radius, 12px internal padding

7. **Bottom Tab Bar (fixed at bottom, above home indicator):**
   - 4 tabs evenly spaced: Home, Plan, Progress, Me
   - Each tab: Phosphor Bold icon (24px) above label text (Manrope SemiBold, 10px)
   - Active tab (Home): Sport Orange (#F05A1F) icon and text
   - Inactive tabs: Muted gray (#8C8C8C) icon and text
   - Tab bar background: white (#FFFFFF), top border #E2E0DC, subtle shadow upward
   - Icons: House (Home), CalendarBlank (Plan), ChartLineUp (Progress), User (Me)

8. **Overall Feel:** Information-dense but breathing — every card has generous internal padding (16px) and clear vertical rhythm (16px gaps between sections). The Workout Card dominates visual hierarchy as the primary action point. Data is scannable at a glance. Clean, coach-like, structured.

## Notes

- This is the most important screen in the entire app — it must feel complete, polished, and immediately useful.
- The AI Readiness Card should feel like a personal coaching insight, not a generic metric.
- The Workout Card must clearly be the primary CTA — visually larger and more prominent than everything else.
- Weekly progress dots create a gamification hook without being overwhelming.
- Bottom tab bar must feel native iOS — not custom or heavy.
- All spacing follows 8px grid: 8, 16, 24, 32px increments.
