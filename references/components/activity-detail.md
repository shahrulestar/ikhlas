# Activity Detail Sections

Key-value section cards used on **Activity Detail** screens (Sadaqah, Zakat, Qurban, etc.).

Each product variant uses three section cards: **Payment paid**, **Order information**, and **Payment summary**. Field labels align to the product's payment receipt email template.

## Layout spec

| Property | Value | Token |
|----------|-------|-------|
| Container width | 358px | mobile 390px − space16×2 |
| Screen inset | x=16 | `--ikh-space-16` |
| Gap between cards | 16px | `--ikh-space-16` |
| Card background | #FFFFFF | `--ikh-white` |
| Card border | 1px #EAEAEA | `--ikh-grey-200` |
| Card radius | 12px (IDS target; existing frames 4px) | `--ikh-radius-md` |
| Section title | 14px Regular, #75767A | subBody, `--ikh-grey-600` |
| Row label | 16px Regular, #212124 | body, `--ikh-black` |
| Row value | 14px Regular, #75767A, right-aligned | subBody, `--ikh-grey-600` |
| Total row | 16px Medium (label + value) | bodyMedium |
| Row min-height | 50px | — |
| Row padding | 16px horizontal, 13px vertical | space16 |
| Separator | 1px #EAEAEA, inset 16px left | grey200 |

**Note:** Current activity detail frames use **4px radius**. The IDS target is 12px with 16px row padding (open item with default applied — see [legacy-migration.md](../legacy-migration.md#open-items-defaults-applied)). Use 12px for new work unless the product team asks to match the existing screens.

## Text styles

| Role | Style |
|------|-------|
| Section title | 14px Sub Body, Grey 600 |
| Row label | 16px Body, Black |
| Row value | 14px Sub Body, Grey 600, right-aligned |
| Total row | 16px Body Medium, Black |

## Structure

```
sections (VERTICAL, gap 16, width 358)
└── section (VERTICAL, white fill, grey200 stroke, radius 12)
    ├── title (padding 16, 14px grey600)
    └── lists (VERTICAL)
        └── list (VERTICAL)
            ├── row (HORIZONTAL, space-between, min-height 50)
            │   ├── label (16px black)
            │   └── value (14px grey600, right)
            └── separator (1px grey200, inset 16) — omit on last row
```

Sections are **manual frames** (not component instances). Reuse this structure when building new product variants.

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
| Order information | Booking No → `175152983907978266`; Order Date & Time → `08 February 2025, 02:54 AM`; Campaign Name → `Give with IKHLAS`; Type of Organisation → `IKHLAS`; Type of Cause → `IKHLAS Sadaqah` |
| Payment summary | Sadaqah Amount → `MYR 10.00`; Processing Fee → `MYR 1.00`; Total Amount → `MYR 11.00` (**bold**) |

### Zakat example

Field labels and dummy values aligned to the Zakat payment receipt email. **Customer Information** (Name, Email, AirAsia Member ID) is email-only — omitted on mobile (user is already authenticated in-app).

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `03 July 2025, 12:31 PM`; Payment Method → `Online Banking, CIMB Clicks`; Amount Paid → `MYR 101.00` |
| Order information | Booking No → `175151710359226912`; Order Date & Time → `03 July 2025, 12:31 PM`; Zakat Body → `Pusat Pungutan Zakat MAIWP`; State → `W.P. Kuala Lumpur`; Type of Zakat → `Pendapatan`; Year Haul → `2025` |
| Payment summary | Zakat Amount → `MYR 100.00`; Transaction Fees → `MYR 1.00`; Total Amount → `MYR 101.00` (**bold**) |

Product logo on screen: **IKHLAS Zakat logo** (`Property 1=IKHLAS Zakat logo` on IKHLAS Logo component set).

### Aqiqah example

Field labels and dummy values aligned to the Aqiqah payment receipt email. **Customer Information** is email-only — omitted on mobile.

| Section | Rows |
|---------|------|
| Payment paid | Date Paid → `25 February 2026, 08:41 AM`; Payment Method → `Online Banking, CIMB Clicks`; Amount Paid → `MYR 898.00` |
| Order information | Booking No → `177198008508834967`; Order Date & Time → `25 February 2026, 08:41 AM`; Aqiqah Type → `Aqiqah Makkah`; Quantity → `2x Whole Goat`; Year Haul → `1447 H \| 2026 M`; Requested Date → `Ramadhan 2026`; Participant Details → `adibs dib` |
| Payment summary | Aqiqah Amount → `MYR 898.00`; Total Amount → `MYR 898.00` (**bold**) |

Product logo on screen: **IKHLAS Aqiqah logo** (`Property 1=IKHLAS Aqiqah logo`).

Entry context: post-receipt — user opens Activity Detail after payment email, then may contact support (past convo) or start order-scoped chat from CTA.

### Fidyah example

Field labels and dummy values aligned to the Fidyah payment receipt email. **Customer Information** is email-only — omitted on mobile.

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

## Booking number cross-reference (CHAR-3276)

Canonical **Booking No** values come from each product's payment receipt email in the Chatwoot customer-support flow for lifestyle services (CHAR-3276). Use the same number across all **order-scoped** touchpoints.

| Product | Booking No (email) | Email receipt screen |
|---------|-------------------|----------------------|
| Sadaqah | `175152983907978266` | [Sadaqah] Payment Receipt Email |
| Zakat | `175151710359226912` | [Zakat] Payment Receipt Email |
| Aqiqah | `177198008508834967` | [Aqiqah] Payment Receipt Email |
| Fidyah | `175153016225847588` | [Fidyah] Payment Receipt Email |

| Touchpoint | Format | Example (Zakat) |
|------------|--------|-----------------|
| Activity Detail | Label `Booking No`, raw number | `175151710359226912` |
| Inbox (order-scoped) | `Order #[booking_no]` subtitle under `* Order Support` | `Order #175151710359226912` |
| Push notification (order-scoped) | Title + `Order #[booking_no]` | `Zakat Order Support\nOrder #175151710359226912` |
| Chatwoot system message (order-scoped) | `support ticket for [Product] Order #[booking_no]` | `…support ticket for Zakat Order #175151710359226912…` |

**General Inquiry does not show a booking number.** Help/FAQ entry points use `General Inquiry ticket for [Product]` with no `Order #` line in inbox, notifications, or Chatwoot. Only order-scoped flows (from Activity Detail CTA) include the booking number.

## Chatwoot auto-greeting (CHAR-3276)

After the system automated message, every Chatwoot conversation (General Inquiry and order-scoped) sends an agent auto-greeting:

```
Assalamualaikum Ahmad, thank you for contacting ikhlas.com {Service} support. How can I assist you today?
```

Where `{Service}` is exactly `Zakat`, `Sadaqah`, `Aqiqah`, or `Fidyah`.

| Surface | Greeting | Per-message timestamps |
|---------|----------|------------------------|
| Mobile `Chatwoot Inbox` | Required — appears after system message, before user question | No — date separator only (e.g. `Aug 06, 2026`) |
| Agent dashboard `Chatwoot Agent` | Same copy | Yes — greeting timestamp = system message timestamp **+ 1 minute** |

Example (Zakat dashboard): system `Aug 29, 11:08 AM` → greeting `Aug 29, 11:09 AM`.

Reference screens: "Chatwoot Inbox" mobile (Zakat) and "Chatwoot Agent" dashboard (Zakat Q02).

Order-scoped example screens (all in the CHAR-3276 flow):

| Product | Activity Detail | Inbox | Notification | Chatwoot mobile |
|---------|----------------|-------|--------------|-----------------|
| Zakat | Activity Details Zakat — CTA support | Inbox — order-scoped | Order support notification | Chatwoot Inbox — Q04 Tax relief |
| Sadaqah | Activity Details Sadaqah — CTA support | Inbox — order-scoped | Order support notification | Chatwoot Inbox — Q04 LHDN tax relief |
| Aqiqah | Activity Details Aqiqah — CTA support | Inbox — order-scoped | Order support notification | Chatwoot Inbox — Q03 Video proof |
| Fidyah | Activity Details Fidyah — CTA support | Inbox — order-scoped | Order support notification | Chatwoot Inbox — Q03 Elderly |

## Rules

- Labels left-aligned; values right-aligned
- No separator after the last row in a section
- **Total Amount** (or equivalent final total row) uses **Medium** weight on both label and value
- Long values (e.g. Booking No) wrap within the value column; keep right alignment
- Out of scope for sections-only frame: app header, product logo, footer “End of the section”

## Related patterns

- List separators: [patterns/lists.md](../patterns/lists.md) — Settings group
- Label/value typography: [patterns/forms.md](../patterns/forms.md)
