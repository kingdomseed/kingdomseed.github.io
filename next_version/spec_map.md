# Spec Map (Follow “Advanced Guide” Literally)

This file is a navigation aid. It links the required design + architecture details in the imported spec so we can implement “to the letter” without losing track.

Spec source: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:1`

## Part 1 — Public site UI (what employers see)
- Design system (colors, typography, card style): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:13`
- Fixed navigation (“Experience | Fit Check” + “Ask AI”): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:21`
- Hero requirements (status badge, company pills, CTA): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:27`
- Experience cards + expandable “AI Context” panel structure: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:37`
- Skills matrix (Strong/Moderate/Gaps): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:61`
- JD Analyzer UI + JSON-driven output panel design: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:72`
- Chat drawer behavior + suggested questions: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:108`
- Footer expectations (incl. LinkedIn as a contact path): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:121`

## Part 2 — Admin panel (the “truth input” surface)
- Admin auth + “single candidate” model: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:133`
- Required data capture fields:
  - Basic profile: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:140`
  - Narrative: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:153`
  - Experience deep dive (private context fields): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:165`
  - Skills self-assessment fields: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:188`
  - Gaps & weaknesses (critical): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:198`
  - Values/culture: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:209`
  - FAQ responses: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:221`
  - Anti-sycophancy instructions: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:233`

## Part 3 — LLM integration architecture
- Overall architecture diagram (React frontend → Supabase DB + Edge Functions → LLM): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:248`
- Database schema (tables + fields): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:284`
- Edge Function: `/chat` handler (Deno + supabase-js + Anthropic): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:396`
  - “BRUTALLY HONEST” system prompt skeleton and sections: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:474`
- Edge Function: `/analyze-jd` handler + required JSON output format: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:538`

## Provider adaptation (approved): Azure OpenAI
- We are using Azure OpenAI instead of Anthropic, implemented via Supabase Edge Functions.
- REST reference used (official): `https://learn.microsoft.com/en-us/azure/ai-foundry/openai/how-to/responses?view=foundry-classic`
- Supabase secrets reference (official): `https://supabase.com/docs/guides/functions/secrets`

## Part 4 — Frontend implementation notes (we implement, no Lovable)
- Required component + folder structure: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:630`
- State management: React Query + Zustand/Context: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:672`
- Env vars (Vite): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:678`
- Cross-check (same intent, earlier doc): `next_version/Beginners Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:1` (see “PART 4: FRONTEND IMPLEMENTATION NOTES”)

## Part 5 — Deployment checklist (translate “Lovable setup” → “our Vite React app”)
- Supabase setup + RLS + Edge Functions + secrets: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:688`
- Honesty testing requirements (must reject bad-fit JDs): `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:709`
- Anti-sycophancy guidance + calibration examples: `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:746`

## Approved spec deviation (requested): Theme switching
The spec hardcodes a palette. You want the spec palette as the default, but to support easy theme switching from day 1 for testing (using the `theme-c1/c2/c3` approach in `next_version/color_test.html`).

Decision:
- Default theme = spec values (`next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md:13`)
- Additional themes = `next_version/color_test.html` variants

## Implementation note: Supabase key choice
To stay spec-literal and keep Edge Functions JWT verification enabled, the Vite app uses the legacy anon JWT key:
- `VITE_SUPABASE_ANON_KEY`
