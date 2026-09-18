# Skeleton UI

Loading placeholders that mirror the layout of loaded content. Used while data is fetching.

Primary reference implementation: **Events Calendar** loading states.

### Frame variants

| Frame | Description |
|-------|-------------|
| Event list card | Single event row skeleton |
| Month Container | Month label + 2 event cards |
| Calendar with today state | Full screen — empty day selected |
| Calendar with focus state | Full screen — day selected + summary list |

## Token spec

| Property | Value | Token |
|----------|-------|-------|
| Fill color | `#EAEAEA` | `--ikh-grey-200` / Grey 200 |
| Opacity | 50% | — |
| Text line radius | 4px | `--ikh-radius-sm` |
| Badge / pill radius | 4px | `--ikh-radius-sm` |
| Circle (nav chevron, indicator dot) | 9999 / 12×12 | — |

**Rule:** All skeleton blocks use Grey 200 at 50% opacity. Do not use other greys or full-opacity fills.

**Calendar cell rule:** Apply the skeleton fill directly to each date frame — no inner rectangles. Remove child content; the frame itself becomes the placeholder. All date frames must be **48×55** (fixed). Set grid `gridRowSizes` to `FIXED 55` for every row so no row collapses shorter than the others.

**Week header rule:** Same pattern as calendar cells — apply skeleton fill to each day-of-week frame (44×29, radius 4). Remove inner rectangles and text. Set Week grid row to `FIXED 29`.

**Calendar nav rule:** The Date frame is one solid skeleton block (183×46, radius 4) — no separate month/hijri bars inside. Chevron groups keep a single 24×24 circle with skeleton fill; remove icon instances.

## Layout rules

Duplicate the loaded UI structure, then replace dynamic content with skeleton blocks at matching dimensions.

### Static shell (keep visible)

- Status bar instance
- Navbar background + back button instance
- Tab bar structure + active underline bar
- Card outer frame (white fill, 1px Grey 200 border, 4px radius)
- Separator lines (1px Grey 200)

### Dynamic content (skeletonize)

| Area | Blocks |
|------|--------|
| Navbar title | 64×28 |
| Tab labels | match text width × 24 |
| Calendar nav month | Whole Date frame 183×46 — no inner rectangles |
| Nav chevrons | 24×24 circle skeleton (ellipse fill, icon removed) |
| Week headers | Whole frame fill 44×29 × 7 — no inner rectangles |
| Calendar cell | Whole frame fill 48×55 (or 48×45), radius 4 — skip `Empty` cells |
| Empty state | 200×24 + 200×42 centered |
| Summary row | 12×12 dot + 338×21 bar |
| Event list card | dates 84×24 + 84×36; badge 56×24; title 220×42 |

## Event list card structure

```
Event list card (358×102, border grey200, radius 4)
└── Event list item (HORIZONTAL, gap 16)
    ├── Dates frame (100×80)
    │   ├── skeleton 84×24
    │   └── skeleton 84×36
    └── Event content (220×74, VERTICAL, gap 8)
        ├── skeleton 56×24  (badge)
        └── skeleton 220×42 (title)
```

## Month container structure

```
Month Container (358, VERTICAL, gap 16)
├── Month Label → skeleton 75×28
├── Event list card (skeleton)
└── Event list card (skeleton)
```

## Calendar date cell component

| Variant | Date Box | Text | Indicators |
|---------|----------|------|------------|
| Default | 47.71×39, radius 4, no fill | Gregorian `#212124`, Hijri `#75767A` | 14px row, empty |
| Today | Fill solid `#00B2A9` | White | 14px row, empty |
| Focused | Fill `#00B2A9` @ 10% | Gregorian + Hijri `#212124` | Brand dots 6×6 |

**Cell structure:** Calendar cell 47.71×55 = Date Box (39px) + Indicators (14px). Radius 4 applies to **Date Box**, not the outer cell.

**Event indicator dots:** Default **off**. Dots only on days with events. Today/Focused cells keep state styling without dots unless that day has events.

## Calendar screen structure

```
Calendar screen (390×844)
├── navbar (shell)
├── Primary tab (shell + skeleton labels)
└── Section
    └── Calendar Container
        ├── Calendar navigation (chevrons + date bars)
        ├── Calendar grid (week headers + Calendar component cells)
        ├── separator
        └── Empty state OR Summary of the month
```

## Code mapping

See [examples/implementations.md](../../examples/implementations.md#skeleton-ui) for Flutter and Next.js patterns.
