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

## Option A3 — React / Next.js
**Best when:** you want the “AI interface” concept (chat drawer + JD analyzer) as a first-class product feature.

Pros:
- Best ergonomics for rich interactions and stateful UI.
- Strong ecosystem for serverless APIs + auth + data layers.

Cons:
- Highest complexity and maintenance overhead.
- More ways for deployment to fail (CI/build/runtime) compared to static.

## Recommendation
Start with **A1 (static)** for the story-first, Flutter-first rewrite inside `next_version/`.
Only pick **A3 (React/Next)** if you explicitly want to ship the “AI interface” concept as a major feature (Phase 7 in `next_version/task_plan.md`).
