# Implementation Examples

Before/after: Figma export → platform-native tokens.

## action_card

### Figma export (do NOT paste as-is)

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

### Figma raw

```tsx
<div className="bg-[#00938f] px-[24px] py-[11px] rounded-[12px]">
```

### Next.js (correct)

```tsx
<button className="rounded-[var(--ikh-radius-md)] bg-[var(--ikh-dark-teal)] px-6 py-[11px] text-base font-medium text-white">
  Daftar Di Sini
</button>
```

### Flutter (correct)

```dart
FilledButton(
  style: FilledButton.styleFrom(
    backgroundColor: IkhlasColors.darkTeal,
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.button),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
  ),
  onPressed: onRegister,
  child: Text('Daftar Di Sini', style: IkhlasTypography.bodyMedium.copyWith(color: Colors.white)),
)
```

---

## info banner

### Figma raw

```tsx
<div className="bg-[#eaf1fb] border border-[#2f73d2] rounded-[4px] px-[16px] py-[8px]">
```

### Next.js (correct)

```tsx
<div className="rounded-[var(--ikh-radius-sm)] border border-[var(--ikh-info-blue)] bg-[var(--ikh-info-blue-bg)] px-[var(--ikh-space-16)] py-2">
  <div className="flex gap-[var(--ikh-space-8)]">
    <InfoOutline className="size-6 text-[var(--ikh-info-blue-text)]" />
    <p className="text-xs leading-normal text-[var(--ikh-info-blue-text)]">
      You can calculate Zakat Harta for yourself on the year selected.
    </p>
  </div>
</div>
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

Generated in Figma via `use_figma` + IKHLAS text styles. See [activity-detail.md](../references/components/activity-detail.md). Zakat variant: node `11639:291235`.

### Figma export (do NOT paste as-is)

Absolute-positioned grid rows from `get_design_context` — use auto-layout instead.

### Next.js (correct)

```tsx
<div className="flex w-[358px] flex-col gap-[var(--ikh-space-16)]">
  <div className="rounded-[var(--ikh-radius-sm)] border border-[var(--ikh-grey-200)] bg-[var(--ikh-white)]">
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

Aligned to `[Zakat] Payment Receipt Email` (`11717:24994`). See [activity-detail.md](../references/components/activity-detail.md).

### Next.js (correct)

```tsx
<div className="flex w-[358px] flex-col gap-[var(--ikh-space-16)]">
  <div className="rounded-[var(--ikh-radius-sm)] border border-[var(--ikh-grey-200)] bg-[var(--ikh-white)]">
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

## skeleton UI

Loading placeholders for Events Calendar. See [skeleton-ui.md](../references/components/skeleton-ui.md).

### Token (correct)

```
Fill: #EAEAEA (--ikh-grey-200) @ 50% opacity
Radius: 4px for bars, 9999 for circles
```

### Next.js (correct)

```tsx
function SkeletonBlock({ className }: { className?: string }) {
  return (
    <div
      className={cn('rounded-[var(--ikh-radius-sm)] bg-[var(--ikh-grey-200)] opacity-50', className)}
      aria-hidden
    />
  );
}

// Event list card skeleton
<div className="flex gap-[var(--ikh-space-16)] rounded-[var(--ikh-radius-sm)] border border-[var(--ikh-grey-200)] p-[11px]">
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
  const SkeletonBox({super.key, required this.width, required this.height, this.borderRadius = 4});

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: IkhlasColors.grey200.withOpacity(0.5),
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
    SizedBox(height: IkhlasSpacing.space8),
    ButtonLink(label: 'Change location', onTap: () {}),
  ],
)
```
