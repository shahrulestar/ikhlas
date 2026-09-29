# Layout

Page-level structure for IKHLAS mobile (Flutter) and web (Next.js). Spacing values map to tokens in [spacing.md](spacing.md). Breakpoints, reflow and compact rules: [Responsive layout](#responsive-layout).

## Mobile anatomy

Design frame: **390 × 844**.

```
Screen (390 × 844)
├── Status bar ............ 44
├── Navbar header ......... 48   (padding 12 / 16; total navbar 92, older screens 86)
├── Body .................. scrolls; horizontal margin 16
│   ├── top spacing 40 below header or tab strip
│   ├── sections, gap 40
│   ├── "End of the section" footer, 60 below last section
│   └── bottom padding 40
├── Sticky CTA (optional) . 16 padding + 48 button, 1px Grey 200 top separator
├── Bottom nav ............ 50   (1px Grey 200 top border)
└── Home indicator ........ 34
```

| Element | Value | Token / note |
|---------|-------|--------------|
| Screen margin | 16 | space16 |
| Gutter | 16 | space16 |
| Content width | 358 | 390 − 16 × 2 |
| Status bar | 44 | — |
| Navbar header | 48, padding 12 / 16 | space12 / space16 |
| Bottom nav | 50 + 34 home indicator | — |
| Top spacing below header | 40 | space40 |
| Between sections / components | 40 | space40 |
| Before "End of the section" | 60 | space60 |
| Scaffold background | Grey 50 `#F9F9F9` or White | — |

When the keyboard is open, a sticky CTA stays pinned directly above the keyboard.

## "End of the section" footer

Every scrolling screen ends with the IKHLAS logo (64 × 20) above the caption "End of the section" (12px Regular, Grey 300 `#E0E0E0`, centred), placed 60px after the last element.

```dart
Column(children: [
  ...sections,
  const SizedBox(height: IkhlasSpacing.space60),
  const IkhlasEndOfSection(), // logo + caption
  const SizedBox(height: IkhlasSpacing.space40),
]);
```

```tsx
<footer className="flex flex-col items-center gap-1 pb-[var(--ikh-space-40)] pt-[var(--ikh-space-60)]">
  <IkhlasLogoMuted className="h-5 w-16" />
  <p className="text-xs leading-[18px] text-[var(--ikh-grey-300)]">End of the section</p>
</footer>
```

## Screen recipes

### Home

```
navbar (Secondary Teal, logo, account/avatar) ........ 92
prayer header (Secondary Teal, full-bleed)
  padding 16 / 16 / 24, gap 16
  clock H1 32 white + countdown 16 white + prayer icon 66
  homepage widget (radius 12)
heading container (Grey 50, top corners radius 12, overlaps header)
  padding 24 vertical, gap 24
  user_greeting_card + refresh icon 24
  product tiles: 4 × icon + label (60 wide), gap 30
content (padding 16 horizontal, sections gap 40)
  section
    header: title_link (H3 20 + chevron 24) / subtitle 16 Grey 700, gap 4
    content: carousel or banner, 16 below header
End of the section
bottom nav (Home active)
```

- Banner slider: 358 × 160, radius 12, page dots 8px (gap 4) below — total height 184.
- Product carousels scroll horizontally, card width 160, gap 16. See [components/product-card.md](components/product-card.md).
- Guest and registered users differ only in greeting text and navbar variant.

### Product landing page (Qurban, Aqiqah, Zakat, Sadaqah)

```
navbar (back, product logo, "Help?" link)
hero banner (full width)
content (padding 16, sections gap 40)
  "Why choose ikhlas.com": USP grid 2 columns (175 × 95, radius 4 legacy / 12 target), gap 8
  secondary button "How it works" (full width)
  action_card check_status ("Status update")
  package sections: header + 2-column product cards
  WhatsApp action card
End of the section
bottom nav
```

"Help?" opens a bottom sheet with "Frequently asked questions" and "Contact IKHLAS" ([components/overlays.md](components/overlays.md)).

### Detail page (2026 pattern)

- Navbar in Secondary Teal with white back / info / settings icons.
- White content sheet with 12px top corners overlapping the navbar colour.
- Content cards: white, 1px Grey 200 border, radius 12, padding 16.
- Event / article detail: H3 title, event card (image, info chips, primary CTA, "About" body 14 Grey 600).

### Checkout

```
navbar (back, "Checkout")
booking summary block (Grey 50, padding 16, gap 16)
  item summary card (white, padding 16, 68px thumbnail radius 4)
  quantity row
form (padding 16, sections gap 40, fields gap 16)
  section title H3 + description 16 Grey 90, gap 4
  text fields, split phone field, stepper, notice, participant accordion, checkboxes
  additional notes (multi-line, 152 tall)
  terms (checkbox + 14 Grey 90)
sticky footer (white, 1px Grey 200 top separator, padding 16)
  total label 14 Medium + info icon 18 / "View Summary" link 14 Medium Primary Teal
  amount: "MYR" 14 Medium + value 24 Medium, right-aligned
  primary CTA full width 358 × 48 ("Pay now")
```

CTA stays disabled until all required fields are valid. Field specs: [components/text-field.md](components/text-field.md).

### Zakat checkout + calculator

Extends the standard checkout recipe. Zakat type is chosen from the checkout dropdown only — not from a separate calculator entry screen.

```
checkout form (no top nav on web; standard navbar on mobile app)
  zakat body, state, type dropdown, year haul
  secondary button_link "Calculate your zakat" directly under Year field
  amount, payer details, terms (same field specs as Checkout)
sticky footer with total + primary CTA ("Pay now")
```

**Calculator sheet** — opened from the secondary link under Year:

| Viewport | Overlay |
|----------|---------|
| Mobile | Bottom sheet ([components/overlays.md](components/overlays.md)) |
| Desktop (≥1024) | Right sheet, width 560–720px |

Sheet content: stacked calculator form + result card. Type in the sheet matches the checkout dropdown selection. Result card shows nisab status, breakdown rows, and zakat due amount. Primary action in sheet applies the calculated amount back to checkout.

Overlay behaviour: [components/overlays.md](components/overlays.md). Form validation: [patterns/forms.md](patterns/forms.md).

### Settings / Account

- Background Grey 50; content padding 16, groups gap 16.
- User info card: avatar 70 (initials), name 16 Medium, loyalty strip (Loyalty Surface `#E9F9FA`), "Powered by" caption.
- Settings groups: white card, 1px Grey 200 border, radius 12, padding 16; group label 14 Grey 600; rows 16 Regular Black + chevron 24; 1px Grey 200 separators. See [patterns/lists.md](patterns/lists.md).
- Footer: app version 14 Grey 600 centred; "Log out" 16 Medium Red.

### Activity listing

- Navbar title "Activity"; horizontal product tab strip (Sadaqah, Zakat, Fidyah, Qurban, Aqiqah, Umrah, Travel) on Grey 50, 56 tall.
- Content starts 40 below the tab strip.
- Empty state: promotional action_card for the selected product, then "End of the section" ([patterns/empty-states.md](patterns/empty-states.md)).

## Responsive layout

Mobile-first. Mobile and tablet grids come from the design system; desktop values come from the web frames (1440 wide, 1024 content column, 1248 banners).

### Breakpoints and grid

| Breakpoint | Width | Design frame | Columns | Gutter | Margin | Content width |
|------------|-------|--------------|---------|--------|--------|---------------|
| mobile | 0–767 | 390 | 4 | 16 | 16 | Fluid (358 at 390) |
| tablet | 768–1023 | 768 | 8 | 16 | 16 | Fluid |
| desktop | 1024–1439 | 1280 | 12 | 24 | 32 min | Max 1024, centred |
| wide | ≥ 1440 | 1440 | 12 | 24 | Auto (208 at 1440) | 1024 content · 1248 banners |

Tailwind defaults already match: base = mobile, `md` = 768, `lg` = 1024, `min-[1440px]` = wide. Flutter uses the same thresholds (see [flutter.md](flutter.md#breakpoints)).

### Spacing per breakpoint

Keep mobile compact; add space only when there is room.

| Rhythm | Mobile | Tablet | Desktop / wide |
|--------|--------|--------|----------------|
| Screen margin | 16 | 16 | 32 min, then centred container |
| Grid / card gap | 16 | 16 | 24 |
| Between sections | 40 | 40 | 60 |
| Section header → content | 16 | 16 | 24 |
| Top spacing below header | 40 (app) · 24 (mobile web) | 32 | 40 |
| Card padding | 16 | 16 | 24 for large feature cards, 16 otherwise |
| End of page | "End of the section" (app) | "End of the section" (app) | Site footer (web) |

### Shell per breakpoint

| Part | Mobile app | Mobile web | Tablet | Desktop / wide |
|------|-----------|------------|--------|----------------|
| Top bar | Navbar 92 (status bar + 48 header) | Sticky web header **56**: logo + menu icon | Web header 66, menu collapsed | Web header 66: logo, menu (gap 24), language, account |
| Primary navigation | Bottom nav 50 + 34 | Hamburger drawer (no bottom nav unless installed as PWA) | Hamburger or inline menu | Inline header menu |
| Page title | Navbar title 16 Medium | H3 20 in page | H2 24 in page | H2 24 (H1 32 for hero pages) |
| Sticky CTA | Bottom sticky footer | Bottom sticky footer | Bottom sticky footer | Inside the right summary panel (no bottom bar) |
| Footer | "End of the section" | Compact site footer (stacked) | Site footer 2 columns | Site footer, padding 208 / 40 at 1440 |

### How sections reflow

| Element | Mobile (4 col) | Tablet (8 col) | Desktop (12 col) |
|---------|---------------|----------------|------------------|
| Hero / banner slider | 358 × 160, radius 12, dots below | Full width, aspect 16:7 | 1248 × 280 (wide) or 1024 × 280, radius 12, arrow controls |
| Prayer header + greeting | Full-bleed teal header, greeting container overlaps | Same, content max 720 centred | Hero card: prayer time (8 col) + greeting & quick tiles (4 col) side by side |
| Icon + label tiles | 1 row of 4, gap 30 | 1 row of 6–8, gap 32 | 8 per row inside the 4-col panel as 4 × 2, or one row of 8 |
| Section header | Title + chevron, subtitle below | Same | Title + subtitle left, "See all" button_link right-aligned |
| Product cards | Horizontal scroll, card 160, gap 16 | Grid 4 per row | Grid 4–5 per row (card ~ 180–224), no horizontal scroll |
| Content / article cards | Horizontal scroll 160 | Grid 3 per row | Grid 4 per row |
| USP tiles | 2 per row | 3 per row | 3 or 6 per row |
| Action cards | Stacked, full width | 2 per row | 2–3 per row, max width 496 each |
| Settings groups | Full width, stacked | Max 600, centred | Side menu (3 col) + groups (max 720) |
| Forms | Single column, full width | Max 560, centred | Max 560; two-field rows allowed (first / last name) |
| Checkout | Single column + sticky footer | Single column max 600 + sticky footer | Form (7 col) + sticky summary panel (5 col) holding total and CTA |
| Detail page | Image → chips → CTA → body stacked | Same, max 600 centred | Media (7 col) + info card with chips and CTA (5 col, sticky) |
| Activity listing | Tab strip scrolls horizontally | Tab strip fits, cards 2 per row | Tabs left-aligned, cards 2–3 per row |
| Calendar | Calendar, then event list below | Same, max 600 | Calendar grid (7 col) + selected-day list (5 col) |
| Tabs (secondary strip) | Scrolls horizontally | Fits width if possible | Fits, left-aligned, no scroll |

### Overlays per breakpoint

| Overlay | Mobile | Tablet / desktop |
|---------|--------|------------------|
| Bottom sheet | Bottom sheet, top radius 12 | Centred dialog, max width 480 (lists and pickers) or right side panel 400 (filters, summary) |
| Dialog | Width 358 (16 margin) | Max width 400, centred |
| Toast | Top, full width minus 32 | Top-centre, max width 400 |
| Snackbar | Bottom, above bottom nav | Bottom-left, max width 480, 24 from edges |
| Spinner overlay | Full screen | Full screen |

### Compact rules

Use these to keep layouts tight, especially on mobile web and in dense desktop areas:

1. **Mobile web header is 56**, not 92 — there is no status bar inside the browser.
2. **Compact button (40 tall)** for actions inside cards, table rows, filters and secondary actions; keep 48 for the main page CTA.
3. **List rows min 48**; settings rows keep 16 horizontal padding.
4. **Don't stretch components to desktop width.** Cap cards (496), forms (560), dialogs (400), settings (720); fill the rest with columns, not padding.
5. **Carousels become grids from tablet up** — horizontal scrolling is a mobile pattern.
6. **One primary CTA per viewport.** On desktop, move it into the summary / info panel instead of a full-width bottom bar.
7. **Keep the type scale.** Only page titles step up (H3 → H2 → H1); body text stays 16 / 14.

### Next.js container and grid

```tsx
// Page container: fluid on mobile/tablet, 1024 centred on desktop
<main className="mx-auto w-full max-w-[1024px] px-[var(--ikh-space-16)] lg:px-0">
  <div className="flex flex-col gap-[var(--ikh-space-40)] lg:gap-[var(--ikh-space-60)]">{sections}</div>
</main>

// Wide banner: 1248 max
<section className="mx-auto w-full max-w-[1248px] px-[var(--ikh-space-16)] min-[1280px]:px-0">{banner}</section>

// Product cards: scroll on mobile, grid from tablet
<div className="-mx-4 flex snap-x gap-4 overflow-x-auto px-4 md:mx-0 md:grid md:grid-cols-4 md:overflow-visible md:px-0 lg:grid-cols-5 lg:gap-6">
  {products.map((p) => <ProductCard key={p.id} className="w-40 shrink-0 snap-start md:w-auto" {...p} />)}
</div>

// Checkout: stacked on mobile, form + sticky summary on desktop
<div className="grid gap-[var(--ikh-space-40)] lg:grid-cols-12 lg:gap-6">
  <div className="lg:col-span-7">{form}</div>
  <aside className="lg:sticky lg:top-24 lg:col-span-5 lg:self-start">{summaryWithCta}</aside>
</div>
```

### Flutter

Native app screens target the mobile breakpoint; tablet layouts reuse the web reflow table above via `IkhlasBreakpoints` ([flutter.md](flutter.md#breakpoints)).

## Asset sizes

| Asset | Size |
|-------|------|
| Product widget tile | 160 × 160 |
| Product widget source asset | 580 × 360 |
| App inbox banner | 390 × 174 |
| Home banner slide | 358 × 160 (radius 12) |
| Web banner (desktop) | 1248 × 280 wide, 1024 × 280 content width; source 1920 × 280 |
| Icon + label icon | 46 × 46 |
| Action card icon | 46 × 46 |
