# Questions + Decisions (to make this easy)

These are the decisions we need from you. I’m only asking where it’s either taste-based or requires your confirmation for truth/comfort.

## Status
Most decisions are now made (React SPA via Vite, spec-literal UI/architecture, dark-only, theme switching, split portfolio, no radar chart). Remaining items are mostly: LLM provider choice, Supabase project setup details, and final hero wording.

## A) Direction (lock early)
1. **Build approach (pick one)**
   - **A1 — Keep static HTML/CSS/JS:** we reorganize into `next_version/` with chunked CSS and “section blocks” you can reorder by moving HTML blocks.
   - **A2 — Migrate to Astro:** more composable sections/components and easier reuse for case studies, but adds a build pipeline + project structure.
   - **A3 — React SPA (Vite):** aligns with the imported spec (`VITE_*` env vars, Supabase Edge Functions).

2. **Homepage emphasis (confirm)**
   - Primary: **Flutter/Dart + Product Engineering**  
   - Secondary: **CompLing (ML/DL/NLP) + Azure/DevOps**  
   - Tertiary: **Web/Next.js/Astro**  
   Confirm this exact ordering is what you want.

3. **Social proof links (taste + strategy)**
   - Keep LinkedIn link prominent
   - Keep LinkedIn link but de-emphasize (footer only)
   - Remove LinkedIn entirely (GitHub + email only)
   Your `next_version/WHY_REACT.md` argues LinkedIn is “dead”; I’ll follow your preference here.

4. **LLM provider (high impact; pick one)**
   - **L1 — Follow spec literally (Anthropic via Supabase Edge Functions)**: uses `ANTHROPIC_API_KEY` stored in Supabase secrets (no frontend key exposure).
   - **L2 — Use your Azure AI Foundry models instead**: deviates from the spec’s example code but aligns with how you actually host models.
   This affects the Edge Function implementation and what secrets you store.

5. **Azure model deployment name (confirm)**
   - In Azure OpenAI, the `model` field is typically your **deployment name**.
   - Which deployment name should we use for:
     - Chat (`/chat`): e.g. `gpt-5.2` or `gpt-5.2-chat`
     - JD analyzer (`/analyze-jd`): e.g. `gpt-5-mini` (cheaper) or same as chat

6. **Azure auth header style (confirm)**
   - Some Azure docs use `api-key: ...`
   - Some portal snippets show `Authorization: Bearer ...`
   We can support either via `AZURE_OPENAI_AUTH_STYLE` in Supabase secrets.

## B) Story (what visitors should feel/learn)
4. **Pick the “one sentence” identity statement** (this becomes the hero `H1`)
   - B1: “Product Engineer building Flutter/Dart cross-platform apps.”
   - B2: “Product Engineer shipping Flutter/Dart products, studying Computational Linguistics.”
   - B3: “Product Engineer (Flutter/Dart) with an M.Sc. focus in Computational Linguistics (NLP).”
   - (Or your own; we can iterate.)

5. **What’s the #1 proof you want to lead with on the homepage?**
   - P1: “Shipped across 5 platforms” (strong, factual).
   - P2: “Avg MAU ≈ 1,600 (Oct–Dec 2025)” (strong, but implies analytics credibility).
   - P3: “Official Mythic companion app(s)” (strongest if you’re comfortable with wording).

6. **Portfolio structure**
   - Should we split into **Products** (Mythic) vs **Case Studies** (LibreChat, Photography)?
   - Or keep one “Featured work” grid but reorder + tag?

## C) Truth / comfort checks (you decide wording)
7. **“Official/licensed” wording for Mythic**
   - What exact public phrasing are you comfortable with? (We’ll use your wording verbatim.)

8. **What can we cite publicly (if anything)?**
   - App store links? Analytics screenshots? None (keep claims unlinked/approx)?  
   Your preference determines how specific we can be with numbers/ratings.

## D) Design (taste-based; pick a lane)
9. **Theme**
   - D1: Dark-first (like `flutter/index.html`) with subtle light surfaces.
   - D2: Light-first with dark mode toggle.
   - D3: Dark-only (simplest).

10. **Color palette (emerald-leaning; pick one “direction”, not exact hex yet)**
   - C1: **Charcoal + Soft Bone + Emerald** (premium, calm, technical).
   - C2: **Deep Pine + Warm Gray + Electric Lime** (closer to the Flutter variant, more “energy”).
   - C3: **Ink Navy + Mist + Emerald** (trust/professional, less “neon”).

11. **Material 3 influence (subtle)**
   - Do you want the site to *feel* Material-ish mainly via **typography + spacing + state layers**, or do you also want **chips/cards** to look recognizably Material?

## E) Content curation (reduce overwhelm)
12. **Certifications on homepage**
   - Pick a cap: **6**, **10**, or **“top 3 only”**.

13. **Education + teaching**
   - Do we lead with “9 years teaching” as proof of communication/leadership, or keep it more background and lead with product shipping?

14. **Radar chart**
   - Keep a chart (but rework axes to Flutter/NLP/Cloud/Product with no “self-scored numbers”), or remove entirely?
   This matters because “UI Engineering: 95” can read like hype.

15. **Learning design vs education context**
   - You previously said learning design is separate from Flutter/Dart. Do you want to keep “Educational UX” as a *supporting* strength (communication/accessibility), but avoid “Instructional Design” language and detailed pedagogy terms on the homepage?

## Your latest answers (captured)
- Build: **A3 (React SPA via Vite), no Lovable, no Next.js**
- Positioning preference: Product Engineer + Learning Experience Designer + CompLing M.Sc. student (Flutter is a tool, not the headline)
- LinkedIn: keep as contact method (footer/contact)
- Proof: officially licensed apps + 5 platforms + ~1,600 MAU
- Portfolio: split Products vs Case Studies
- Theme: dark-only (light mode optional later if easy)
- Palette: C1 looks best from `next_version/color_test.html`
- UI: Material-ish cards/chips/elevation; **no radar chart**
- Certs: show curated top, expand to full + AI context
- Story: lead with 9 years teaching → transition to product development
- Learning design language: Educational UX + Instructional Design are both valid to include
- Canonical domain intent: `jasonholt.dev` (not `binaryloom.io`)
- LLM provider: **Azure OpenAI (your Azure AI Foundry setup)**
- Azure model: **`gpt-5.2-chat`** (starting point)
- Company pills: **Jason Holt Digital**, **Uplift Education**, **Crowley ISD** (optional: Newman International Academy)
- Employer clarification: Word Mill Games is a licensed IP relationship; University of Stuttgart is enrollment; FTTA is a program enrollment (not employment).
