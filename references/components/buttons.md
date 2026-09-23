# Buttons

Design system component sets: `button`, `button_link`.

## button

Properties: `type` = primary | secondary | tertiary | disabled; `state` = default | pressed | icon (+ hover on web).

### Shared anatomy

| Property | Value |
|----------|-------|
| Height | 48 (regular) · 40 (compact) |
| Padding | 12 vertical, 24 horizontal (space12 / space24) |
| Radius | 12 (radius-md) |
| Label | 16px Body Text Medium, centred |
| Icon (state=icon) | 24px, gap 8 before label |
| Width | Hug, or full width (358) in sticky footers and dialogs |

### Types and states

| Type | Default | Pressed / hover | Label |
|------|---------|-----------------|-------|
| primary | Fill Primary Teal `#007F7C` | Fill Darker Teal `#006260` | White |
| secondary | White fill, 1px Primary Teal border | Fill Teal Pressed Surface `#E1F3F2`, same border | Primary Teal |
| tertiary | No fill, no border | Text only | Red `#DC3224` (destructive: "Log out", "Delete account") |
| disabled | Fill Grey 300 `#E0E0E0` | — | White |

Use one primary button per view. Pair secondary (left) + primary (right) in dialogs, each flexing to half width.

### Flutter

```dart
// Primary — full pattern with pressed/disabled states: see ../flutter.md
FilledButton(onPressed: isValid ? onSubmit : null, child: const Text('Pay now'));

// Secondary
OutlinedButton(
  style: OutlinedButton.styleFrom(
    minimumSize: const Size.fromHeight(48),
    side: const BorderSide(color: IkhlasColors.primaryTeal),
    foregroundColor: IkhlasColors.primaryTeal,
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.button),
    textStyle: IkhlasTypography.bodyMedium,
  ),
  onPressed: onCancel,
  child: const Text('Cancel'),
);

// Tertiary (destructive)
TextButton(
  style: TextButton.styleFrom(foregroundColor: IkhlasColors.red, textStyle: IkhlasTypography.bodyMedium),
  onPressed: onLogout,
  child: const Text('Log out'),
);
```

### Next.js

```tsx
const base = 'inline-flex h-12 items-center justify-center gap-2 rounded-[var(--ikh-radius-md)] px-[var(--ikh-space-24)] py-[var(--ikh-space-12)] text-base font-medium leading-6';

const variants = {
  primary: 'bg-[var(--ikh-primary-teal)] text-white hover:bg-[var(--ikh-darker-teal)] active:bg-[var(--ikh-darker-teal)] disabled:bg-[var(--ikh-grey-300)]',
  secondary: 'border border-[var(--ikh-primary-teal)] bg-white text-[var(--ikh-primary-teal)] hover:bg-[var(--color-ikh-teal-pressed-surface)]',
  tertiary: 'bg-transparent text-[var(--ikh-red)]',
};
```

## button_link

Text link with trailing chevron (in a 20–24px teal-tinted circle). No fill.

| Type | Text | Colour |
|------|------|--------|
| primary | 14px Sub Body Medium | Primary Teal `#007F7C` |
| secondary | 16px Body Medium | Dark Gold `#D97F00` |

- Gap 8 between text and icon; icon 20px inside action cards, 24px elsewhere.
- Used for secondary actions: "Rate now", "Change location", "Explore now", "View Summary".

## Deprecated variants

| Variant | Appearance | Replace with |
|---------|------------|--------------|
| primary old / old_2 / old_3 | `#67C1BF` or `#00B2A9` fill, radius 4 (old_3 radius 12) | primary |
| secondary old / old_2 | `#67C1BF` or `#00B2A9` outline, radius 4 | secondary |
| disabled old / old_2 | radius 4; or `#F8F8F8` fill + `#EBEBEB` border + `#DFE1E5` text | disabled |
| button_link old | 16px `#169D9A` | button_link primary |

Existing screens often still show `#00B2A9` fills with 4px radius — implement the IDS button instead ([legacy-migration.md](../legacy-migration.md)).

## Don't

- Use blue or Secondary Teal for filled CTAs
- Use radius other than 12px for buttons
- Reduce opacity to show disabled — use the Grey 300 fill
- Stack multiple primary CTAs in one view
