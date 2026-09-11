# Empty State Patterns

No dedicated empty-state component found in IKHLAS App UI Styles library.

## Recommended pattern (token-based)

| Element | Token |
|---------|-------|
| Illustration | Centered, max 200px width |
| Title | H3 20px Medium, Black |
| Description | 16px Body, Grey 700, centered |
| Action | Primary CTA or button_link |
| Vertical gap | space16 between elements |
| Screen padding | space16 horizontal |

## Flutter

```dart
Center(
  child: Padding(
    padding: const EdgeInsets.all(IkhlasSpacing.space16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // illustration
        Text('No items yet', style: IkhlasTypography.h3),
        SizedBox(height: IkhlasSpacing.space8),
        Text('Description', style: IkhlasTypography.body.copyWith(color: IkhlasColors.grey700)),
        SizedBox(height: IkhlasSpacing.space16),
        // CTA button
      ],
    ),
  ),
)
```

## Next.js

Center flex column with `gap-[var(--ikh-space-16)]`, max-w-sm, text-center.

## Refresh

Search Customer App file for "empty" components and document if found.
