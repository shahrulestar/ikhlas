# Skeleton UI

Loading placeholders that mirror the layout of loaded content. Used while data is fetching.

Use skeletons for **first load** only. For submit / processing use the spinner overlay ([overlays.md](overlays.md#loading-overlay-spinner)). All states: [patterns/states.md](../patterns/states.md).

Primary reference implementations: **Events Calendar** and **Event details** loading states.

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
| Text line / text block radius | 6px | `--ikh-radius-skeleton-text` |
| Image block radius | 8px | `--ikh-radius-skeleton-image` |
| Badge / chip / pill radius | 24px | `--ikh-radius-pill` |
| Button placeholder radius | 12px (358 × 48) | `--ikh-radius-md` |
| Calendar cells, week headers, month nav | 4px | `--ikh-radius-sm` |
| Circle (nav chevron, indicator dot) | 9999 / 12×12 | `--ikh-radius-full` |

**Rule:** All skeleton blocks use Grey 200 at 50% opacity on a white background. Do not use other greys or full-opacity fills. Match the radius of the element being replaced.

**Calendar cell rule:** Apply the skeleton fill directly to each date frame — no inner rectangles. Remove child content; the frame itself becomes the placeholder. All date frames must be **48×55** (fixed). Set grid `gridRowSizes` to `FIXED 55` for every row so no row collapses shorter than the others.

**Week header rule:** Same pattern as calendar cells — apply skeleton fill to each day-of-week frame (44×29, radius 4). Remove inner rectangles and text. Set Week grid row to `FIXED 29`.

**Calendar nav rule:** The Date frame is one solid skeleton block (183×46, radius 4) — no separate month/hijri bars inside. Chevron groups keep a single 24×24 circle with skeleton fill; remove icon instances.

## Layout rules

Duplicate the loaded UI structure, then replace dynamic content with skeleton blocks at matching dimensions.

### Static shell (keep visible)

- Status bar instance
- Navbar background + back button instance
- Tab bar structure + active underline bar
- Card outer frame (white fill, 1px Grey 200 border, 12px radius; 4px on legacy list cards)
- Separator lines (1px Grey 200)
- Navbar icons (back, share, info) stay visible

The header is part of the shell and is **not** dimmed for skeletons; only the spinner overlay dims the header.

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
| Event details | image 358×188 (r8); chips 186–217×24 (r24); text 358×28 (r6); button 358×48 (r12); body 358×161 (r6) |

## Event list card structure

```
Event list card (358×102, border grey200, radius 12; legacy frames radius 4)
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

## Calendar component and screen

Date cell variants (default / today / focused), event dots and the calendar screen structure live in [calendar.md](calendar.md). Skeletonize that structure using the rules above.

## Code mapping

See [examples/implementations.md](../../examples/implementations.md#skeleton-ui) for Flutter and Next.js patterns.
