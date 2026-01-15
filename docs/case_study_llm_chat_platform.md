# Case Study Outline: Private LLM Chat Platform (LibreChat) on Azure AI Foundry

> Goal: Make this read as **engineering maturity** (shipping + operating) rather than “AI hype”.
> Keep it honest: small-group usage is still “production” if it’s reliably used by real people, but don’t imply mass scale.

## 1) Summary (3–5 sentences)
- What it is (1 sentence):
- Who it’s for (1 sentence):
- What you owned (1–2 sentences: deployment/ops/config/automation):
- What you learned (1 sentence):

## 2) Problem / Why I built it
- What problem existed for you + classmates:
- Why LibreChat (vs building from scratch):
- Key constraints: time, budget, privacy, document workflow, uptime expectations:

## 3) Scope & non-goals (truth guardrails)
- In scope:
- Explicitly not in scope (examples):
  - “This is not an LLM model-building project.”
  - “Model count is not the goal; reliable workflows are.”

## 4) Architecture (high level)
Write this as a diagram-in-words. Example structure:
- **Compute:** Azure VM running Docker Compose (LibreChat + services)
- **AI provider:** Azure AI Foundry for model access
- **Storage:** Azure Blob Storage for files
- **Database:** MongoDB Atlas for app data
- **RAG layer:** document uploads + vector search (describe where embeddings live, if you know)
- **Auth:** OAuth providers used (GitHub/Google) + any bot protection
- **Operations:** deploy scripts/runbooks, backups, monitoring/cost reports

## 5) What I built / configured (your contributions)
Pick 6–10 bullets; each should start with a strong verb:
- Deployed…
- Automated…
- Configured…
- Documented…
- Hardened…
- Implemented cost monitoring by…

## 6) RAG/document workflow (what makes it useful)
- How documents get in:
- How search happens (high level):
- What “good” looks like for your group:

## 7) Reliability, security, and cost (what a hiring manager wants)
- Reliability:
  - Deploy process:
  - Rollback story:
  - Backups story:
- Security (keep high-level; don’t expose internals):
  - Secret management approach (and what you’d improve next):
  - Access control:
- Cost:
  - What you monitor:
  - What you changed to control costs:

## 8) Learnings (this is the heart of the case study)
Write 5–8 “I learned…” bullets. Examples:
- Ops is product work: docs/runbooks reduce downtime.
- RAG quality depends more on ingestion/chunking/metadata than model selection.
- Small-group “production” still needs guardrails (auth, backups, rate limits).

## 9) What I’d do next
- Short list (3–6 bullets), prioritized:

## Appendix A: Configured models (optional, “as of <DATE>”)
If you include this, date-stamp it and keep it as a factual list, not a selling point.

Configured chat models (from `/Users/jholt/Documents/librechat-setup/configs/librechat.yaml`, confirm current):
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

Supporting models:
- gpt-image-1 (image generation)
- mistral-document-ai-2505 (OCR)
- whisper (speech-to-text)
- tts-1-hd / tts-hd (text-to-speech)

> If you want, we can also group them by “capability” (chat / coding / reasoning / OCR / speech) instead of vendor branding.

