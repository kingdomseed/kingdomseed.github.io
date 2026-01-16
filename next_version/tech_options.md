# Tech Options (Decision Brief)

You asked to pick a direction and then stick with it. This is the short, practical comparison for *this* repo and your goals.

## Option A1 — Static HTML/CSS/JS (recommended default)
**Best when:** you want speed, reliability, easy deployment (GitHub Pages), and a site that stays simple.

Pros:
- No build step; very hard to “break the pipeline”.
- Easy to rearrange by moving section blocks in `index.html`.
- Works well with chunked CSS files + design tokens.

Cons:
- Reuse across pages is manual (copy/paste) unless we add a lightweight templating step later.
- Complex interactive features (JD analyzer / chat) are possible but require separate serverless functions or a backend.

## Option A2 — Astro
**Best when:** you want component-style composition and content reuse (layouts, MD/MDX) without going “full app”.

Pros:
- Clean component composition (header/hero/sections) without runtime React by default.
- Great for case studies and content pages.
- Still deploys as static output easily.

Cons:
- Introduces project structure + build tooling.
- Slightly more overhead for quick edits compared to single-file HTML.

## Option A3 — React (framework choice inside A3)
**Best when:** you want the “AI interface” concept (chat drawer + JD analyzer) as a first-class product feature.

Pros:
- Best ergonomics for rich interactions and stateful UI.
- Strong ecosystem for serverless APIs + auth + data layers.

Cons:
- Highest complexity and maintenance overhead.
- More ways for deployment to fail (CI/build/runtime) compared to static.

### A3.1 — Vite + React (SPA) + Supabase Edge Functions (closest to the imported spec) ✅ chosen
- Frontend is a static build (easy to host anywhere).
- Backend lives in Supabase (DB + RLS + edge functions), matching the “Lovable React App” architecture.

### A3.2 — Next.js (React framework) + API routes (optional alternative) ❌ not chosen
- Useful if we want SSR/streaming/UI performance primitives and to keep APIs in the same repo.
- Not required if we already commit to Supabase edge functions for `/chat` and `/analyze-jd`.

## Recommendation (updated)
If you pick A3 for the AI-interface direction, default to **Vite + React + Supabase edge functions** because that’s what the imported spec most closely describes.
Choose **Next.js** only if you want SSR and/or you want your API routes to live in the same codebase (instead of Supabase).
