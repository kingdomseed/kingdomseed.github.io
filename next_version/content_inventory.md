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
| Nav labels | Impact / Skills / Experience / Portfolio / Connect | ✅ aligned | Keep | Optional: rename “Impact” → “Proof” or “Highlights”. |
| Stats | “Avg MAU (Oct–Dec 2025) ~1600”, “Platforms shipped: 5”, “Teaching & EdTech: 9 years” | ✅ aligned | Keep | Ensure MAU definition is consistent sitewide. |
| Skills section title | “The Hybrid Advantage” | ⚠️ maybe | Rewrite | Consider “Product Engineering (Flutter) + Applied NLP” or similar. |
| Skills intro paragraph | “bridge the gap between engineering/design/educational UX…” | ✅ | Keep (tighten) | Good story; ensure it supports *Flutter-first* not generic “frontend”. |
| Skills radar chart | Self-scored axes (UI Engineering 95, Edu UX 95, etc.) + tooltips list React/Next first | ⚠️ | Rewrite / Remove | “Self-rating” can read as hype; also pushes Next/React and “Instructional Design” (you said to separate learning design). Consider replacing with simple competency clusters. |
| Skills box: “Frontend Frameworks” | Next.js/React/Astro/TS + Flutter/Dart | ❌ wrong emphasis | Rewrite | Split into: “Flutter (primary)” and “Web (secondary)”; avoid listing Flutter as an afterthought. |
| Skills box: “Performance & Analytics” | Next.js Image Opt + Firebase/Sentry/Web Vitals | ⚠️ | Rewrite | Remove Next.js-specific bullet or move it under Web secondary; include product analytics tooling you actually use (and are comfortable mentioning). |
| Skills matrix order | Next.js/React/Astro shown before Flutter/Dart | ❌ wrong emphasis | Rewrite | Re-order clusters: Flutter/Dart + mobile first; ML/NLP next; cloud next; web last. |
| Portfolio order | Web case study shown before Flutter app | ⚠️ wrong emphasis | Rewrite | Reorder to lead with Flutter product(s) and only then web + infra case studies. |
| Portfolio card copy | “Primary frontend portfolio…” and “vibe coding…” | ⚠️ | Rewrite | Rephrase to reduce web-first emphasis and to keep “AI-assisted” framed as process. |
| Experience bullets | Mentions Next.js photography + Flutter shipping | ✅ / ⚠️ | Rewrite | Keep both but lead with Flutter product ownership; web is supporting proof. |
| Experience header | “Professional Journey” | ✅ | Keep | Consider “Experience” for simpler skimming. |
| Experience role 1 bullets | MAU ~1,600; Next.js site; “official Mythic”; LibreChat; “200+ beta testers”; “Designed all UI/UX…” | ⚠️ | Rewrite + Source? | “Official” wording + “200+” + analytics tooling mentions should be confirmed. Consider moving web/LibreChat bullets to “Case studies” and keep role bullets product-focused. |
| Experience role 2 bullets | Highest pass rates; curriculum; Unity×Meta VR grant; +150% enrollment | ⚠️ | Source? | Strong, but some are “big-number” claims; confirm comfort and wording (avoid sounding like marketing). |
| Experience role 3 | Leadership & Ministry Training | ✅ | Keep | Keep factual; keep it short. |
| Education | Stuttgart + UTA blocks | ✅ aligned | Keep | Ensure dates match truth set. |
| Certs/PD | Long lists | ⚠️ depends | Rewrite | Decide “top 6–10” for homepage; full list can live in CV. |
| Awards | Microsoft IEE, Top Hat Award, Grow with Google | ✅ aligned | Keep | Ensure context is clear (education/innovation). |
| Awards (expanded) | Adds Core Value of Month + VR grant specifics | ✅ / ⚠️ | Keep + tighten | Align to `professional-inventory.md` wording; avoid extra unverifiable “nationally” unless comfortable (it is in the inventory doc). |
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

## Other pages in repo (potentially confusing on a personal domain)

| Page | What it is | Action | Notes |
|---|---|---|---|
| `privacy/index.html` | Privacy policy for “BinaryLoom AI Chat” | Decide | Not part of resume story; may be fine if domain is `binaryloom.io`, but odd if mirrored on `jasonholt.dev`. |
| `terms/index.html` | Terms for “BinaryLoom Chat” | Decide + verify | Mentions model names that may be stale vs current LibreChat config; review before treating as canonical. |
