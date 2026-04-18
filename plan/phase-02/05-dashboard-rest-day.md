# Dashboard Rest Day

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

A calm, restorative mobile home dashboard state for "ForgeAI" fitness app — displayed on rest days. The energy shifts from Sport Orange urgency to Recovery Purple serenity. Athletic Clean Sport aesthetic — warm, light-first, but noticeably softer and more restful than the active workout variants.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) card backgrounds with border (#E2E0DC), Recovery Purple (#7C5CC4) as the dominant accent for this screen (replacing Sport Orange temporarily), soft purple tint (#F5F0FF) for featured card backgrounds, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body, Green (#2BA86A) for weekly progress
- Styles: 16px rounded cards, solid flat surfaces, soft and calming feel — NO glassmorphism, NO neon. Shadows even softer than usual.

**PAGE STRUCTURE:**

1. **Status Bar:** Standard iOS status bar, dark text on warm ivory

2. **Top Bar (16px horizontal padding):**
   - Left: Circular avatar (40×40px) + "Good evening, Alex" in DM Sans Bold, 18px, dark
   - Right: Streak badge pill — "12🔥" with orange-tinted background (#FFF0EB), Sport Orange text — streak continues even on rest days

3. **Rest Day Hero Card (16px margin top, featured card with purple tint):**
   - Card background: soft purple tint (#F5F0FF), border in light purple (#E0D4F5), 16px radius, 24px internal padding
   - Centered illustration area (~120px height): A minimal, abstract illustration of a person in a restful stretching pose — clean line art style, using Recovery Purple (#7C5CC4) as primary stroke color and soft purple fill. Peaceful, zen-like, not anatomically detailed
   - Below illustration: "Today is Rest Day" in DM Sans ExtraBold, 22px, dark #1A1A1A, centered
   - Below heading: "Your muscles are rebuilding. Recovery is part of the plan." in Manrope Regular, 14px, muted gray #5C5C5C, centered, max 2 lines
   - Small Phosphor MoonStars icon (20px, Recovery Purple) next to or above the heading as a subtle mood indicator

4. **Gentle Activity Suggestion Card (16px margin top, white card):**
   - "Suggested Activity" label in Manrope SemiBold, 12px, muted gray, uppercase
   - White card with Phosphor Yoga icon (32px, Recovery Purple #7C5CC4) on the left
   - Right side: "Light Stretching" in DM Sans Bold, 16px, dark. "10 min · Full body" in Manrope Regular, 13px, muted gray below
   - Right-aligned: Outlined pill button "Try it" — white bg, thin Recovery Purple border, Recovery Purple text, Manrope SemiBold, 13px, height 32px
   - Card: white bg, border #E2E0DC, 16px radius, 16px padding

5. **Recovery Tips (8px margin top, white card):**
   - "Recovery Tips" label, DM Sans SemiBold, 14px, dark
   - 3 tip items listed vertically with 8px gap:
     - Each item: Phosphor icon (20px, muted gray) + tip text in Manrope Regular, 13px, #5C5C5C
     - Tip 1: Drop icon + "Stay hydrated — aim for 2L today"
     - Tip 2: BedDouble icon + "Get 8+ hours of sleep tonight"
     - Tip 3: ForkKnife icon + "Eat protein-rich meals for repair"
   - Card: white bg, border #E2E0DC, 16px radius, 16px padding

6. **Next Workout Preview (16px margin top, white card):**
   - "Coming Tomorrow" label in Manrope SemiBold, 12px, muted gray
   - "Lower Body Strength" in DM Sans Bold, 16px, dark
   - "32 min · 7 exercises" in Manrope Regular, 13px, muted gray
   - Right side: Small Phosphor CaretRight icon (#8C8C8C), tappable feel
   - Card: white bg, border #E2E0DC, 16px radius, 12px padding

7. **Weekly Progress Row (16px margin top):**
   - "This Week" label, DM Sans SemiBold, 14px, dark
   - 7 circular dots for Mon–Sun:
     - Completed workout days: Green (#2BA86A) filled
     - Today (rest day): Recovery Purple (#7C5CC4) filled with a small moon icon inside or beside
     - Upcoming: empty with border #E2E0DC

8. **Bottom Tab Bar (fixed, above home indicator):**
   - 4 tabs: Home (active, Sport Orange #F05A1F — stays orange even on rest day for brand consistency), Plan, Progress, Me (inactive, #8C8C8C)
   - Phosphor Bold icons 24px + Manrope SemiBold 10px labels
   - White background, top border #E2E0DC

9. **Overall Feel:** Calm, nurturing, and intentionally different from the high-energy workout dashboard. The shift to Recovery Purple signals that rest is planned, not lazy. The illustration and messaging make the user feel proud of resting — it's part of the program. No urgency, no aggressive CTAs. Gentle suggestions instead of demands. The screen should feel like exhaling after a deep breath.

## Notes

- The color shift to Recovery Purple is the most important visual signal — it immediately communicates "this is different, this is intentional."
- The stretching illustration should be abstract and minimal — clean line art, not photo-realistic or cartoony.
- Recovery Tips feel like a caring coach whispering advice — not a list of commands.
- The "Try it" button for stretching is subtle and optional — no pressure to do anything.
- Next Workout Preview gives users something to look forward to without creating urgency.
- The bottom tab bar keeps Sport Orange for the active Home tab — maintaining brand consistency even when the page theme shifts to purple.
- The overall vertical rhythm is more spacious than workout dashboards — matching the restful mood.
- 8px grid spacing throughout.
