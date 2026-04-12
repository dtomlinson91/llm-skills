# Design Audit: [Site Name]

**URL**: [full URL]
**Date audited**: [YYYY-MM-DD]
**Domain**: [domain]

---

## 1. Overall Impression & Identity

- **Visual style/mood**: [e.g., minimal, playful, corporate, brutalist, luxury, tech-forward]
- **Target industry/niche**:
- **Emotional response on first load**:
- **Unifying design concept/theme**:
- **One-sentence summary**:

---

## 2. Layout & Structure

- **Layout pattern**: [single column, multi-column, grid-based, asymmetric]
- **Max content width**: [e.g., `1200px`, `1440px`, full-bleed]
- **Whitespace approach**: [tight/dense or generous/airy]
- **Section structure**: [how the page is divided into blocks]
- **Header**: [sticky/fixed, transparent, navigation type, height]
- **Footer**: [fat with columns, minimal, CTA-focused]
- **Sidebar**: [yes/no, position]
- **Content containment**: [cards, dividers, background color shifts, borders]
- **Grid system**: [12-col, CSS Grid, masonry, Flexbox, custom]
- **Full-width vs boxed sections**: [pattern]
- **Visual hierarchy**: [what draws eye 1st -> 2nd -> 3rd]

---

## 3. Typography

- **Primary heading font**: [name, weight, style]
- **Body font**: [name, weight, style]
- **Accent/display fonts**: [name — if any]
- **Font pairing strategy**: [e.g., serif + sans-serif, mono + sans]
- **Font delivery method**: [Google Fonts URL / Adobe Fonts / self-hosted]
- **Heading sizes**:
  - H1: [size, weight]
  - H2: [size, weight]
  - H3: [size, weight]
  - H4-H6: [sizes if used]
- **Body text**: [size, line-height]
- **Letter spacing**: [notable values and where applied]
- **Text transform**: [uppercase headings, small-caps, etc.]
- **Font weights used**: [list: light/regular/medium/semibold/bold/black]
- **Link styling**: [color, underline, hover behavior]
- **Text alignment patterns**: [left-aligned body, centered headings, etc.]
- **Emphasis conventions**: [bold for X, italic for Y]
- **Responsive font scaling**: [approach if identifiable — fluid clamp(), breakpoint steps]

---

## 4. Color Palette

- **Primary brand color**: [hex — description and usage]
- **Secondary color(s)**: [hex — description and usage]
- **Accent/highlight color(s)**: [hex — description and usage]
- **Background colors**:
  - Main background: [hex]
  - Alternating sections: [hex values]
  - Card/surface: [hex]
- **Text colors**:
  - Headings: [hex]
  - Body text: [hex]
  - Muted/secondary text: [hex]
- **Link colors**: [default hex, hover hex, visited if different]
- **Border/divider colors**: [hex values]
- **Gradients**: [full CSS value — colors, direction, where applied]
- **Dark mode**: [supported yes/no — if yes, list key dark palette values]
- **Contrast notes**: [any accessibility observations]
- **Section separation via color**: [how alternating backgrounds create rhythm]

### CSS Custom Properties

```css
/* Paste relevant :root custom properties here */
```

---

## 5. Imagery & Media

- **Photography style**: [lifestyle, abstract, product shots, editorial, AI-generated]
- **Image treatment**: [filters, overlays, duotone, B&W, rounded corners, masks]
- **Illustration style**: [flat, 3D, hand-drawn, isometric — if used]
- **Icon style**: [outlined, filled, duotone, custom]
- **Icon library**: [Heroicons, Lucide, FontAwesome, Phosphor, custom SVGs — if identifiable]
- **Icon size and stroke weight**: [if determinable]
- **Video usage**: [hero background, embedded, autoplay, none]
- **Image formats**: [WebP, AVIF, SVG, PNG, JPG]
- **Common aspect ratios**: [16:9, 4:3, 1:1, etc.]
- **Image masking/cropping**: [circles, rounded rects, blobs, custom shapes]
- **Decorative elements**: [blobs, patterns, grain/noise, geometric shapes, lines]
- **Favicon**: [style description]

---

## 6. Components & UI Patterns

### Buttons

- **Shape/border-radius**: [value — rounded, pill `9999px`, square]
- **Sizes**: [small, medium, large — dimensions if determinable]
- **Variants**: [filled, outline, ghost, text-only]
- **Padding**: [value if determinable]
- **Hover state**: [color shift, shadow, scale, underline, etc.]
- **CTA examples**: [exact button text observed, e.g., "Get Started", "Try Free"]

### Cards

- **Shadow**: [box-shadow CSS value]
- **Border**: [color, width, style]
- **Border radius**: [value]
- **Padding**: [value]
- **Background**: [color]
- **Hover behavior**: [lift, glow, border change, shadow increase]

### Navigation

- **Desktop style**: [horizontal links, dropdowns, mega-menu, tabs]
- **Mobile pattern**: [hamburger, bottom nav, slide-out drawer]
- **Active state**: [underline, color, background, bold]
- **Breadcrumbs**: [yes/no, style]

### Forms

- **Input style**: [border color/width, background, height/padding, border-radius]
- **Labels**: [floating, above input, inline, placeholder-only]
- **Focus state**: [border color, shadow, outline]
- **Validation style**: [inline error, color change, icon]

### Other Components

- **Modals/dialogs**: [overlay color, border-radius, animation, backdrop blur]
- **Badges/tags/pills**: [colors, size, border-radius]
- **Tooltips**: [style, trigger method]
- **Tables**: [style, striped rows, borders]
- **Accordions/tabs**: [style, transition, indicator]
- **Testimonials/reviews**: [layout — carousel, grid, single quote, avatar usage]
- **Pricing tables**: [layout, toggle, feature comparison style]
- **Progress indicators**: [bars, steps, percentages, dots]
- **Alert/notification bars**: [top banner, toast, inline, colors]

---

## 7. Animation & Interaction

- **Page load**: [fade-in, stagger, skeleton loaders, none]
- **Scroll-triggered**: [parallax, reveal on scroll, slide-in, fade-up]
- **Hover effects**: [links, buttons, cards, images — describe each]
- **Page transitions**: [instant, fade, slide, none]
- **Micro-interactions**: [toggle switches, like buttons, form feedback, copy buttons]
- **Cursor**: [default, custom cursor, pointer changes]
- **Loading states**: [spinner, skeleton, shimmer, progress bar]
- **Easing style**: [snappy/fast, smooth/gentle, bouncy/elastic]
- **Timing**: [typical duration values — e.g., 150ms for hovers, 300ms for reveals]
- **Animation library**: [Framer Motion, GSAP, AOS, Lottie, CSS-only, View Transitions API]
- **Overall feel**: [subtle and polished, dramatic and bold, minimal/none]

---

## 8. Spacing & Rhythm

- **Base spacing unit**: [e.g., 4px, 8px]
- **Spacing scale**: [e.g., 4, 8, 12, 16, 24, 32, 48, 64, 96, 128]
- **Section padding (vertical)**: [typical top/bottom values]
- **Card/grid gap**: [typical values]
- **Heading-to-body margin**: [value]
- **Paragraph spacing**: [value]
- **Overall density**: [tight/compact, balanced, open/spacious]

---

## 9. Responsive & Breakpoints

- **Breakpoint values**: [list all found, e.g., 640px, 768px, 1024px, 1280px]
- **Design approach**: [mobile-first or desktop-first]
- **Layout changes**:
  - Mobile (<768px): [description]
  - Tablet (768-1024px): [description]
  - Desktop (>1024px): [description]
- **Mobile navigation**: [hamburger, bottom nav, slide-out, full-screen overlay]
- **Elements hidden/shown**: [what changes by breakpoint]
- **Typography scaling**: [how sizes change]
- **Grid/image reflow**: [how columns collapse]

---

## 10. Technical Stack

- **CSS approach**: [Tailwind, Bootstrap, custom CSS, CSS Modules, styled-components, Emotion]
- **JS framework**: [React, Next.js, Vue, Nuxt, Astro, Svelte, SvelteKit, vanilla, jQuery]
- **CMS**: [WordPress, Webflow, Sanity, Contentful, Shopify, Strapi — if identifiable]
- **Hosting indicators**: [Vercel, Netlify, AWS, Cloudflare Pages, GitHub Pages]
- **Font delivery**: [Google Fonts (URL), Adobe Fonts, self-hosted]
- **Notable libraries**: [Swiper, Framer Motion, GSAP, Three.js, Lottie, Radix UI, Headless UI]
- **Analytics/tracking**: [Google Analytics, Plausible, Segment, Hotjar, etc.]
- **Performance patterns**: [lazy loading, image optimization (WebP/AVIF), code splitting, prefetching]
- **Build tooling hints**: [Webpack chunks, Vite, Turbopack — from script/asset naming patterns]

---

## 11. SEO & Meta Presentation

- **Page title**: `[exact title text]`
- **Title format pattern**: [e.g., "Page Title — Brand" or "Brand | Page"]
- **Meta description**: `[exact text]`
- **Open Graph tags**:
  - og:title: `[value]`
  - og:description: `[value]`
  - og:image: [URL or description]
  - og:type: [value]
  - twitter:card: [value]
- **URL structure**: [pattern, e.g., `/blog/post-slug`, `/products/category/item`]
- **Heading hierarchy**: [proper H1 -> H2 -> H3 nesting? any issues?]
- **Canonical URL**: [present yes/no, value]
- **Structured data**: [JSON-LD types, microdata — if found]

---

## 12. Brand Voice in Design

- **Copy tone**: [casual, formal, playful, authoritative, witty, technical, empathetic]
- **CTA wording style**: [list examples: "Get Started", "Start Free Trial", "Let's Go"]
- **Text-to-visual ratio**: [text-heavy, visual-heavy, balanced]
- **Social proof usage**: [client logos, testimonials, stats/numbers, trust badges, case studies]
- **Design personality**: [friendly rounded shapes, sharp corporate lines, hand-crafted feel, etc.]

---

## 13. Unique & Standout Features

- [List anything unconventional or signature about this design]
- [Creative uses of scroll, layout, or interaction]
- [Notable "wow" moments or delightful details]
- [What distinguishes this site from generic templates]
