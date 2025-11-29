# AI Coding Agent Instructions

## Project Overview
This is Jason Holt's interactive resume/portfolio site hosted on GitHub Pages at `jasonholt.dev`. It's a static site with no build step—everything runs via CDN dependencies.

## Architecture

### No Build Pipeline
- **Tailwind CSS via CDN**: Configured inline with `tailwind.config` in `<script>` tags (see `index.html` lines 107-125)
- **No npm/node**: Zero build step. Just open HTML files directly or use `python3 -m http.server 8000`
- **Dependencies via CDN**: Chart.js, Marked.js, html2pdf.js, Google Fonts

### File Structure
| Path | Purpose |
|------|---------|
| `index.html` + `main.js` + `styles.css` | Main portfolio site |
| `chat/index.html` | BinaryLoom AI chat landing page |
| `prototype/` | Alternate portfolio design with distinct styling |
| `privacy/`, `terms/` | Legal pages |

### Gemini AI Integration
The AI "Fit Analyzer" in `main.js` uses a locked Gemini API key (domain-restricted). The `resumeContext` constant (lines 37-100) contains comprehensive resume data used for AI prompts.

## Design Conventions

### Color Palette (Main Site)
- **Brand color**: `#6366f1` (indigo-500) with lighter/darker variants
- **Background**: Radial gradient from `slate-900` → `slate-950` → `black`
- **Custom colors**: Extended in inline Tailwind config (`slate-850`, `brand-400/500/600`)

### Visual Patterns
- **Glassmorphism**: `.glass-panel` class uses `backdrop-filter: blur(16px)` with semi-transparent backgrounds
- **Typography**: `Inter` for body, `Sora` for headings (`.font-display`)
- **Animations**: Custom keyframes in `styles.css` for scroll reveals, gradients, and soft pulse effects

### Prototype Variant (`/prototype/`)
Uses different design system: charcoal + neon green palette, `Fira Code` for monospace, CSS custom properties for accent colors

## Existing Cursor Rules
The `.cursor/rules/` directory contains design philosophy that applies project-wide:
- **Purposeful Layout**: 60/40 asymmetric splits, size dominance for hierarchy
- **Distinctive Color**: Commit to dominant color (70/20/10 rule), avoid generic palettes
- **Pragmatic Systems**: Monolith first, synchronous first, optimize when it hurts
- **UX Patterns**: Inline editing, smart defaults, reversible actions over confirmation dialogs
- **Documentation**: Quick start first, show then explain, scannable structure

## SEO & Social
- Comprehensive Open Graph and Twitter Card meta tags
- JSON-LD structured data for Person and WebSite schemas
- `CNAME` file routes to custom domain `jasonholt.dev`
- `sitemap.xml` and `robots.txt` present
## Principles
Use the following design principles from the `.cursor/rules/` directory:
  .cursor/rules/design-pragmatic-systems.mdc
  .cursor/rules/use-distinctive-color.mdc
  .cursor/rules/use-purposeful-layout.mdc
  .cursor/rules/ux-patterns.mdc
  .cursor/rules/write-clear-documentation.mdc
## Development Workflow
```bash
# Local preview
python3 -m http.server 8000

# Then visit http://localhost:8000
```

No linting, testing, or CI/CD pipelines exist. Changes deploy automatically via GitHub Pages on push to `main`.
