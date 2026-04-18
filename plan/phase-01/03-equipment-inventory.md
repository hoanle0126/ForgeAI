# Equipment Inventory

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

A mobile equipment selection screen for a fitness app. Athletic Clean Sport design — warm ivory background, clean, sporty. Users select the gym equipment they own at home. Multi-select chip grid pattern.

**DESIGN SYSTEM (REQUIRED):**

- Platform: Mobile (iPhone 15 Pro, 393×852), portrait orientation
- Palette: Warm Ivory (#F9F7F4) page background, White (#FFFFFF) chip surfaces, Sport Orange (#F05A1F) selected state, Border Gray (#E2E0DC) default chip border, Dark (#1A1A1A) headings, Muted Gray (#5C5C5C) body text
- Styles: Generously rounded corners (16px radius for chips), whisper-soft diffused shadows, solid flat surfaces — NO glassmorphism, NO neon glow

**PAGE STRUCTURE:**

1. **Top Navigation Bar (16px padding):**
   - Left: Back arrow icon (Phosphor Bold, 24px, #1A1A1A)
   - Center: Step indicator — "Step 2 of 5" in Manrope SemiBold, 14px, muted gray #5C5C5C
   - Right: "Skip" text link in Manrope SemiBold, 14px, muted gray #5C5C5C

2. **Header Section (24px below nav, 16px horizontal padding):**
   - Heading: "What equipment do you have?" in DM Sans ExtraBold, 28px, dark #1A1A1A
   - Subheading: "Select all that apply — we'll build around it" in Manrope Regular, 16px, muted gray #5C5C5C
   - 8px gap between heading and subheading

3. **Equipment Chip Grid (24px below header, 16px horizontal padding):**
   2-column grid layout, 12px gap between chips. Each chip:
   - White (#FFFFFF) background, 16px border-radius, 1px border #E2E0DC
   - Whisper-soft diffused shadow
   - Width: fills column (approx 50% minus gaps), height ~96px
   - Centered content: Phosphor Bold icon (32px, #8C8C8C) on top, equipment name below in DM Sans SemiBold, 14px, #1A1A1A
   - 8px gap between icon and text

   **Chips:**
   | Dumbbells | Resistance Bands |
   | Yoga Mat | Pull-up Bar |
   | Bench | Kettlebell |
   | Jump Rope | None |

   **Selected state (show Dumbbells, Yoga Mat, and Bench selected):**
   - Border: 2px solid Sport Orange (#F05A1F)
   - Background: very subtle orange tint (#FFF5F0)
   - Icon color: Sport Orange (#F05A1F) instead of muted gray
   - Small orange check-circle badge overlaid at top-right corner of chip, 20px diameter, white checkmark inside

   **"None" chip special behavior:**
   - When selected, all other chips deselect
   - Uses an X-circle icon instead of equipment icon

4. **Bottom Section (pinned to bottom safe area, 16px padding):**
   - Full-width primary CTA: "Continue" in white text, DM Sans Bold, 16px
   - Button: solid Sport Orange (#F05A1F), pill-shaped (rounded-full), height 56px
   - Whisper-soft shadow beneath

5. **Overall Feel:** Clean selection grid. Easy to scan and multi-tap. Chips feel tactile — clear unselected vs selected contrast. Warm, organized, inviting. No clutter.

## Notes

- Multi-select: users can tap multiple chips (except "None" which is exclusive).
- Selected chips must be clearly distinct with orange border + check badge.
- Keep chip icons simple and recognizable — thick sport equipment outlines.
- 2-column grid allows comfortable thumb-tap targets on mobile.
