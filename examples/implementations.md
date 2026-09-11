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
