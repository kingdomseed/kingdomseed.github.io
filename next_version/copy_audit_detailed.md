# Copy Audit (Detailed)

Goal: review all meaningful on-page copy for alignment with the “Flutter/Dart + Product Engineer + CompLing” story, without exaggeration.

Scope: current root homepage `index.html` + key linked pages. (This does not attempt to audit every single aria-label/tool-tip string, only what a human reader sees.)

## Homepage (`index.html`)

### Meta / SEO
- Title: `Jason Holt | Product Engineer — Flutter/Dart Cross-Platform — M.Sc. Computational Linguistics` → **Keep**
- Description: `Product Engineer shipping cross-platform Flutter/Dart apps...` → **Keep** (tighten optional)

### Nav
- “Impact” → **Rewrite** (optional): “Highlights” or “Proof”
- “Skills / Experience / Portfolio / Connect” → **Keep**

### Hero (visible)
- Badge: `OPEN TO FULL-TIME / CONTRACT / INTERNSHIPS` → **Keep** (ensure matches your latest preference)
- Headline: `Fast. Beautiful. Accessible.` → **Rewrite** (misaligned; reads like product slogan)
  - Replacement: use one of the H1 options in `next_version/copy_deck.md`
- Subheadline: `Product Engineer — Flutter/Dart Cross-Platform — M.Sc. Computational Linguistics` → **Keep** (possibly promote to H1 and demote the slogan)
- Paragraph: `I build and ship cross-platform products...` → **Keep** (tighten)
- CTAs: `Let's Connect` / `View Work` → **Keep**

### Stats
- `Avg MAU (Oct–Dec 2025)` + “approx” sentence → **Keep**
- `Platforms Shipped` + platform list → **Keep**
- `Teaching & EdTech` → **Keep**
- MAU footnote definition → **Keep** (ensure consistent across site)

### Skills
- Title: `The Hybrid Advantage` → **Rewrite** (too generic; doesn’t signal Flutter/CompLing)
- Paragraphs referencing awards → **Keep** (tighten)
- Radar chart caption: `Hover points to explore skills` → **Keep** (if chart stays)
- Radar chart itself (self-scored numbers + Next/React in tooltips) → **Rewrite or Remove**
  - Risk: reads like marketing/self-rating rather than proof; also emphasizes web-first + “Instructional Design”
- Skill boxes:
  - `Frontend Frameworks` (Next.js listed first) → **Rewrite**
  - `Performance & Analytics` includes `Next.js Image Opt.` → **Rewrite**
  - `Cloud & Infrastructure` → **Keep** (wording tweaks optional)
  - `AI Tools & Agentic Skills` → **Keep** (optional: de-hype labels like “Prompt Eng.”)
  - `Product & Collaboration` includes `Linear Method` + `Linear` → **Rewrite** (dedupe)
- “Technical Skills Matrix” ordering (Next/React before Flutter) → **Rewrite**

### Experience
- Section header: `Professional Journey` → **Keep** (optional rename to “Experience”)
- “Expand Details” microcopy → **Keep**
- Role 1 bullets:
  - MAU ~1,600 → **Keep**
  - Photography site bullet → **Keep** (but not first)
  - “official Mythic…” → **Needs exact wording confirmation**
  - LibreChat bullet → **Keep** (could move to Case Studies section)
  - “200+ beta testers using Firebase Analytics” → **Confirm / Source?**
  - “Designed all UI/UX assets from scratch” → **Confirm** (likely true, but choose phrasing)
- Role 2 bullets:
  - “highest pass rates” / “150% enrollment” → **Source? / Rewrite** (avoid sounding like marketing; keep if you’re comfortable)
  - Unity×Meta VR grant details → **Keep** (grounded; in `professional-inventory.md`)
- Role 3 (FTTA) → **Keep**

### Portfolio
- Section title: `Featured Work` → **Keep**
- Filters: `Web / Mobile` → **Keep** (optional rename “Apps”)
- Ordering → **Rewrite** (lead with Flutter shipped product(s))
- Photography card blurb includes “vibe coding” → **Rewrite** (keep as “AI-assisted iteration” process, not gimmick)
- Digital Product Site card: “Primary frontend portfolio…” → **Rewrite** (avoid web-first framing)

### Education & Credentials
- Section title and degree blocks → **Keep**
- Certifications grid labels (abbreviations like “Ad”, “Un”, “Sw”) → **Rewrite** (optional: clarity)

### Awards & Context
- Awards block currently includes “Core Value of the Month” and details like “one of 1,000” → **Keep** if comfortable; wording should match `professional-inventory.md`.
- “Open Source” claim → **Confirm / Source?**
- Work authorization line → **Keep** (minimal)

### Connect + Footer
- “Let’s Work Together” → **Keep**
- “Considering full-time roles on a case-by-case basis…” → **Keep** (ensure it matches your current intent)
- Footer copyright year `2025` → **Update** (should be `2026` now)

## Linked pages

### `case-study-photography-azure.html`
- Mostly aligned; keep “AI-assisted iteration” as process, not hype.

### `case-study-llm-chat-platform.html`
- Aligned; model appendix should be date-stamped and derived from config; avoid exposing Azure resource identifiers.

### `privacy/index.html` + `terms/index.html`
- These are for BinaryLoom Chat and may not belong in the “personal resume” surface if `jasonholt.dev` mirrors `binaryloom.io`.
- `terms/index.html` appears out-of-date vs current LibreChat config (mentions “GPT-5.1, Claude…”).

