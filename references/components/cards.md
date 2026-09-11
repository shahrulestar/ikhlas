# Cards

## action_card (component_set)

**componentKey:** `f2cd1e11e5a97353961dbaf8d31897bb90f69d9b`  
**Reference node:** `1256:22296`

### Spec

| Property | Value |
|----------|-------|
| Background | Teal Surface `#F0F9F9` |
| Padding | space16 (all sides) |
| Radius | 12px (IKHLAS-3640) |
| Layout | Row: 46px icon + text column |
| Text gap | space8 between title block and button_link |
| Title | 16px Medium, Black, line-height 24px |
| Body | 14px Regular, Grey 800, line-height 21px |
| Action | button_link: 14px Medium Primary Teal |

### Flutter widget name

`ActionCard`

### Next.js component name

`ActionCard`

---

## user_greeting_card (component_set)

**componentKey:** `ec77f9e08a0de2dd3907286601e708fafb1a14`  
**Reference node:** `1256:22082`

### Spec

| Property | Value |
|----------|-------|
| Layout | Column, gap space4 |
| Greeting | H3 20px Medium, Black |
| Location/dates | 16px Body, Grey 700 |
| Action | button_link 16px Medium, `#169D9A` + 24px icon |

Supports dual date lines (Gregorian • Hijri).

---

## Content cards (product)

Horizontal scroll card grids use:
- Card width ~160px (mobile) or ~244px (web)
- Gap between cards: space16 (260 - 244 = 16) or space24 on web
- Image fill with optional title below

Not separate component_sets — compose from layout tokens + image component.

---

## promo_intro_card

Used in web travel grid. Tall portrait cards (~418px height). See WIP Customer App file for instances.
