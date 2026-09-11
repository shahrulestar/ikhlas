# Flutter Implementation

## Recommended structure

```
lib/
  theme/
    ikhlas_colors.dart
    ikhlas_spacing.dart
    ikhlas_typography.dart
    ikhlas_radius.dart
    ikhlas_theme_extension.dart
  widgets/
    action_card.dart
    button_link.dart
    ...
```

## ThemeExtension

```dart
@immutable
class IkhlasThemeExtension extends ThemeExtension<IkhlasThemeExtension> {
  const IkhlasThemeExtension({
    required this.primaryTeal,
    required this.tealSurface,
    required this.space8,
    required this.space16,
    required this.radiusMd,
  });

  final Color primaryTeal;
  final Color tealSurface;
  final double space8;
  final double space16;
  final double radiusMd;

  @override
  IkhlasThemeExtension copyWith({...}) => ...;

  @override
  IkhlasThemeExtension lerp(IkhlasThemeExtension? other, double t) => ...;
}
```

Register in `ThemeData`:
```dart
theme: ThemeData(
  extensions: [IkhlasThemeExtension.light],
  colorScheme: ColorScheme.light(
    primary: IkhlasColors.primaryTeal,
    onPrimary: IkhlasColors.white,
    surface: IkhlasColors.white,
    error: IkhlasColors.red,
  ),
  textTheme: TextTheme(
    headlineMedium: IkhlasTypography.h3,
    bodyLarge: IkhlasTypography.body,
    bodyMedium: IkhlasTypography.subBody,
    labelSmall: IkhlasTypography.caption,
  ),
),
```

## Spacing constants

```dart
abstract class IkhlasSpacing {
  static const space2 = 2.0;
  static const space4 = 4.0;
  static const space8 = 8.0;
  static const space12 = 12.0;
  static const space16 = 16.0;
  static const space24 = 24.0;
  static const space32 = 32.0;
  // ... see spacing.md
}
```

## Component patterns

### action_card
```dart
Container(
  padding: const EdgeInsets.all(IkhlasSpacing.space16),
  decoration: BoxDecoration(
    color: IkhlasColors.tealSurface,
    borderRadius: IkhlasRadius.card,
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 46px icon
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title', style: IkhlasTypography.bodyMedium.copyWith(color: IkhlasColors.black)),
          SizedBox(height: IkhlasSpacing.space8),
          Text('Subtitle', style: IkhlasTypography.subBody.copyWith(color: IkhlasColors.grey800)),
        ],
      )),
    ],
  ),
)
```

### Primary CTA
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: IkhlasColors.darkTeal,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.button),
  ),
  onPressed: () {},
  child: Text('Daftar Di Sini', style: IkhlasTypography.bodyMedium),
)
```

## Rules

- Use `google_fonts` for DM Sans
- Match Figma component names in widget class names
- Screen padding: `EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16)`
- Default icon size: 24×24
