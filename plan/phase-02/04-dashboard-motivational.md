# Dashboard Motivational

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

A warm, emotionally engaging mobile home dashboard variant for "ForgeAI" fitness app. This version leads with motivation — a hero quote, progress milestones, and streak celebrations. Athletic Clean Sport aesthetic — warm, light-first, encouraging, and personal.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) cards with border (#E2E0DC), Sport Orange (#F05A1F) primary accent, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body, Green (#2BA86A) success/growth, Amber (#F5A623) energy/warmth
- Styles: 16px rounded cards, solid flat surfaces, warm and inviting feel — NO glassmorphism, NO neon

**PAGE STRUCTURE:**

1. **Status Bar:** Standard iOS status bar, dark text on warm ivory

2. **Top Bar (16px horizontal padding):**
   - Left: Circular avatar (40×40px) + "Good morning, Alex" in DM Sans Bold, 18px, dark
   - Right: Streak badge pill — "12🔥" with orange-tinted background (#FFF0EB)

3. **Hero Motivational Quote Card (16px margin top, featured card):**
   - Large white card with a warm subtle gradient accent — very thin left border (3px) in Sport Orange (#F05A1F)
   - Quote text: "The only bad workout is the one that didn't happen." in DM Sans Bold, 18px, dark #1A1A1A, centered
   - Attribution: "— ForgeAI Coach" in Manrope Regular italic, 13px, muted gray #5C5C5C, right-aligned below quote
   - Small decorative Phosphor Quotes icon (24px, #E2E0DC opacity) positioned top-left inside the card as a subtle visual anchor
   - Card: white bg, 16px radius, border #E2E0DC, 24px internal padding (extra breathing room for the quote)

4. **Day Counter + Streak Celebration (16px margin top):**
   - Large prominent counter centered: "Day 45" in DM Sans ExtraBold, 40px, dark #1A1A1A
   - Below: "of your fitness journey" in Manrope Regular, 14px, muted gray
   - Below that: Celebration banner — a warm-tinted card (#FFF8F0 background), rounded 12px
   - Inside banner: Flame icon + "🔥 12-Day Streak! Personal best!" in DM Sans Bold, 14px, Sport Orange (#F05A1F) text
   - Small confetti-like decorative dots (orange, green, amber) scattered lightly inside the banner area — celebratory but not loud

5. **Progress Photo Comparison Thumbnail (16px margin top, white card):**
   - "Your Progress" label, DM Sans SemiBold, 14px, dark, left-aligned
   - "See full comparison →" link text, Manrope SemiBold, 12px, Sport Orange, right-aligned
   - Two rounded thumbnail images side by side (aspect ratio ~3:4, ~140px tall each, 8px gap)
   - Left thumbnail: labeled "Day 1" in Manrope SemiBold, 11px, white text with dark overlay at bottom of image
   - Right thumbnail: labeled "Day 45" in same style
   - Both images: rounded 12px corners, placeholder silhouette illustrations (person outline, abstract body shape — not photographic)
   - Card: white bg, 16px radius, border #E2E0DC, 16px padding

6. **Today's Workout Card (16px margin top, compact):**
   - "Today's Workout" label in Manrope SemiBold, 12px, muted gray
   - "Upper Body Focus" in DM Sans Bold, 16px, dark
   - "28 min · 6 exercises" in Manrope Regular, 13px, muted gray
   - Full-width pill CTA "Start Workout" — Sport Orange, white text, DM Sans Bold, 16px, height 48px
   - Card: white bg, 16px radius, border #E2E0DC, 16px padding

7. **Bottom Tab Bar (fixed, above home indicator):**
   - 4 tabs: Home (active, Sport Orange), Plan, Progress, Me (inactive, #8C8C8C)
   - Phosphor Bold icons 24px + Manrope SemiBold 10px labels
   - White background, top border #E2E0DC

8. **Overall Feel:** Emotionally warm and deeply personal — this dashboard variant makes the user feel seen and celebrated. The motivational quote sets the tone, the Day Counter creates a powerful "don't break the chain" hook, and the progress photos provide visual proof of transformation. The workout CTA is present but secondary to the emotional engagement. Warm, encouraging, proud.

## Notes

- This variant is designed for users who are motivated by emotional feedback and milestone celebration.
- The quote should feel like it comes from a real coach — personal and authentic, not generic corporate motivation.
- The Day Counter is the most visually dominant element — it creates a powerful habit loop.
- Progress Photo thumbnails should use abstract placeholder silhouettes — NOT photorealistic images. Clean, illustrative style.
- The streak celebration banner should feel joyful but tasteful — sporty confetti dots, not childish animations.
- The workout card is intentionally placed at the bottom — motivation first, action second.
- All spacing follows 8px grid.
