# Case Study Outline: Jason Holt Photography (Next.js + Azure Container Apps)

## Goal
Describe this project as a professional case study in:
1) Building a client-facing photography portfolio/booking site for a side gig
2) Deploying and operating a production web app on Azure (ACR + Container Apps)
3) AI-assisted “vibe coding” responsibly (Cline + Sonnet 3.7), without hype

## 1) Summary (3–5 sentences)
- What it is:
- Who it serves:
- What you owned end-to-end:
- Why it matters to a hiring manager:

## 2) What I built
Keep this concrete and user-facing:
- Galleries (masonry layout / lightbox)
- Booking flow (TidyCal)
- Contact form (Formspark + Turnstile)
- SEO + performance work (metadata, image optimization)

## 3) Tech stack
- Next.js 14 (App Router), TypeScript, Tailwind, shadcn/ui
- Deployment: Docker image, Azure Container Registry, Azure Container Apps
- CI/CD: GitHub Actions

## 4) Azure architecture (high-level, no sensitive IDs)
- ACR + Container App (external ingress on port 3000)
- Managed identity with AcrPull for secure image pulls
- Env vars managed via GitHub secrets/vars
- Note about Apple Silicon: build for linux/amd64

## 5) AI-assisted development (Cline + Sonnet 3.7)
Make it credible:
- Where AI helped (rapid iteration, scaffolding, refactors)
- Where you verified manually (SEO, deployment, security posture, runtime correctness)
- Guardrails you used to avoid “hallucinated” changes

## 6) Learnings
5–8 bullets. Examples:
- Containerizing Next.js changes debugging/deployment tradeoffs.
- Linux/amd64 build targets matter on Apple Silicon.
- “Production” means repeatable deploys, secrets hygiene, and observability.

## Sources in local repo
- `/Users/jholt/development/jhp-next/docs/AZURE-DEPLOYMENT-GUIDE.md`
- `/Users/jholt/development/jhp-next/README.md`
- `/Users/jholt/development/jhp-next/Dockerfile.prod`
- `/Users/jholt/development/jhp-next/.github/workflows/*` (CI/CD)

