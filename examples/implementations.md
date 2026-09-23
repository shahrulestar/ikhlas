# Implementation Examples

Before/after: design export → platform-native tokens.

## action_card

### Design export (do NOT paste as-is)

```tsx
<div className="bg-[#f0f9f9] p-[var(--spacing/space16,16px)] rounded-[12px]">
```

### Next.js (correct)

```tsx
<div className="rounded-[var(--ikh-radius-md)] bg-[var(--ikh-teal-surface)] p-[var(--ikh-space-16)]">
  <div className="flex gap-[var(--ikh-space-16)]">
    <img src="/icons/rate-46.svg" alt="" className="size-[46px] shrink-0" />
    <div className="flex flex-col gap-[var(--ikh-space-8)]">
      <p className="text-base font-medium text-[var(--ikh-black)]">Enjoy using the IKHLAS app?</p>
      <p className="text-sm text-[var(--ikh-grey-800)]">Leave a review...</p>
      <button type="button" className="flex items-center gap-[var(--ikh-space-8)] text-sm font-medium text-[var(--ikh-primary-teal)]">
        Rate now
        <ChevronRight className="size-5" />
      </button>
    </div>
  </div>
</div>
```

### Flutter (correct)

```dart
ActionCard(
  icon: Assets.icons.rate46,
  title: 'Enjoy using the IKHLAS app?',
  subtitle: 'Leave a review. It won\'t take long!',
  actionLabel: 'Rate now',
  onAction: () {},
)
```

---

## Primary CTA

### Design export raw (legacy screen — do NOT copy the colour or radius)

```tsx
<div className="bg-[#00b2a9] px-[24px] py-[12px] rounded-[4px]">
```

Older screens use Secondary Teal and 4px. The IDS button is Primary Teal, 12px radius ([legacy-migration.md](../references/legacy-migration.md)).

### Next.js (correct)

```tsx
<button className="h-12 rounded-[var(--ikh-radius-md)] bg-[var(--ikh-primary-teal)] px-[var(--ikh-space-24)] py-[var(--ikh-space-12)] text-base font-medium text-white hover:bg-[var(--ikh-darker-teal)] disabled:bg-[var(--ikh-grey-300)]">
  Daftar Di Sini
</button>
```

### Flutter (correct)

```dart
FilledButton(
  style: FilledButton.styleFrom(
    backgroundColor: IkhlasColors.primaryTeal,
    disabledBackgroundColor: IkhlasColors.grey300,
    minimumSize: const Size.fromHeight(48),
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.button),
    padding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space24, vertical: IkhlasSpacing.space12),
  ),
  onPressed: onRegister,
  child: Text('Daftar Di Sini', style: IkhlasTypography.bodyMedium.copyWith(color: Colors.white)),
)
```

---

## notice (information)

### Design export raw (legacy "info" banner)

```tsx
<div className="bg-[#eaf1fb] border border-[#2f73d2] rounded-[4px] px-[16px] py-[8px]">
```

### Next.js (correct)

```tsx
<div className="flex gap-[var(--ikh-space-8)] rounded-[var(--ikh-radius-md)] border border-[var(--color-ikh-notice-info-border)] bg-[var(--color-ikh-info-blue-bg)] px-[var(--ikh-space-16)] py-[var(--ikh-space-8)]">
  <InfoOutline className="size-6 shrink-0 text-[var(--color-ikh-info-blue-text)]" />
  <p className="text-xs leading-[18px] text-[var(--color-ikh-info-blue-text)]">
    You can calculate Zakat Harta for yourself on the year selected.
  </p>
</div>
```

### Flutter (correct)

```dart
IkhlasNotice(
  style: IkhlasNoticeStyle.information,
  message: 'You can calculate Zakat Harta for yourself on the year selected.',
)
```

---

## Offline state

See [states.md](../references/patterns/states.md#offline).

### Flutter (correct)

```dart
Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset('assets/illustrations/offline.png', width: 200),
      const SizedBox(height: IkhlasSpacing.space16),
      Text('You are currently in offline mode', style: IkhlasTypography.h3, textAlign: TextAlign.center),
      const SizedBox(height: IkhlasSpacing.space8),
      Text("Make sure that you're connected to the internet.",
          style: IkhlasTypography.subBody.copyWith(color: IkhlasColors.grey600), textAlign: TextAlign.center),
      const SizedBox(height: IkhlasSpacing.space16),
      OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
    ]),
  ),
)
```

### Next.js (correct)

```tsx
<section className="flex flex-col items-center gap-[var(--ikh-space-8)] px-[var(--ikh-space-16)] text-center">
  <Image src="/illustrations/offline.webp" alt="" width={200} height={200} />
  <h2 className="mt-[var(--ikh-space-8)] text-xl font-medium leading-7 text-[var(--ikh-black)]">You are currently in offline mode</h2>
  <p className="text-sm leading-[21px] text-[var(--ikh-grey-600)]">Make sure that you&apos;re connected to the internet.</p>
  <button onClick={onRetry} className="mt-[var(--ikh-space-8)] rounded-[var(--ikh-radius-full)] border border-[var(--ikh-grey-200)] px-[var(--ikh-space-16)] py-1 text-sm font-medium">
    Retry
  </button>
</section>
```

---

## Confirmation dialog

See [overlays.md](../references/components/overlays.md#dialog).

### Flutter (correct)

```dart
showDialog<bool>(
  context: context,
  barrierColor: IkhlasColors.overlay,
  builder: (context) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.card),
    insetPadding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
    child: Padding(
      padding: const EdgeInsets.all(IkhlasSpacing.space24),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Confirmation', style: IkhlasTypography.bodyMedium),
        const SizedBox(height: IkhlasSpacing.space8),
        Text('Are you sure to delete your account?', style: IkhlasTypography.subBody.copyWith(color: IkhlasColors.grey600)),
        const SizedBox(height: IkhlasSpacing.space24),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel'))),
          const SizedBox(width: IkhlasSpacing.space16),
          Expanded(child: FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes'))),
        ]),
      ]),
    ),
  ),
);
```

---

## Spacing trap: 10px

### Wrong

```dart
padding: EdgeInsets.all(10)  // NO space10 token
```

### Correct

```dart
padding: EdgeInsets.all(IkhlasSpacing.space12)  // or space8 for compact
```

---

## activity_detail sections (Sadaqah)

See [activity-detail.md](../references/components/activity-detail.md) for full layout spec and product variants.

### Design export (do NOT paste as-is)

Absolute-positioned grid rows from design tools — use auto-layout instead.

### Next.js (correct)

```tsx
<div className="flex w-[358px] flex-col gap-[var(--ikh-space-16)]">
  <div className="rounded-[var(--ikh-radius-md)] border border-[var(--ikh-grey-200)] bg-[var(--ikh-white)]">
    <p className="px-[var(--ikh-space-16)] pt-[var(--ikh-space-16)] text-sm text-[var(--ikh-grey-600)]">Payment paid</p>
    <div className="flex min-h-[50px] items-center justify-between px-[var(--ikh-space-16)] py-[13px]">
      <p className="text-base text-[var(--ikh-black)]">Date Paid</p>
      <p className="text-right text-sm text-[var(--ikh-grey-600)]">08 February 2025, 02:55 AM</p>
    </div>
    <div className="ml-[var(--ikh-space-16)] h-px bg-[var(--ikh-grey-200)]" />
    {/* ...remaining rows and sections */}
  </div>
</div>
```

### Flutter (correct)

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    DetailSectionCard(
      title: 'Payment paid',
      rows: [
        DetailRow(label: 'Date Paid', value: '08 February 2025, 02:55 AM'),
        DetailRow(label: 'Payment Method', value: 'Maybank2u'),
        DetailRow(label: 'Amount Paid', value: 'MYR 11.00'),
      ],
    ),
    SizedBox(height: IkhlasSpacing.space16),
    // Order information, Payment summary ...
  ],
)
```

---

## activity_detail sections (Zakat)

Aligned to the `[Zakat] Payment Receipt Email` screen. See [activity-detail.md](../references/components/activity-detail.md).

### Next.js (correct)

```tsx
<div className="flex w-[358px] flex-col gap-[var(--ikh-space-16)]">
  <div className="rounded-[var(--ikh-radius-md)] border border-[var(--ikh-grey-200)] bg-[var(--ikh-white)]">
    <p className="px-[var(--ikh-space-16)] pt-[var(--ikh-space-16)] text-sm text-[var(--ikh-grey-600)]">Payment paid</p>
    <div className="flex min-h-[50px] items-center justify-between px-[var(--ikh-space-16)] py-[13px]">
      <p className="text-base text-[var(--ikh-black)]">Zakat Body</p>
      <p className="text-right text-sm text-[var(--ikh-grey-600)]">Pusat Pungutan Zakat MAIWP</p>
    </div>
    <div className="ml-[var(--ikh-space-16)] h-px bg-[var(--ikh-grey-200)]" />
    {/* Type of Zakat, Year Haul, Payment summary ... */}
  </div>
</div>
```

### Flutter (correct)

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    DetailSectionCard(
      title: 'Payment paid',
      rows: [
        DetailRow(label: 'Date Paid', value: '03 July 2025, 12:31 PM'),
        DetailRow(label: 'Payment Method', value: 'Online Banking, CIMB Clicks'),
        DetailRow(label: 'Amount Paid', value: 'MYR 101.00'),
      ],
    ),
    SizedBox(height: IkhlasSpacing.space16),
    DetailSectionCard(
      title: 'Order information',
      rows: [
        DetailRow(label: 'Booking No', value: '175151710359226912'),
        DetailRow(label: 'Order Date & Time', value: '03 July 2025, 12:31 PM'),
        DetailRow(label: 'Zakat Body', value: 'Pusat Pungutan Zakat MAIWP'),
        DetailRow(label: 'State', value: 'W.P. Kuala Lumpur'),
        DetailRow(label: 'Type of Zakat', value: 'Pendapatan'),
        DetailRow(label: 'Year Haul', value: '2025'),
      ],
    ),
    SizedBox(height: IkhlasSpacing.space16),
    DetailSectionCard(
      title: 'Payment summary',
      rows: [
        DetailRow(label: 'Zakat Amount', value: 'MYR 100.00'),
        DetailRow(label: 'Transaction Fees', value: 'MYR 1.00'),
        DetailRow(label: 'Total Amount', value: 'MYR 101.00', isBold: true),
      ],
    ),
  ],
)
```

---

## Chatwoot auto-greeting

See [activity-detail.md](../references/components/activity-detail.md#chatwoot-auto-greeting-char-3276). Applies to **both** General Inquiry and order-scoped flows.

### Next.js (correct — mobile + dashboard greeting)

```tsx
const CHATWOOT_AUTO_GREETING = (service: 'Zakat' | 'Sadaqah' | 'Aqiqah' | 'Fidyah') =>
  `Assalamualaikum Ahmad, thank you for contacting ikhlas.com ${service} support. How can I assist you today?`;

CHATWOOT_AUTO_GREETING('Zakat');
```

### Next.js (correct — agent dashboard timestamp)

Greeting timestamp = system message timestamp + 1 minute. Mobile inbox does not show per-message timestamps.

```tsx
function addOneMinute(timeStr: string): string {
  // Parse "Aug 29, 11:08 AM" or "03 Jul, 4:08 PM", add 1 min, preserve format
  const match = timeStr.match(/^(\d{1,2}|\w{3})\s+(\w{3}|\d{1,2}),\s+(\d{1,2}):(\d{2})\s+(AM|PM)$/i);
  if (!match) return timeStr;
  // …increment minute, handle hour rollover…
  return 'Aug 29, 11:09 AM'; // example output for Zakat Q02 dashboard
}
```

---

## Chatwoot order-scoped system message

Use the canonical booking number from [activity-detail.md](../references/components/activity-detail.md#booking-number-cross-reference-char-3276). **General Inquiry** flows must not include an order number.

### Next.js (correct — order-scoped)

```tsx
const SYSTEM_ORDER_SCOPED = (product: string, bookingNo: string) =>
  `🤖 [System Automated Message] We have initiated a support ticket for ${product} Order #${bookingNo}. Please describe your issue below, and our support team will assist you shortly, insha Allah.`;

// Zakat Q04 Tax relief
SYSTEM_ORDER_SCOPED('Zakat', '175151710359226912');

// Sadaqah Q04 LHDN tax relief
SYSTEM_ORDER_SCOPED('Sadaqah', '175152983907978266');
```

### Next.js (correct — General Inquiry, no booking no)

```tsx
const SYSTEM_GENERAL_INQUIRY = (product: string) =>
  `🤖 [System Automated Message] We have initiated a General Inquiry ticket for ${product}. Please describe your issue below, and our support team will assist you shortly, insha Allah.`;

SYSTEM_GENERAL_INQUIRY('Zakat');
```

### Inbox list subtitle (order-scoped)

```tsx
<p className="text-sm text-[var(--ikh-grey-600)]">Order #175151710359226912</p>
```

---

## skeleton UI

First-load placeholders (Events Calendar, Event details). See [skeleton-ui.md](../references/components/skeleton-ui.md).

### Token (correct)

```
Fill: #EAEAEA (--ikh-grey-200) @ 50% opacity
Radius: 6px text, 24px chips, 8px images, 12px buttons/cards, 4px calendar cells, 9999 circles
```

### Next.js (correct)

```tsx
function SkeletonBlock({ className }: { className?: string }) {
  return (
    <div
      className={cn('rounded-[var(--ikh-radius-skeleton-text)] bg-[var(--ikh-grey-200)] opacity-50', className)}
      aria-hidden
    />
  );
}

// Event list card skeleton
<div className="flex gap-[var(--ikh-space-16)] rounded-[var(--ikh-radius-md)] border border-[var(--ikh-grey-200)] p-[11px]">
  <div className="flex w-[100px] flex-col gap-1 pt-2">
    <SkeletonBlock className="h-6 w-[84px]" />
    <SkeletonBlock className="h-9 w-[84px]" />
  </div>
  <div className="flex flex-col gap-2">
    <SkeletonBlock className="h-6 w-14" />
    <SkeletonBlock className="h-[42px] w-[220px]" />
  </div>
</div>
```

### Flutter (correct)

```dart
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({super.key, required this.width, required this.height, this.borderRadius = 6});

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: IkhlasColors.grey200.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

// Event list card skeleton
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SkeletonBox(width: 84, height: 24),
        SizedBox(height: 4),
        SkeletonBox(width: 84, height: 36),
      ],
    ),
    SizedBox(width: IkhlasSpacing.space16),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SkeletonBox(width: 56, height: 24),
        SizedBox(height: IkhlasSpacing.space8),
        SkeletonBox(width: 220, height: 42),
      ],
    ),
  ],
)
```

---

## user_greeting_card

### Flutter sketch

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Assalamualaikum', style: IkhlasTypography.h3),
    SizedBox(height: IkhlasSpacing.space4),
    Text('Port Dickson', style: IkhlasTypography.body.copyWith(color: IkhlasColors.grey700)),
    Text('5 October 2025 • 13 Rabi\' Al-Thani 1447 H', style: IkhlasTypography.body.copyWith(color: IkhlasColors.grey700)),
    SizedBox(height: IkhlasSpacing.space4),
    ButtonLink(label: 'Change location', onTap: () {}), // 14px Medium Primary Teal + chevron
  ],
)
```
