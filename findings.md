# Findings & Decisions — Professional Website Update

## Requirements (from user)
- Plan a fair, balanced, professional content update to the website.
- Focus on who you are professionally.
- Do not embellish or lie; avoid unsupported claims.
- Use `docs/professional_inventory_update.md` as the source material.

## Inputs / Sources of Truth
- `docs/professional_inventory_update.md` (AI-compiled inventory from a long conversation)
- `index.html` (current live homepage copy)
- Any public artifacts you’re comfortable treating as “evidence” (e.g., GitHub repos, talks, blog posts, portfolio items)
- `professional-inventory.md` (your “master inventory” doc; last updated June 2025)
- Local project notes for the AI chat platform: `/Users/jholt/Documents/librechat-setup` (private ops/config repo for a LibreChat deployment)
- Public product site: `jasonholtdigital.com` (official Mythic GME 2e apps)
- Local repo for photography site: `/Users/jholt/development/jhp-next` (Next.js + Azure Container Apps)

## Current Site: Notable Positioning / Claims (from `index.html` header + hero)
- Title/meta positioning: “Front End Developer & Learning Product Specialist”; emphasizes React/Next.js/TypeScript; “11 years of learning product experience”; “Based in Frankfurt, Germany”; “Available for hire”.
- Hero copy: “Front End Lead & Learning Product Specialist”; “Blending production Next.js experience with 11 years of learning product design.”
-
## Current Site: Additional Claims Found (requires review)
- Key Metrics (explicit numbers in `index.html`):
  - User Growth: 400%
  - User Retention: 85%
  - Learning Product Exp.: 11 years
- Experience timeline includes a claim about architecting/deploying `jasonholtphotography.com` (Next.js) with custom gallery logic + booking API.
- Experience timeline also includes a claim about deploying a “production AI chat platform” (details truncated in earlier scan; needs full review).
- Portfolio includes a Flutter app card with “4.8/5 Rating, 85% Retention.”
- Portfolio includes a “Private AI Chat App” card linking to `jasonholtdigital.com` with claims: “Production AI platform on Azure. 7 LLMs, MongoDB Atlas, RAG pipeline, semantic search.”
- A “printable resume”/embedded resume section includes claims like:
  - “Scaled active users 400%”
  - “85% retention”
  - “4.8/5 stars” for Mythic GME 2e
  - Mentions contributions to Flutter ecosystem (e.g., Shorebird, `icloud_storage_plus`)

## Constraints & Guardrails (initial)
- Avoid unverifiable superlatives (e.g., “best”, “world-class”, “expert”) unless clearly contextualized.
- Prefer concrete statements (“built”, “shipped”, “led”, “designed”) with scope and timeframe when known.
- If something is true but sensitive/under NDA, either omit or generalize carefully (no identifying details).

## `docs/professional_inventory_update.md`: Notable Proposed Updates / Claims (to verify)
- Proposed positioning shift: from web-focused (“Front End Lead”) toward “cross-platform product developer” (Flutter/Dart) + learning products.
- Proposed metrics (needs evidence policy):
  - “350 MAU (Mar 2025) → ~1,600 MAU (2026)” (claimed verifiable via analytics like PostHog).
  - “~4.8/5 average rating” across iOS/Android (later cites 4.7/5 Apple, 4.9/5 Google Play).
  - “85% retention” (doc suggests clarifying definition/time window).
- Proposed experience framing: “9 years teaching computer science/digital design + 2 years product development” rather than “11 years learning product experience”.
- Proposed products/projects to emphasize:
  - Mythic GME Mobile (Flutter; features include scene mgmt, adventure logs, markdown, spell-check, dice roller, custom tables; accessibility emphasis).
  - Mythic GME Digital (desktop, distributed via itch.io and Microsoft Store).
  - Mentions a photography site (jasonholtphotography.com) and possibly an AI chat platform (doc explicitly suggests omitting if it overstates current work).
- Education claim: ongoing M.Sc. in Computational Linguistics at University of Stuttgart (start Oct 2025).
- Internal tension to resolve:
  - The doc both (a) recommends keeping “85% retention” (with definition) and (b) later claims that “400% growth”, “4.8/5 stars” and “85% retention” cannot be independently verified and should be omitted in favor of app store metrics. We should decide a single policy and apply it consistently.


## Open Questions (to answer during discovery)
- Target role/title(s) and audience (see `task_plan.md`).
- Voice/tone (first-person vs third-person).
- Whether to include specific outcomes/metrics (and what evidence exists).
-
## Remaining Open Questions (to finalize copy without overreach)
1. For **Avg MAU (last 90 days)**: what number should we publish, and what exact definition do you mean?
   - Option 1: “Average of daily *trailing-30-day* MAU over the last 90 days”
   - Option 2: “Average monthly active users across the last 3 months”
2. Do you want to keep “AVAILABLE FOR HIRE” as-is, or change to “Open to full-time / contract / internships”?
3. AI platform case study: what do you want to call it publicly?
   - “Private LLM Chat Platform (LibreChat)”
   - “Self‑Hosted LLM Workspace for Coursework”
   - “LibreChat on Azure (RAG + document workflows)”
4. Model list mismatch to resolve before publishing exact names:
   - `/Users/jholt/Documents/librechat-setup/README.md` mentions GPT‑5.1 + Claude
   - `/Users/jholt/Documents/librechat-setup/configs/librechat.yaml` includes GPT‑5.2 variants and does not appear to include Claude models
   Which is current?

## “Lighter / simpler” homepage candidates found in this repo
- `flutter/index.html` appears to be a Flutter-first, simpler design variant (neon accent, minimal sections).
- `frontend/index.html` appears to be a web/Next.js-first variant, with a separate `frontend/content_strategy.md` that explicitly prioritizes web.
- I did not find any other alternate homepages in this repo beyond those (and `test-system` does not appear in git history here).

## Photography site case study facts (from `/Users/jholt/development/jhp-next`)
- Stack: Next.js 14 App Router + TypeScript + Tailwind + shadcn/ui.
- Integrations: TidyCal API, Formspark, Cloudflare Turnstile.
- Deployment: Docker image built from `Dockerfile.prod`, pushed to Azure Container Registry, deployed to Azure Container Apps via GitHub Actions.
- Azure notes worth capturing as “lessons learned” (without publishing IDs): linux/amd64 builds on Apple Silicon; ACR + Container App + managed identity with AcrPull; env var handling via GitHub secrets/vars.

## Case studies now in this repo
- LibreChat / Azure AI Foundry: `case-study-llm-chat-platform.html`
- Jason Holt Photography / Next.js + Azure Container Apps: `case-study-photography-azure.html`

## Proposed homepage re-org (Flutter-first, fewer items)
Suggested top-level order:
1. Hero (Flutter/Dart + CompLing M.Sc.)
2. Products (Mythic apps) — primary
3. Case Studies (LibreChat, Photography) — secondary but high-signal
4. Skills/Stack (Flutter/Dart first; Python/NLP + Azure next; web last)
5. Education + credentials
6. Connect

## Proposed Positioning (draft options — pick one)
### Option A (Product + Flutter first)
**“Cross-Platform Product Engineer (Flutter/Dart) — Learning Products + NLP”**
- Use when you want the site to read primarily as a product-focused engineer who ships apps.

### Option B (Educator-to-builder story)
**“Product Developer — Former CS Educator — Flutter/Dart + Learning Design”**
- Use when you want hiring managers to immediately “get” the teaching → product advantage.

### Option C (NLP/Computational linguistics forward)
**“Software Engineer — Flutter/Dart — Computational Linguistics (M.Sc.)”**
- Use when you want to attract NLP-adjacent roles/research-friendly teams.

## Decisions (confirmed by Jason)
- Primary positioning: **Product Engineer — Flutter/Dart Cross‑Platform — CompLing M.Sc.**
- Audience priority: **Hiring managers/recruiters first**, others secondary.
- Voice: **First-person**.
- Availability: keep open (full-time/contract/part-time/internships).
- Metrics policy:
  - **Drop retention**.
  - Use **Avg MAU (last 90 days)** with footnote: “*MAU = Monthly Active Users”.
- AI platform / “Private AI Chat App”:
  - Keep as a **case study**, focused on deployment/ops + learnings.
  - List exact models configured (all via Azure AI Foundry) as an appendix/detail, not as the headline value proposition.

## Draft Copy: Hero (proposal)
- Headline (H1 / short title):
  - **Product Engineer — Flutter/Dart Cross‑Platform — M.Sc. Computational Linguistics**
- Subhead (1 sentence, first-person):
  - “I build and ship cross‑platform products with Flutter/Dart, and I’m completing an M.Sc. in Computational Linguistics (Oct 2025 → Summer 2027).”
- “What I’m focused on” (optional 2nd sentence):
  - “Right now I’m focused on mobile product engineering, accessibility, and practical NLP/LLM integrations.”

## Draft Copy: Metrics (proposal)
Replace retention with MAU and keep everything definition-safe.
- Card: **Avg MAU (last 90 days)\*** (number TBD)
- Footnote: “\*MAU = Monthly Active Users.”
- Optional clarity line (if you want to be extra precise): “Avg MAU is averaged across the last 90 days.”

## Evidence Rules (recommended)
| Claim Type | Examples | Allowed on homepage? | How to phrase |
|-----------|----------|----------------------|---------------|
| Public-verifiable | App store ratings/downloads, certifications, degree enrollment, public OSS PRs | Yes | Include a date (“as of Jan 2026”) or avoid over-precision. |
| Internally verifiable | MAU/retention, funnel conversion, revenue | Optional | Only publish if you can define it (metric definition + time window) and you’re comfortable sharing. |
| Qualitative, defensible | “Accessibility-first UI”, “feedback-driven roadmap”, “shipped cross-platform” | Yes | Tie to concrete work (“in Mythic GME apps…”) and avoid absolute claims. |
| High-risk / ambiguous | “production AI platform” without public proof; named LLM counts/models | Usually no | Move to a case study page or reframe as a scoped internal tool/prototype. |

## Section-by-Section Update Map (planning)
| Section | Current emphasis (site) | Recommended change | Evidence needed |
|--------|--------------------------|-------------------|----------------|
| Meta/title/schema | Front-end lead + Next.js | Align title/description/schema with chosen positioning (A/B/C) | None (just consistency) |
| Hero | Next.js + “11 years” | Replace subhead + blurb to match current focus (Flutter/apps + educator background + NLP if desired) | None beyond your own background |
| Metrics | 400% growth, 85% retention, 11 yrs | Either (1) replace with public store metrics, or (2) keep analytics metrics with definitions/footnotes | Analytics or store screenshots |
| Skills | Mixed; includes Flutter + AI tools | Reorder to put Flutter/Dart + product/analytics + NLP tooling where true; demote “Next.js production” if not primary | None |
| Experience | Includes AI platform details | Keep app/product bullets; tighten metrics; move/remove AI platform unless you can scope it clearly | Internal notes or public proof |
| Portfolio | Includes “Private AI Chat App” | Make Mythic apps the hero projects; consider a separate “case studies” section for AI platform | Links/screenshots |
| Education | Stuttgart M.Sc. in progress | Ensure dates are accurate; keep concise; align with positioning | CV/enrollment proof |
| Connect | “Available” | Keep if true; adjust CTA language to match goals (hire, product collab, speaking) | None |

## Candidate Claim Inventory (to fill)
<!-- As we read `docs/professional_inventory_update.md`, capture potential claims here in a structured way:
| Claim | Evidence available? | Risk (NDA/overstatement) | Safer phrasing |
|------|---------------------|--------------------------|----------------|
-->
| Claim | Evidence available? | Risk (NDA/overstatement) | Safer phrasing |
|------|---------------------|--------------------------|----------------|
| Builds official Mythic GME companion apps under license/partnership | App store listings? publisher pages? agreement? | Medium (licensing wording) | “Builds the official companion apps for Mythic GME (2e) in partnership with Word Mill Games.” |
| App ratings (Apple ~4.7/5; Google Play ~4.9/5) | Public app stores | Low | Cite store ratings with date captured. |
| User growth (350 → 1,600 MAU) | Analytics screenshots/export | Medium | “Grew active user base (MAU) from ~350 to ~1,600 (internal analytics).” (only if you’re comfortable publishing) |
| Retention ~85% | Analytics definition needed | Medium | “Strong returning-user rate (define exactly), tracked via analytics.” |
| 9 years teaching CS/digital design | Resume/LinkedIn | Low | “9 years teaching computer science and digital design.” |
| M.Sc. Computational Linguistics (Oct 2025–) | Enrollment evidence / CV | Low | “M.Sc. Computational Linguistics (University of Stuttgart, started Oct 2025).” |
| “60%+ of improvements driven by user feedback” | Issue tracker/board analytics? | Medium | “Many improvements are feedback-driven (Discord + feature board).” |
| Built `jasonholtphotography.com` with custom gallery + booking | Public website / repo? | Low–Medium (client/vendor details) | “Built a photography portfolio with custom gallery and booking workflow.” |
| Contributor to Shorebird / `icloud_storage_plus` | GitHub profile / PRs | Medium (specificity) | “Contributed to Flutter ecosystem packages (e.g., Shorebird, `icloud_storage_plus`).” |
| Deployed “production AI chat platform” | Repo/deployment proof? | High (overstatement + ambiguity) | Only include if you can state what it is, who it serves, and its current status; otherwise omit or reframe as “prototype/experiment”. |

## High-Risk / Needs Confirmation (specific current wording)
- AI chat platform claim currently includes:
  - Azure stack specifics (VM, Blob Storage, AI Search)
  - “7 LLM integrations”
  - Model names including “GPT-5.1” and “Claude”
  - RAG/semantic search and “142 documents” indexing (in printable resume area)
  - “200+ beta testers” and use of Firebase Analytics
- These may be true, but they’re easy to overstate accidentally; recommend either (a) adding proof points and precise scope or (b) removing from homepage and keeping as a private talking point / interview narrative.

## LibreChat AI Platform: What It Actually Is (from local `/Users/jholt/Documents/librechat-setup/README.md`)
- This appears to be an **ops/config “source of truth”** for a **self-hosted LibreChat deployment** on an Azure VM, with a documented production date (late Nov 2025).
- Strength signal: demonstrates real-world **deployment + operations** (Docker Compose, SSL/domain ops, OAuth, cost/usage reporting scripts, file storage, RAG, OCR, etc.).
- Risk signal (for public website copy): “production AI platform” can read like you built the app from scratch; safer to state “Deployed and operated a private LibreChat instance…” and then list what you configured/automated.
- Another risk signal: listing specific model names/counts is fragile and can look like marketing; better to summarize as “multi-provider LLM configuration” unless the audience needs details.
- Security note in that repo explicitly states secrets are committed to a private repo; for a hiring manager audience, don’t mention that practice on the website (and ideally migrate secrets to a manager like Key Vault).

## AI Platform: Recommended public phrasing (hiring-manager friendly)
- Avoid: “Production AI platform… 7 LLMs…”
- Prefer:
  - “Deployed and operated a private, self-hosted LLM chat platform (LibreChat) on Azure AI Foundry, used by a small group for coursework and experimentation with RAG and document search.”
  - “Built deployment/runbooks + automation around auth, storage, RAG ingestion, and cost/usage reporting.”
- If you want one crisp value statement: emphasize **ops + architecture** (“I can run it”), not model count (“I can list it”).

## AI Platform: Configured models (from `/Users/jholt/Documents/librechat-setup/configs/librechat.yaml`)
Confirmed: `configs/librechat.yaml` is the source of truth; the repo `README.md` is out of date (Claude was tested previously but is not in the current config).

Models seen in `configs/librechat.yaml`:
- gpt-5.2-chat
- gpt-5.2
- gpt-5.2-codex
- gpt-5-pro
- gpt-5-mini
- Mistral-Large-3
- mistral-medium-2505
- DeepSeek-R1-0528
- MAI-DS-R1
- Kimi-K2-Thinking

Related (non-chat) models also present:
- gpt-image-1
- mistral-document-ai-2505 (OCR)
- whisper
- tts-1-hd / tts-hd

## Jason Holt Digital site: Public-facing proof points (from `jasonholtdigital.com`)
- Site positions the Mythic apps as **official/licensed** companion apps and links to platform downloads.
- The page includes structured data with an **aggregate rating value** (worth double-checking that the count/value reflect the real stores and aren’t placeholders).
- Footer/social links reinforce a “community + product” story (GitHub link, Discord, feedback board).

## Current Site: Education/Credentials Snapshot
- Education blocks include:
  - “University of Stuttgart — M.Sc. in Computational Linguistics” (In Progress, Expected 2027).
  - “UT Arlington — B.A. in Linguistics (Cum Laude) | B.A. in French” (Class of 2012; GPA 3.475).
- Certifications shown include AWS Cloud Practitioner, Scrum.org PSM, and Adobe Certified Pro (plus others further down the section).
- “Global & Technical Context” includes language proficiency claims and an open-source contribution claim.
