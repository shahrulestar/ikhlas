# Cards

## action_card (component_set)

Property `type` = primary | secondary | check_status (+ deprecated old_teal, old_gold).

### Shared spec

| Property | Value |
|----------|-------|
| Width | 358 (full content width) |
| Padding | space16 (all sides) |
| Radius | 12px (IKHLAS-3640) |
| Layout | Row: 46px icon + text column, gap space16 |
| Text gap | space4 title → body; space8 text block → button_link |

### Types

| Type | Background | Title | Body | Action |
|------|-----------|-------|------|--------|
| primary | Teal Surface `#F0F9F9` | 16px Medium Black | 14px Regular Grey 800 | button_link 14px Medium Primary Teal |
| secondary | Gold Surface `#FAF8F2` (icon bg `#F4F0E5`) | 20px Medium Black | 16px Regular Grey 800 | 16px Medium Gold Link `#956B00` |
| check_status | Grey 50 `#F9F9F9`, radius 4 | 20px Medium Black | 16px Regular Grey 90 | 16px Medium Black + chevron ("Click here to check status") |
| old_teal (deprecated) | `#00B2A9` at 10% | 16px Medium | 14px Grey 800 | 16px `#169D9A` → use primary |
| old_gold (deprecated) | `#FAF8F2` | 20px Medium | 16px Grey 800 | 16px `#D7B250` → use secondary |

Typical copy: "Enjoy using the IKHLAS app? / Rate now", "Looking for assistance? / Contact now", "Explore qurban packages / Explore now".

### Flutter widget name

`ActionCard`

### Next.js component name

`ActionCard`

---

## user_greeting_card (component_set)

Property `userType` = guest | registered (+ deprecated old_guest, old_registered).

### Spec

| Property | Value |
|----------|-------|
| Width | 318 (leaves room for a 24px refresh icon) |
| Layout | Column, gap space4 |
| Greeting | H3 20px Medium, Black — guest "Assalamualaikum", registered "Assalamualaikum {Name}" |
| Location/dates | 16px Body, Grey 700 — two lines: city, then "7 January 2025 • 7 Rajab 1446 H" |
| Action | button_link primary: "Change location" 14px Medium Primary Teal + chevron |

Deprecated old_* variants use 16px `#00B2A9` for the action — replace with button_link primary.

---

## Content cards

Product cards, banner slider, USP tiles, info chips and event cards: [product-card.md](product-card.md).

Activity detail key-value cards: [activity-detail.md](activity-detail.md).
