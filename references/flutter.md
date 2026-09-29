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

## Breakpoints

Same thresholds as web ([layout.md](layout.md#responsive-layout)). Phones use the mobile layout; tablets and large foldables use the tablet reflow.

```dart
enum IkhlasBreakpoint { mobile, tablet, desktop }

abstract class IkhlasBreakpoints {
  static const tablet = 768.0;
  static const desktop = 1024.0;
  static const contentMaxWidth = 1024.0;

  static IkhlasBreakpoint of(double width) => width >= desktop
      ? IkhlasBreakpoint.desktop
      : width >= tablet
          ? IkhlasBreakpoint.tablet
          : IkhlasBreakpoint.mobile;

  static int columns(IkhlasBreakpoint bp) => switch (bp) {
        IkhlasBreakpoint.mobile => 4,
        IkhlasBreakpoint.tablet => 8,
        IkhlasBreakpoint.desktop => 12,
      };

  static double sectionGap(IkhlasBreakpoint bp) =>
      bp == IkhlasBreakpoint.desktop ? IkhlasSpacing.space60 : IkhlasSpacing.space40;
}

// Product cards: horizontal list on mobile, grid from tablet up
LayoutBuilder(builder: (context, constraints) {
  final bp = IkhlasBreakpoints.of(constraints.maxWidth);
  if (bp == IkhlasBreakpoint.mobile) {
    return SizedBox(
      height: 290,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: IkhlasSpacing.space16),
        itemBuilder: (_, i) => ProductCard(product: products[i], width: 160),
      ),
    );
  }
  final gap = bp == IkhlasBreakpoint.desktop
      ? IkhlasSpacing.space24
      : IkhlasSpacing.space16;
  return GridView(
    padding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: bp == IkhlasBreakpoint.tablet ? 4 : 5,
      mainAxisSpacing: gap,
      crossAxisSpacing: gap,
      mainAxisExtent: 290,
    ),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [for (final p in products) ProductCard(product: p)],
  );
});
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
