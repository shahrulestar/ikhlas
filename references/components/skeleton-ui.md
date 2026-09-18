# Skeleton UI

Loading placeholders that mirror the layout of loaded content. Used while data is fetching.

## Figma source

| Field | Value |
|-------|-------|
| File | WIP - IKH Customer App 2.0 |
| fileKey | `r1ODKpGXGqwwDlOinO00ge` |
| Section | Skelaton (`11649:291687`) |
| Built | 2026-09-15 — Events Calendar loading states |

[Figma link](https://www.figma.com/design/r1ODKpGXGqwwDlOinO00ge/WIP---IKH-Customer-App-2.0?node-id=11649-291687)

### Frame node IDs

| Frame | nodeId | Description |
|-------|--------|-------------|
| Event list card | `11649:291676` | Single event row skeleton |
| Month Container | `11649:291688` | Month label + 2 event cards |
| Calendar with today state | `11649:291727` | Full screen — empty day selected |
| Calendar with focus state | `11649:292012` | Full screen — day selected + summary list |

## Token spec

| Property | Value | Token |
|----------|-------|-------|
| Fill color | `#EAEAEA` | `--ikh-grey-200` / Grey 200 |
| Opacity | 50% | — |
| Text line radius | 4px | `--ikh-radius-sm` |
| Badge / pill radius | 4px | `--ikh-radius-sm` |
| Circle (nav chevron, indicator dot) | 9999 / 12×12 | — |

**Rule:** All skeleton blocks use Grey 200 at 50% opacity. Do not use other greys or full-opacity fills.

**Calendar cell rule:** Apply the skeleton fill directly to each date frame — no inner rectangles. Remove child content; the frame itself becomes the placeholder (see example `11649:291767`). All date frames must be **48×55** (fixed). Set grid `gridRowSizes` to `FIXED 55` for every row so no row collapses shorter than the others.

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

Reference spec from **Date Container** (`11794:17176`) on page *NEW Components Explanation*. Component set **Calendar** (`11794:17006`).

| Variant | nodeId | Date Box | Text | Indicators |
|---------|--------|----------|------|------------|
| State=Default | `11794:17007` | 47.71×39, radius 4, no fill | Gregorian `#212124`, Hijri `#75767A` | 14px row, empty |
| State=Today | `11794:17018` | Fill solid `#00B2A9` | White | 14px row, empty |
| State=Focused | `11794:17029` | Fill `#00B2A9` @ 10% | Gregorian + Hijri `#212124` | Brand dots 6×6 |

**Cell structure:** `Calendar` instance 47.71×55 = `Date Box` (39px) + `Indicators` (14px). Radius 4 applies to **Date Box**, not the outer cell.

**MVP Flow grids updated:** 9 grids each in `[EN] Phase 1 UI MVP Flow` (`11088:5731`) and `[MS] Phase 1 UI MVP Flow` (`11455:4078`) — ad-hoc `Frame` cells replaced with `Calendar` instances. Today marker: day **18** on `Calendar with today state`. Focused marker: day **18** on `Calendar with focus state`.

**Event indicator dots:** Use component boolean toggles (`ikhlas 1`, `islamic 1`, `ikhlas 2`, `islamic 2`) — default **off**. Dots only on days with events. August grids: days **25** (2 dots), **26–28** (1 each). September drawer grids: days **6**, **24–26** (1 each). Today/Focused cells (day 18) keep state styling without dots unless that day has events. EN dots synced from paired MS grid; MS dots preserved from original frame data during migration.

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
