# Prototype 2: Technical / Flutter Focus

This prototype explores a "Technical/Precise" design aesthetic, focusing specifically on Jason Holt's experience as a Flutter Engineer.

## Design System

- **Palette**: Charcoal (`#18181b`) + Neon Green (`#ccff00`). High contrast, dark mode only.
- **Typography**: `Inter` for body copy, `JetBrains Mono` for code and technical details.
- **Layout**: Asymmetric 60/40 split in the hero section. Grid-based project layout with size hierarchy (1 large feature, 2 smaller supporting).
- **Vibe**: Professional, code-centric, performant.

## Key Features

- **Code Window Visualization**: A CSS-styled code editor in the hero section showing a "Flutter Widget Tree" representation of the portfolio itself.
- **Tech Stack Marquee**: A grayscale-to-color hover effect for technology icons.
- **Scroll Animations**: Elements reveal themselves with a subtle slide-up and fade-in effect using Intersection Observer.
- **Responsive Design**: Fully responsive layout using Tailwind CSS.

## How to Run

Since this project uses Tailwind via CDN (Play CDN), there is no build step required.

1.  Navigate to this folder in your terminal.
2.  Run a local server (e.g., `python3 -m http.server 8000`).
3.  Open `http://localhost:8000/prototype/prototype_2/` in your browser.

## File Structure

- `index.html`: Main structure and content.
- `styles.css`: Custom animations and utility overrides.
- `main.js`: Interactivity (mobile menu, typing effect, scroll observer).
