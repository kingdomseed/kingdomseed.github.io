# Task Plan: Site re-organization + Flutter-first positioning + case studies

## Goal
Re-organize the site so it clearly reads “Flutter/Dart cross-platform product engineer + CompLing M.Sc.” first, reduces inconsistencies, and supports a small set of high-signal case studies (LibreChat on Azure AI Foundry, and Jason Holt Photography on Next.js + Azure Container Apps).

## Current Phase
Phase 3

## Phases

### Phase 1: Inventory & Recovery
- [x] Inventory existing homepage variants in this repo
- [x] Identify “lighter/simpler” design candidate(s) to reuse
- [x] Determine what was removed (and whether recoverable via git)
- **Status:** complete

### Phase 2: Case Studies Content Extraction
- [x] Summarize LibreChat case study scope + boundaries
- [x] Extract Jason Holt Photography case study facts from `/Users/jholt/development/jhp-next`
- [x] Decide what details must stay private (IDs, secrets, infra specifics)
- **Status:** complete

### Phase 3: Flutter-First Information Architecture
- [ ] Define homepage sections and ordering
- [ ] Define what is “secondary” (Next.js/Astro/web) vs primary (Flutter)
- [ ] Decide how many projects to feature (goal: fewer, higher signal)
- **Status:** in_progress

### Phase 4: Implementation
- [ ] Update homepage layout + navigation for new IA
- [ ] Add/refresh case study pages and link them from homepage
- [ ] Remove or archive outdated prototype pages if needed
- **Status:** pending

### Phase 5: QA & Delivery
- [ ] Consistency pass (copy, dates, metrics, labels, links)
- [ ] Mobile/desktop smoke test
- [ ] Deploy checklist (cache busting, broken links)
- **Status:** pending

### Phase 5: Delivery
- [ ] Present an edit list (what to change, where, and why)
- [ ] Provide final copy blocks ready to paste
- [ ] Call out any remaining open questions for you to decide
- **Status:** pending

## Key Questions
1. Which existing design variant should become the new base? (`flutter/index.html`, `frontend/index.html`, or current root `index.html`)
2. Should homepage showcase “Products” (Mythic apps) separately from “Case Studies” (LibreChat, Photography)?
3. Which web projects should remain on the homepage (if any), given Flutter-first emphasis?
4. What level of infrastructure detail is acceptable in public case studies?

## Decisions Made
| Decision | Rationale |
|----------|-----------|
| Flutter-first positioning | Aligns homepage with your primary shipping work. |
| Case studies over “visit platform” links | Avoids dead ends and lets you explain scope + learnings honestly. |
| Photography site as case study | Highlights both “vibe coding” process and Azure container deployment. |

## Errors Encountered
| Error | Attempt | Resolution |
|-------|---------|------------|
|       | 1       |            |
