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
    required this.darkerTeal,
    required this.tealSurface,
    required this.space8,
    required this.space16,
    required this.radiusMd,
  });

  final Color primaryTeal;
  final Color darkerTeal;
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
    secondary: IkhlasColors.secondaryTeal,
    surface: IkhlasColors.white,
    error: IkhlasColors.red,
  ),
  scaffoldBackgroundColor: IkhlasColors.grey50,
  textTheme: TextTheme(
    headlineLarge: IkhlasTypography.h1,
    headlineMedium: IkhlasTypography.h2,
    titleLarge: IkhlasTypography.h3,
    titleMedium: IkhlasTypography.h4,
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
  static const space40 = 40.0;
  static const space48 = 48.0;
  static const space60 = 60.0;
  static const space64 = 64.0;
  static const space80 = 80.0;
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
FilledButton(
  style: ButtonStyle(
    minimumSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: IkhlasSpacing.space24, vertical: IkhlasSpacing.space12),
    ),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: IkhlasRadius.button)),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return IkhlasColors.grey300;
      if (states.contains(WidgetState.pressed)) return IkhlasColors.darkerTeal;
      return IkhlasColors.primaryTeal;
    }),
    foregroundColor: const WidgetStatePropertyAll(IkhlasColors.white),
    textStyle: WidgetStatePropertyAll(IkhlasTypography.bodyMedium),
  ),
  onPressed: isValid ? onSubmit : null,
  child: const Text('Daftar Di Sini'),
)
```

More widget patterns: [components/buttons.md](components/buttons.md), [components/text-field.md](components/text-field.md), [components/overlays.md](components/overlays.md).

## Rules

- Use `google_fonts` for DM Sans
- Match design system component names in widget class names
- Screen padding: `EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16)`; section gap `IkhlasSpacing.space40`
- Scaffold background: `IkhlasColors.grey50` (`#F9F9F9`)
- Default icon size: 24×24
- Follow the IDS component when an older screen differs (see [legacy-migration.md](legacy-migration.md))
