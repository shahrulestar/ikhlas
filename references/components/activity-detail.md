# Activity Detail Sections

Key-value section cards used on **Activity Detail** screens (Sadaqah, Zakat, Qurban, etc.).

## Figma source

| Field | Value |
|-------|-------|
| File | WIP - IKH Customer App 2.0 |
| fileKey | `r1ODKpGXGqwwDlOinO00ge` |
| Parent frame (Sadaqah) | Activity Details Sadaqah - CTA support (`11610:34050`) |
| Sections container (Sadaqah) | `11610:34052` (`sections — Sadaqah (dummy)`) |
| Parent frame (Zakat) | Activity Details (`11639:291235`) |
| Sections container (Zakat) | `11734:292043` (`sections — Zakat (dummy)`) |
| Zakat email receipt (field source) | `[Zakat] Payment Receipt Email` (`11717:24994`) |
| Parent frame (Aqiqah) | Activity Details (`11755:17320`) |
| Sections container (Aqiqah) | `11755:17334` (`sections — Aqiqah (dummy)`) |
| Aqiqah email receipt (field source) | `[Aqiqah] Payment Receipt Email` (`11755:19410`) |
| Parent frame (Fidyah) | Activity Details (`11759:20192`) |
| Sections container (Fidyah) | `11759:20206` (`sections — Fidyah (dummy)`) |
| Fidyah email receipt (field source) | `[Fidyah] Payment Receipt Email` (`11717:25121`) |
| Sadaqah dummy variant | Built 2026-09-15 — 3 section cards with dummy data |
| Zakat dummy variant | Built 2026-09-17 — 3 section cards aligned to email receipt |

### Section node IDs (Sadaqah dummy)

| Section | nodeId |
|---------|--------|
| Payment paid | `11614:681` |
| Order information | `11614:701` |
| Payment summary | `11614:733` |

[Figma link — Sadaqah](https://www.figma.com/design/r1ODKpGXGqwwDlOinO00ge/WIP---IKH-Customer-App-2.0?node-id=11610-34052)

### Section node IDs (Zakat dummy)

| Section | nodeId |
|---------|--------|
| Payment paid | `11734:292044` |
| Order information | `11734:292064` |
| Payment summary | `11734:292102` |

[Figma link — Zakat](https://www.figma.com/design/r1ODKpGXGqwwDlOinO00ge/WIP---IKH-Customer-App-2.0?node-id=11639-291235)

## Layout spec

| Property | Value | Token |
|----------|-------|-------|
| Container width | 358px | mobile 390px − space16×2 |
| Screen inset | x=16 | `--ikh-space-16` |
| Gap between cards | 16px | `--ikh-space-16` |
| Card background | #FFFFFF | `--ikh-white` |
| Card border | 1px #EAEAEA | `--ikh-grey-200` |
| Card radius | 4px | `--ikh-radius-sm` |
| Section title | 14px Regular, #75767A | subBody, `--ikh-grey-600` |
| Row label | 16px Regular, #212124 | body, `--ikh-black` |
| Row value | 14px Regular, #75767A, right-aligned | subBody, `--ikh-grey-600` |
| Total row | 16px Medium (label + value) | bodyMedium |
| Row min-height | 50px | — |
| Row padding | 16px horizontal, 13px vertical | space16 |
| Separator | 1px #EAEAEA, inset 16px left | grey200 |

**Note:** Activity detail cards use **4px radius**, not the default 12px card radius.

## Text styles (IKHLAS App UI Styles library)

| Role | Style name | Style key |
|------|------------|-----------|
| Section title | 14px Sub Body Text | `170b8475dc745467a3f23eb1030d75d6aeebbf2d` |
| Row label | 16px Body Text | `5307034fc94cc63adf1efa3e2af5481e806b5824` |
| Row value | 14px Sub Body Text | `170b8475dc745467a3f23eb1030d75d6aeebbf2d` |
| Total row | 16px Body Text Medium | `3f44cc1716bf121033a13cb0c579ddaab507f357` |

## Structure

```
sections (VERTICAL, gap 16, width 358)
└── section (VERTICAL, white fill, grey200 stroke, radius 4)
    ├── title (padding 16, 14px grey600)
    └── lists (VERTICAL)
        └── list (VERTICAL)
            ├── row (HORIZONTAL, space-between, min-height 50)
            │   ├── label (16px black)
            │   └── value (14px grey600, right)
            └── separator (1px grey200, inset 16) — omit on last row
```

Sections are **manual frames** (not component instances). Reuse this structure when generating new activity variants via `use_figma`.

## Dummy data schema (Sadaqah)

```ts
interface ActivityDetailRow {
  label: string;
  value: string;
  isBold?: boolean;
}

interface ActivityDetailSection {
  title: string;
  rows: ActivityDetailRow[];
}
```

### Sadaqah example

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `08 February 2025, 02:55 AM`; Payment Method → `Maybank2u`; Amount Paid → `MYR 11.00` |
| Order information | Booking No → `173895449708882855`; Order Date & Time → `08 February 2025, 02:54 AM`; Campaign Name → `Give with IKHLAS`; Type of Organisation → `IKHLAS`; Type of Cause → `IKHLAS Sadaqah` |
| Payment summary | Sadaqah Amount → `MYR 10.00`; Processing Fee → `MYR 1.00`; Total Amount → `MYR 11.00` (**bold**) |

### Zakat example

Field labels and dummy values aligned to `[Zakat] Payment Receipt Email` (`11717:24994`). **Customer Information** (Name, Email, AirAsia Member ID) is email-only — omitted on mobile (user is already authenticated in-app).

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `03 July 2025, 12:31 PM`; Payment Method → `Online Banking, CIMB Clicks`; Amount Paid → `MYR 101.00` |
| Order information | Booking No → `175151710359226912`; Order Date & Time → `03 July 2025, 12:31 PM`; Zakat Body → `Pusat Pungutan Zakat MAIWP`; State → `W.P. Kuala Lumpur`; Type of Zakat → `Pendapatan`; Year Haul → `2025` |
| Payment summary | Zakat Amount → `MYR 100.00`; Transaction Fees → `MYR 1.00`; Total Amount → `MYR 101.00` (**bold**) |

Product logo on screen: **IKHLAS Zakat logo** (`Property 1=IKHLAS Zakat logo` on IKHLAS Logo component set).

### Aqiqah example

Field labels and dummy values aligned to `[Aqiqah] Payment Receipt Email` (`11755:19410`). **Customer Information** is email-only — omitted on mobile.

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `25 February 2026, 08:41 AM`; Payment Method → `Online Banking, CIMB Clicks`; Amount Paid → `MYR 898.00` |
| Order information | Booking No → `177198008508834967`; Order Date & Time → `25 February 2026, 08:41 AM`; Aqiqah Type → `Aqiqah Makkah`; Quantity → `2x Whole Goat`; Year Haul → `1447 H \| 2026 M`; Requested Date → `Ramadhan 2026`; Participant Details → `adibs dib` |
| Payment summary | Aqiqah Amount → `MYR 898.00`; Total Amount → `MYR 898.00` (**bold**) |

Product logo on screen: **IKHLAS Aqiqah logo** (`Property 1=IKHLAS Aqiqah logo`).

Entry context: post-receipt — user opens Activity Detail after payment email, then may contact support (past convo) or start order-scoped chat from CTA.

### Fidyah example

Field labels and dummy values aligned to `[Fidyah] Payment Receipt Email` (`11717:25121`). **Customer Information** is email-only — omitted on mobile.

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `03 July 2025, 04:09 PM`; Payment Method → `Online Banking, CIMB Clicks`; Amount Paid → `MYR 14.00` |
| Order information | Booking No → `175153016225847588`; Order Date & Time → `03 July 2025, 04:09 PM`; Year Haul → `2025`; Pax Price → `MYR 2.00`; Number of Days → `2 Days` |
| Payment summary | Fidyah Amount → `MYR 4.00`; Management Fees → `MYR 10.00`; Total Amount → `MYR 14.00` (**bold**) |

Product logo on screen: **IKHLAS Fidyah logo** (`Property 1=IKHLAS Fidyah logo`).

### Product comparison

| Aspect | Sadaqah mobile | Zakat mobile | Aqiqah mobile | Fidyah mobile |
|--------|----------------|--------------|---------------|---------------|
| Payment paid | 3 rows | 3 rows (same labels) | 3 rows (same labels) | 3 rows (same labels) |
| Order info | Campaign, Org, Cause | Zakat Body, State, Type of Zakat, Year Haul | Aqiqah Type, Quantity, Year Haul, Requested Date, Participant Details | Year Haul, Pax Price, Number of Days |
| Payment summary amount label | Sadaqah Amount | Zakat Amount | Aqiqah Amount | Fidyah Amount |
| Fee label | Processing Fee | Transaction Fees | (none — total equals amount) | Management Fees |
| Logo | IKHLAS Sadaqah | IKHLAS Zakat | IKHLAS Aqiqah | IKHLAS Fidyah |

## Rules

- Labels left-aligned; values right-aligned
- No separator after the last row in a section
- **Total Amount** (or equivalent final total row) uses **Medium** weight on both label and value
- Long values (e.g. Booking No) wrap within the value column; keep right alignment
- Out of scope for sections-only frame: app header, product logo, footer “End of the section”

## Related patterns

- List separators: [patterns/lists.md](../patterns/lists.md) — Settings / menu list
- Label/value typography: [patterns/forms.md](../patterns/forms.md)
