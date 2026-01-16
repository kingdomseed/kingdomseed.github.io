# Color Directions (Distinctive, Emerald-Leaning)

Goal: premium + calm + technical. These are **directional** palettes; we’ll tune after you pick one.

## Spec-Literal Palette (must follow for the AI interface build)
The imported spec defines these exact values:
- Background: `#0a0a0a`
- Primary accent (CTAs): `#4ade80`
- Secondary / warnings: `#d4a574`
- Typography: Playfair Display (headings) + Inter (body)

Reference: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:13`

The options below are still useful for future iterations or for non-spec pages, but the AI-interface build will follow the spec values above “to the letter.”

## Theme Switching (required from day 1)
You want the spec colors as the default, but to be able to switch themes easily (per `next_version/color_test.html`).

Implementation intent (when we build):
- Use CSS variables for tokens (`--bg`, `--surface`, `--text`, `--muted`, `--accent`, `--warning`, `--border`).
- Provide theme presets:
  - `theme-spec` (default): uses the spec values above.
  - `theme-c1`, `theme-c2`, `theme-c3`: match `next_version/color_test.html` theme classes.
- Provide a simple theme switcher UI (dev-facing first; can be hidden/removed later).

Rule of thumb (from `use-distinctive-color.mdc`): 70% dominant, 20% supporting, 10% accent.

## Option C1 — Charcoal + Bone + Emerald (premium, quiet)
- Dominant (bg): `#0B0F12`
- Supporting surface: `#121920`
- Text: `#E7ECEF`
- Muted text: `#98A6B3`
- Accent emerald: `#20D1A1`
- Accent emerald (pressed/dark): `#11A97F`

Notes:
- Feels “serious” and not neon.
- Emerald is distinctive but not shouting.

## Option C2 — Deep Pine + Warm Gray + Electric Lime (energetic, closer to Flutter variant)
- Dominant (bg): `#061D16`
- Supporting surface: `#0B2A20`
- Text: `#E9F2EE`
- Muted text: `#9FB4AC`
- Accent lime: `#B7F700`
- Accent emerald: `#22E3B0`

Notes:
- Stronger personality; can be polarizing.
- Good for “developer” aesthetic if you keep typography restrained.

## Option C3 — Ink Navy + Mist + Emerald (trust, less “hacker”)
- Dominant (bg): `#071423`
- Supporting surface: `#0C2036`
- Text: `#EAF1F8`
- Muted text: `#9DB3C8`
- Accent emerald: `#2AD4A6`
- Accent amber (warnings/“gaps”): `#D2A65A`

Notes:
- Most traditional/professional.
- Easy to keep Material-ish with subtle state layers.

## How we’ll apply it (once you pick)
- Background + main surfaces use dominant/supporting.
- Links/CTAs use accent.
- “State layer” overlays (hover/focus) use accent at ~8–14% opacity.
- Charts/graphs (if any) should follow the same accent rules.
