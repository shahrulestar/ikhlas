# Feedback Components

Inline messages that sit in the page flow. For toast, snackbar, dialog and loading overlays see [overlays.md](overlays.md).

## notice (component_set)

Property `style` = information | error | warning | general (+ deprecated `[OLD]` versions).

### Anatomy

| Property | Value |
|----------|-------|
| Width | Full content width (358 on mobile; 326 inside a 16px-padded card) |
| Padding | 8 vertical, 16 horizontal (space8 / space16) |
| Radius | 12 (radius-md) |
| Border | 1px, style colour below |
| Layout | Row: 24px icon + text, gap space8, top-aligned |
| Text | 12px Caption Text (Regular; Medium for inline emphasis or links) |
| Icon | `info_outline_24px` (information, warning, general) · `error_outline_24px` (error) |

### Styles

| Style | Fill | Border | Text + icon | Use for |
|-------|------|--------|-------------|---------|
| information | `#EAF1FB` | `#B4D0F4` | `#2765BD` | Helpful context ("Please enter participant's name exactly as it appears on the IC") |
| error | `#FEECEA` | `#FCAAA3` | `#DC3224` | Blocked state / permission denied ("Notification permissions are denied. Tap here to allow them.") |
| warning | `#FFF4E5` | `#FFD199` | `#D97F00` | Caution ("For security purposes, you can update your contact info on the AirAsia account page.") |
| general | `#F8F8F8` | `#E0E0E0` | `#212124` | Neutral note |

A notice may be tappable (e.g. opens OS Settings). Keep the whole notice as the tap target; do not add a separate button.

### Flutter

```dart
class IkhlasNotice extends StatelessWidget {
  const IkhlasNotice({super.key, required this.style, required this.message});
  final IkhlasNoticeStyle style;
  final String message;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16, vertical: IkhlasSpacing.space8),
        decoration: BoxDecoration(
          color: style.fill,
          border: Border.all(color: style.border),
          borderRadius: IkhlasRadius.notice,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(style.icon, size: 24, color: style.foreground),
          const SizedBox(width: IkhlasSpacing.space8),
          Expanded(child: Text(message, style: IkhlasTypography.caption.copyWith(color: style.foreground))),
        ]),
      );
}
```

### Next.js

```tsx
const noticeStyles = {
  information: 'bg-[#eaf1fb] border-[#b4d0f4] text-[#2765bd]',
  error: 'bg-[#feecea] border-[#fcaaa3] text-[#dc3224]',
  warning: 'bg-[#fff4e5] border-[#ffd199] text-[#d97f00]',
  general: 'bg-[#f8f8f8] border-[#e0e0e0] text-[#212124]',
} as const;

<div role="status" className={`flex gap-[var(--ikh-space-8)] rounded-[var(--ikh-radius-md)] border px-[var(--ikh-space-16)] py-[var(--ikh-space-8)] ${noticeStyles[style]}`}>
  <Icon className="size-6 shrink-0" />
  <p className="text-xs leading-[18px]">{message}</p>
</div>
```

Replace the literal hex values with the `--ikh-notice-*` variables from [colors.md](../colors.md) once the theme is in place.

## Deprecated

| Old pattern | Replace with |
|-------------|--------------|
| `[OLD]` notice styles: radius 4, no border | notice (radius 12 + border) |
| "info" banner: radius 4, 1px `#2F73D2` border | notice information |
| Error text in `#E94335` or `#E30917` | Red `#DC3224` |

## Rules

- Always icon + text — never colour alone
- Blue is informational only; errors use the error style
- Global permission problems show as an error notice at the top of the affected settings group ([patterns/states.md](../patterns/states.md#permission-denied))
