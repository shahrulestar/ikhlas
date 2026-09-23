# Layout

Page-level structure for IKHLAS mobile (Flutter) and web (Next.js). Spacing values map to tokens in [spacing.md](spacing.md).

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

### Settings / Account

- Background Grey 50; content padding 16, groups gap 16.
- User info card: avatar 70 (initials), name 16 Medium, loyalty strip (Loyalty Surface `#E9F9FA`), "Powered by" caption.
- Settings groups: white card, 1px Grey 200 border, radius 12, padding 16; group label 14 Grey 600; rows 16 Regular Black + chevron 24; 1px Grey 200 separators. See [patterns/lists.md](patterns/lists.md).
- Footer: app version 14 Grey 600 centred; "Log out" 16 Medium Red.

### Activity listing

- Navbar title "Activity"; horizontal product tab strip (Sadaqah, Zakat, Fidyah, Qurban, Aqiqah, Umrah, Travel) on Grey 50, 56 tall.
- Content starts 40 below the tab strip.
- Empty state: promotional action_card for the selected product, then "End of the section" ([patterns/empty-states.md](patterns/empty-states.md)).

## Web layout

| Element | Value |
|---------|-------|
| Design frame | 1440 wide |
| Content column | 1024 wide, 208 side margins, centred |
| Wide banner / hero | 1248 wide, 96 side margins |
| Section gap | 60 |
| Header | 66 tall white bar (optional top bar makes the sticky group 106) |
| Footer | padding 208 horizontal, 40 bottom |
| Mobile web | 390 frame, same rules as mobile app |

```tsx
<main className="mx-auto flex w-full max-w-[1024px] flex-col gap-[var(--ikh-space-60)] px-[var(--ikh-space-16)] lg:px-0">
  {sections}
</main>
```

## Asset sizes

| Asset | Size |
|-------|------|
| Product widget tile | 160 × 160 |
| Product widget source asset | 580 × 360 |
| App inbox banner | 390 × 174 |
| Home banner slide | 358 × 160 (radius 12) |
| Icon + label icon | 46 × 46 |
| Action card icon | 46 × 46 |
