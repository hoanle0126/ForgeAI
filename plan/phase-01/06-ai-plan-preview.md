# AI Plan Preview

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

A mobile AI-generated plan preview screen for a fitness app. Athletic Clean Sport design — warm ivory, clean, inspiring. This is the final onboarding screen where the AI reveals a personalized 12-week training plan via a vertical timeline. The screen should feel exciting and rewarding — the AI has done its work.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card surfaces, Sport Orange (#F05A1F) Phase 1 accent and primary CTA, AI Blue (#2070CC) Phase 2 accent, Success Green (#2BA86A) Phase 3 accent, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body text
- Styles: Generously rounded corners (16px radius), whisper-soft diffused shadows, solid flat cards — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Top Navigation Bar (16px padding):**
   - Left: Back arrow icon (Phosphor Bold, 24px, #1A1A1A)
   - Center: Step indicator — "Step 5 of 5" in Manrope SemiBold, 14px, muted gray #5C5C5C
   - Right: Empty (no skip option on final step)

2. **AI Avatar Section (24px below nav, centered):**
   - Small abstract AI avatar illustration — a circular container (64×64px) with a soft blue gradient (#2070CC to #4A90D9), containing a simple abstract brain/spark icon in white. Whisper-soft shadow beneath
   - This represents the AI coach that built the plan
   - Subtle pulsing glow animation indicator (just show the static frame — a faint blue glow ring around the avatar)

3. **Header Section (16px below avatar, centered text):**
   - Heading: "Here's your 12-week plan" in DM Sans ExtraBold, 26px, dark #1A1A1A, center-aligned
   - Subheading: "Designed by AI, built for you" in Manrope Regular, 15px, muted gray #5C5C5C, center-aligned
   - 8px gap between heading and subheading

4. **Vertical Timeline (24px below header, 16px horizontal padding):**
   A vertical timeline with a thin 2px connector line running vertically on the left side. Three phase nodes connected by this line.

   **Timeline Structure (each phase node):**
   - Left: Colored circle node (16px diameter) centered on the vertical line
   - Right of node (16px gap): Phase card — white (#FFFFFF) bg, 16px border-radius, 1px border #E2E0DC, whisper-soft shadow, full-width, 16px internal padding
   - Vertical line segment (2px wide, #E2E0DC) connects nodes, running behind the cards
   - 16px vertical gap between phase cards

   **Phase 1 — Foundation (Orange node #F05A1F):**
   - Node: Solid orange circle
   - Card header: "Phase 1: Foundation" in DM Sans Bold, 16px, #1A1A1A
   - Card meta: "Weeks 1–4 · 4 sessions/week" in Manrope Regular, 13px, muted gray #5C5C5C
   - Left accent: 3px left border on card in Sport Orange (#F05A1F)
   - Tag pill: "Building base" in orange-soft bg (#FEE8DE), orange text (#F05A1F), Manrope SemiBold 12px, pill-shaped

   **Phase 2 — Build (Blue node #2070CC):**
   - Node: Solid blue circle
   - Card header: "Phase 2: Build" in DM Sans Bold, 16px, #1A1A1A
   - Card meta: "Weeks 5–8 · 4 sessions/week" in Manrope Regular, 13px, muted gray #5C5C5C
   - Left accent: 3px left border in AI Blue (#2070CC)
   - Tag pill: "Progressive overload" in blue-soft bg (#E0EEFA), blue text (#2070CC)

   **Phase 3 — Peak (Green node #2BA86A):**
   - Node: Solid green circle
   - Card header: "Phase 3: Peak" in DM Sans Bold, 16px, #1A1A1A
   - Card meta: "Weeks 9–12 · 5 sessions/week" in Manrope Regular, 13px, muted gray #5C5C5C
   - Left accent: 3px left border in Success Green (#2BA86A)
   - Tag pill: "Max performance" in green-soft bg (#DFF5E8), green text (#2BA86A)

5. **AI Quote Section (24px below timeline, 16px horizontal padding):**
   - A subtle card or inline block: White (#FFFFFF) bg, 12px border-radius, 16px padding, 1px border #E2E0DC
   - Left accent: 3px left border in AI Blue (#2070CC)
   - Quote text: "Based on your goals and equipment, I've optimized this plan for fat loss with progressive challenges." in Manrope Regular Italic, 14px, #5C5C5C
   - Small "— Coach ForgeAI" attribution below in Manrope SemiBold, 12px, #2070CC

6. **Bottom Section (pinned to bottom safe area, 16px padding):**
   - Full-width primary CTA: "Let's Start!" in white text, DM Sans Bold, 16px
   - Button: solid Sport Orange (#F05A1F), pill-shaped (rounded-full), height 56px
   - Whisper-soft shadow beneath
   - The exclamation conveys excitement and momentum

7. **Overall Feel:** Rewarding, forward-looking, confidence-building. The timeline gives a clear roadmap. Color-coded phases feel professional and planned. The AI quote adds personality and shows the coach is "thinking about you." This screen should make the user feel: "Wow, this coach already knows me."

## Notes

- The vertical timeline is the hero element — must be visually clear and scannable.
- Each phase uses its own accent color consistently (node, left border, tag pill).
- The AI avatar at top is small and subtle — just a visual cue that the AI generated this plan.
- "Let's Start!" CTA should feel like the climax of the onboarding journey.
- No progress bar needed at bottom — this is the final step, momentum should push forward.
