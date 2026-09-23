# Text Field

Single-line and multi-line inputs plus the form controls used with them. Layout rules: [patterns/forms.md](../patterns/forms.md).

## Anatomy (single line)

| Property | Value |
|----------|-------|
| Height | 48 |
| Width | Full content width (358) |
| Radius | 4 (radius-sm) |
| Border | 1px Grey Light `#D9DBE0` |
| Fill | White |
| Horizontal padding | 16 |
| Floating label | 12px Regular, Grey 90 `#4C4C50` at 50% opacity, top 6 |
| Value | 16px Regular, Black `#212124`, top 22 |
| Placeholder (empty) | 16px Regular, Grey 600 `#75767A` at 50% opacity, vertically centred |
| Trailing icon | 24px Grey 600, right 16 (dropdown chevron, calendar, eye) |
| Error message | 12px Regular Red, 4 below the field |

## States

| State | Border | Label | Value / other |
|-------|--------|-------|---------------|
| Normal | 1px `#D9DBE0` | Grey 90 | Black |
| Hover (web) | 1px Focus Purple `#4B4FA6` | — | Placeholder Grey 600 |
| Focus | 1px `#4B4FA6` (+ 2px focus ring on web) | Grey 90 | Cursor 1 × 20 |
| Activated (filled) | 1px `#4B4FA6` | Grey 90 | Black |
| With icon | Normal | Grey 90 | Trailing 24px icon |
| With action | Normal | — | Trailing text action 16px |
| Error | 1px Red `#DC3224` | Red | Error message below |
| Disabled | 1px `#D9DBE0`, fill Grey Notice `#F8F8F8` | Field Disabled Text `#C5C9D0` | `#C5C9D0` |

## Multi-line

- Height 152, same border / radius / padding
- Placeholder 16px Grey 600 at 50%; top padding 16
- Used for "Additional notes" and feedback

## Variants

### Split phone field

Row, gap 16: country selector (122 wide; floating label "Malaysia", value "+60", chevron) + mobile number field (220 wide).

### Password

Trailing eye icon toggles visibility (Grey 300 when hidden).

### Dropdown / select

Normal field + trailing chevron; opens a bottom sheet list ([overlays.md](overlays.md)).

## Related controls

| Control | Spec |
|---------|------|
| Stepper | Two 32 × 32 buttons, radius 4. Disabled: fill `#F8F8F8`, border `#EBEBEB`, glyph `#DFE1E5`. Active: white fill, 1px teal border, teal plus/minus |
| Checkbox row | 24px checkbox + 14px Regular Grey 90 label, gap 16; checked = teal fill with white tick |
| Radio box | Bordered option box (white, 1px Grey 200, radius 4), 22px radio + 16px label; two per row for binary choices (Male / Female) |
| Accordion row | White, radius 4, padding 16; label 16 Grey 90 + trailing expand/collapse icon 24 |

## Flutter

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'First name (as per IC)',
    labelStyle: IkhlasTypography.caption.copyWith(color: IkhlasColors.grey90.withValues(alpha: 0.5)),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16, vertical: IkhlasSpacing.space12),
    border: OutlineInputBorder(borderRadius: IkhlasRadius.field, borderSide: const BorderSide(color: IkhlasColors.greyLight)),
    enabledBorder: OutlineInputBorder(borderRadius: IkhlasRadius.field, borderSide: const BorderSide(color: IkhlasColors.greyLight)),
    focusedBorder: OutlineInputBorder(borderRadius: IkhlasRadius.field, borderSide: const BorderSide(color: IkhlasColors.focusPurple)),
    errorBorder: OutlineInputBorder(borderRadius: IkhlasRadius.field, borderSide: const BorderSide(color: IkhlasColors.red)),
    errorStyle: IkhlasTypography.caption.copyWith(color: IkhlasColors.red),
    filled: true,
    fillColor: IkhlasColors.white,
  ),
  style: IkhlasTypography.body.copyWith(color: IkhlasColors.black),
)
```

## Next.js

```tsx
<label className="relative block h-12 rounded-[var(--ikh-radius-sm)] border border-[var(--color-ikh-grey-light)] bg-white px-[var(--ikh-space-16)] focus-within:border-[var(--color-ikh-focus-purple)] has-[[aria-invalid=true]]:border-[var(--ikh-red)]">
  <span className="absolute left-4 top-1.5 text-xs leading-[18px] text-[var(--color-ikh-grey-90)] opacity-50">First name (as per IC)</span>
  <input className="absolute inset-x-4 top-[22px] bg-transparent text-base leading-5 text-[var(--ikh-black)] outline-none" />
</label>
```
