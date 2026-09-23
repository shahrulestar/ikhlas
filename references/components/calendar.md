# Calendar (Events)

Islamic events calendar with Gregorian and Hijri dates. Loading skeleton rules: [skeleton-ui.md](skeleton-ui.md).

## Screen structure

```
Calendar screen (390 × 844)
├── navbar (back · "Events")
├── Primary tab style 2: Calendar | Events (see tabs.md)
└── Section
    └── Calendar Container
        ├── Calendar navigation (chevrons + month / hijri)
        ├── Calendar grid (week headers + date cells)
        ├── separator (1px Grey 200)
        └── Summary of the month (event rows) OR empty state
```

## Calendar navigation

| Element | Spec |
|---------|------|
| Month | "August 2026", H3 20 Medium Black, centred |
| Hijri range | "Safar - Rabi Al-Awwal 1448H", 14 Regular Grey 600, centred |
| Chevrons | 24px circle, Teal Pressed Surface fill, Primary Teal chevron (btn_next) |

## Week header

MON … SUN, 14px Medium Black, 7 equal columns.

## Date cell

Cell 47.71 × 55 = Date Box (39) + Indicators row (14). Radius 4 applies to the **Date Box**, not the outer cell.

| Variant | Date Box | Text | Indicators |
|---------|----------|------|------------|
| Default | No fill | Gregorian 16 Black; Hijri caption Grey 600 ("17 SAF") | Empty unless the day has events |
| Today | Fill Secondary Teal `#00B2A9` | White | Empty unless events |
| Focused | Fill `#00B2A9` at 10% + 1px teal outline | Gregorian + Hijri Black | Dots when events exist |

**Event dots:** 6 × 6, default off. Show only on days with events; up to 3 dots for mixed categories.

Categories (each has its own dot colour in the design):
- ikhlas.com official event or collaboration
- Islamic festival / holiday and historical date
- Umrah & Travel
- Custom event added by the user
- Other (ritual and voluntary events)

## Summary of the month / selected day

Rows: dot 12 + title 16 Regular Black ("Birthday of Prophet Muhammad"), gap 8, rows gap 16.

Empty state for a selected day: "Nothing Scheduled" (16 Medium Black) / "Select another date to view events" (14 Grey 600), centred.

## Events list (Events tab)

- Grouped by month label (H3), cards stacked with gap 16
- Event list card: white, 1px Grey 200 border, radius 12 (older frames: 4), dates column (Gregorian + Hijri) + content (category badge 24 tall + title)

## Event details

See [product-card.md](product-card.md#event-card-detail). Reminder confirmation uses a bottom snackbar ("Reminder set for … on 25 August 2026") — [overlays.md](overlays.md#snackbar-bottom).

## Edge states

- Loading: skeleton ([skeleton-ui.md](skeleton-ui.md))
- Offline: full offline state inside the section with Retry ([patterns/states.md](../patterns/states.md#offline))
- Empty month: "Nothing Scheduled" message in place of the summary
