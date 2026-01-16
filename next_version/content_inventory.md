# Content Inventory (Current Site → Next Version)

Goal: capture every meaningful piece of copy, evaluate it against `next_version/truth_set.md`, and decide what to keep/change/remove.

Legend:
- **Keep**: aligned + accurate
- **Rewrite**: accurate but mis-positioned, unclear, or wrong emphasis
- **Remove**: misleading, unverifiable, or off-story
- **Source?**: needs a link or internal evidence (analytics/report/screenshot) before we use it

## Homepage (`/index.html`)

| Section | Current copy (short) | Fit vs truth set | Action | Notes |
|---|---|---:|---|---|
| Hero headline | “Fast. Beautiful. Accessible.” | ⚠️ misaligned | Rewrite | Reads like a product tagline; should be *about you* (Product Engineer / Flutter / CompLing). |
| Hero subheadline | “Product Engineer — Flutter/Dart Cross-Platform — M.Sc. Computational Linguistics” | ✅ aligned | Keep | Promote to `H1` (likely). |
| Hero paragraph | “I build and ship cross-platform products… (Oct 2025 → Summer 2027)” | ✅ aligned | Keep (minor rewrite) | Tighten for skimmability. |
| Stats | “Avg MAU (Oct–Dec 2025) ~1600”, “Platforms shipped: 5”, “Teaching & EdTech: 9 years” | ✅ aligned | Keep | Ensure MAU definition is consistent sitewide. |
| Skills section title | “The Hybrid Advantage” | ⚠️ maybe | Rewrite | Consider “Product Engineering (Flutter) + Applied NLP” or similar. |
| Skills: Frameworks box | Lists Next.js/React/Astro/TS before Flutter | ❌ wrong emphasis | Rewrite | Flutter/Dart should be primary; web tools can move to “Web (secondary)”. |
| Skills: Performance & Analytics | Includes “Next.js Image Opt.” | ⚠️ wrong emphasis | Rewrite | Replace with analytics/quality tools used on primary products (e.g., PostHog/Firebase/Sentry) if true. |
| Portfolio order | Web case study shown before Flutter app | ⚠️ wrong emphasis | Rewrite | Reorder to lead with Flutter product(s) and only then web + infra case studies. |
| Experience bullets | Mentions Next.js photography + Flutter shipping | ✅ / ⚠️ | Rewrite | Keep both but lead with Flutter product ownership; web is supporting proof. |
| Education | Stuttgart + UTA blocks | ✅ aligned | Keep | Ensure dates match truth set. |
| Certs/PD | Long lists | ⚠️ depends | Rewrite | Decide “top 6–10” for homepage; full list can live in CV. |
| Awards | Microsoft IEE, Top Hat Award, Grow with Google | ✅ aligned | Keep | Ensure context is clear (education/innovation). |
| Embedded PDF (resume) | Technical skills line includes Next.js/React first | ❌ wrong emphasis | Rewrite | Ensure CV summary + skills are Flutter-first and CompLing-forward. |
| Connect headline | “Let’s Work Together” | ✅ aligned | Keep | Optional: make slightly more specific (“Let’s talk Flutter + product engineering”). |
| Connect availability | “Considering full-time roles case-by-case…” | ✅ aligned | Keep | Matches your stated openness to multiple engagement types. |
| Open source claim | “Contributor to Shorebird… icloud_storage_plus…” | ⚠️ confirm | Source? / Rewrite | Include only if accurate + specific (PR links optional). Otherwise keep broader (“Open source contributor”). |
| Work authorization | “US Citizen with German Residence Permit…” | ✅ aligned | Keep | Keep factual and minimal. |

## Case studies

| Page | Current emphasis | Action | Notes |
|---|---|---|---|
| `case-study-llm-chat-platform.html` | Good “ops maturity” framing; includes model list | Keep + tighten | Model list must be generated from config (not memory) + date-stamped; “model count not the point” stays. |
| `case-study-photography-azure.html` | Clear deployment story; includes “AI-assisted iteration” | Keep + tighten | Ensure “Cline + Sonnet 3.7” phrasing stays process-focused and non-hype. |
