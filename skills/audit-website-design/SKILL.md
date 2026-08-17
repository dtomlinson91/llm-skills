---
name: audit-website-design
description: Performs a comprehensive design and technical audit of a website URL. Extracts layout, typography, colors, components, animations, spacing, tech stack, SEO metadata, and brand voice into a detailed reference document for replicating design decisions. Use when analyzing or auditing a website's design.
disable-model-invocation: true
allowed-tools: WebFetch Bash(curl *)
argument-hint: [url]
effort: high
---

# Website Design Audit

Audit the website at `$ARGUMENTS` and produce a comprehensive design reference document tha㌳t an engineer or LLM can use to replicate the site's design decisions.

## Extraction strategy

Gather data through multiple passes, then compile into the final report.

### Pass 1: Raw HTML source

Fetch the page source for technical and structural metadata:

```bash
curl -sL -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" "$URL"
```

If the output is very large, pipe through `head -1500` to capture `<head>` and initial `<body>`. If curl returns a Cloudflare challenge or empty body, note this and rely more on WebFetch in Pass 3.

Extract from HTML:
- `<title>`, `<meta name="description">`, Open Graph tags (`og:*`), favicon, canonical URL
- Font imports: Google Fonts `<link>` URLs, Adobe Fonts/Typekit embeds, `@font-face` declarations
- Stylesheet `<link>` URLs (needed for Pass 2)
- `<script>` tags: framework bundles, analytics, third-party libraries
- **Framework markers**: `__next` / `__NEXT_DATA__` (Next.js), `__nuxt` (Nuxt), `data-reactroot` (React), `ng-` attributes (Angular), `astro-island` (Astro), Svelte markers
- **CSS framework signals from class names**: Tailwind utilities (`flex`, `px-4`, `text-lg`, `bg-`), Bootstrap (`col-`, `btn-`, `container`, `row`), or custom BEM/semantic classes
- Heading hierarchy: all `<h1>` through `<h6>` elements
- Structural elements: `<header>`, `<nav>`, `<main>`, `<section>`, `<aside>`, `<footer>` — note nesting and order
- Hosting hints: `<meta name="generator">`, `_next/`, `_nuxt/`, `.netlify/`, Vercel deployment markers

### Pass 2: Stylesheet analysis

Fetch the primary stylesheet(s) identified in Pass 1 (limit to the 2-3 most relevant). Skip this pass if the site uses only utility CSS (Tailwind) with no meaningful standalone stylesheet, or if no stylesheet URLs were found.

```bash
curl -sL "$CSS_URL"
```

Extract:
- **CSS custom properties** (`:root` block): `--color-*`, `--font-*`, `--spacing-*` etc. These are the design tokens and the highest-value extraction target
- **Colors**: All hex/rgb/hsl values. Group by role: primary, secondary, accent, backgrounds, text, borders
- **Typography**: `font-family` stacks, `font-size` scale, `font-weight` values, `line-height`, `letter-spacing`, `text-transform`
- **Spacing**: Recurring `padding`, `margin`, `gap` values. Identify the base unit and scale
- **Border radius**: Common values (e.g., `4px`, `8px`, `9999px` for pills)
- **Shadows**: `box-shadow` definitions for cards, buttons, modals, dropdowns
- **Breakpoints**: `@media` query values, ordered by size
- **Transitions & animations**: `transition` properties, `@keyframes` names, durations, easing functions
- **Layout constraints**: `max-width` on containers, grid template definitions
- **Gradients**: `linear-gradient`, `radial-gradient` definitions with colors and direction

If CSS is minified and extremely large (>50KB), focus on CSS custom properties (`:root`), `@media` queries, and `@keyframes` definitions.

### Pass 3: Visual and content analysis

Use WebFetch to analyze the rendered page for qualities not extractable from source alone. Make one or two WebFetch calls with focused prompts covering:

- Overall visual style, mood, and emotional impression
- Layout pattern and visual hierarchy (what draws the eye 1st, 2nd, 3rd)
- Header/nav style and behavior (sticky, transparent, hamburger, mega-menu)
- Footer style and content
- Section separation technique (color shifts, cards, dividers, whitespace)
- Imagery style (photography, illustration, icons) and treatment (filters, overlays, shapes)
- Button styles: shape, sizes, fill/outline/ghost variants, CTA wording examples
- Card patterns: shadow, border, radius, hover behavior
- Other components: forms, modals, badges, accordions, tables, testimonials, pricing
- Animation and interaction hints (scroll effects, hover states, page transitions)
- Copy tone and brand voice (casual, formal, playful, authoritative)
- Social proof elements (logos, testimonials, stats, trust badges)
- Whitespace density (tight/dense or open/airy)
- Anything unconventional, creative, or standout

### Pass 4: Compile the report

Merge all findings into the structured template in [TEMPLATE.md](TEMPLATE.md). Save as `style-ref-[domain].md` in the current working directory (e.g., `style-ref-stripe-com.md`).

## Output rules

- **Use exact values**: hex codes, px/rem sizes, font names as CSS values, not vague descriptions
- **Mark unknowns**: Write `[Not determinable from source]` if something cannot be confirmed. Do not guess
- **Include both value and context**: e.g., `**Primary color**: #635BFF (vibrant purple) -- used for CTAs and interactive elements`
- **Stay factual**: Report what is observed, not what is assumed
- **Keep entries scannable**: Use `**Label**: value` format on bullet points
- **Omit empty sections**: If a section has nothing to report (e.g., no dark mode, no sidebar), write a single line noting this rather than leaving placeholders unfilled
- **Paste relevant CSS custom properties verbatim**: If the site defines design tokens in `:root`, include them in the Color Palette section as a fenced code block
