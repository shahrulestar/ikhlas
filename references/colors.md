# Color Tokens

Semantic color palette for the IKHLAS App UI design system.

## Brand / Teal

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Primary Teal | `#007F7C` | Primary Teal | Links, button_link text, brand actions |
| Dark Teal | `#00938F` | Dark Teal | Filled primary CTA |
| Secondary Teal | `#00B2A9` | Secondary Teal | Non-CTA / home header / logo accent |
| Darker Teal | — | Darker Teal | Clicked/pressed button (hex TBD) |
| Teal Link Alt | `#169D9A` | — | Greeting-card button_link |
| Teal Surface | `#F0F9F9` | — | action_card background |

Secondary Teal **is** the brand teal (`#00B2A9`). Do not treat `#00B2A9` as a separate undocumented color.

## Neutrals

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Black | `#212124` | Black | Headings, titles |
| White | `#FFFFFF` | White | Surfaces |
| Grey 800 | `#424242` | Grey 800 | Body on tinted backgrounds |
| Grey 700 | `#616161` | Grey 700 | Secondary body |
| Grey 600 | `#75767A` | Grey 600 | Inactive tab bar icons/labels |
| Grey Dark | `#75767A` | Grey Dark | Web nav items — **same hex as Grey 600** |
| Grey 90 | `#4C4C50` | Grey 90 | Link-style button text, homepage body |
| Grey Light | `#D9DBE0` | Grey Light | Web header separators |
| Grey 200 | `#EAEAEA` | Grey 200 | Mobile tab top border, list separators |
| Grey 50 | `#F8F8F8` | Grey 50 | Card / notice surface |
| Grey 300 | — | Grey 300 | Disabled button fill (hex TBD) |

Grey Light (`#D9DBE0`) and Grey 200 (`#EAEAEA`) are **different**. Use Grey 200 for mobile borders.

## Blue (informational)

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Tertiary Blue | `#2F73D2` | Tertiary/Blue | Info banner border |
| Tertiary Blue Hover | `#2765BD` | Tertiary/Blue Hover | Info banner text |
| Lighter Blue | `#EAF1FB` | Lighter/Blue | Info banner background |

## Semantic / status

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Red | `#E94335` | Red | Errors, alerts |
| Dark Gold | — | Dark Gold | Secondary link (hex TBD) |

## Adjacent styles (do not mix into IKH greys)

Seen on web/marketing frames; keep mapped separately:

| Name | Hex | Notes |
|------|-----|-------|
| Gray 6 | `#F2F2F2` | iOS-ish product-card related |
| Fill Color / Light / Secondary | `#787880` | iOS toggle track |
| MMB colors/gray/500 | `#6B7280` | MMB web text, not Grey 600 |

## Flutter mapping

```dart
abstract class IkhlasColors {
  static const primaryTeal = Color(0xFF007F7C);
  static const darkTeal = Color(0xFF00938F);
  static const secondaryTeal = Color(0xFF00B2A9);
  static const tealLinkAlt = Color(0xFF169D9A);
  static const tealSurface = Color(0xFFF0F9F9);
  static const black = Color(0xFF212124);
  static const white = Color(0xFFFFFFFF);
  static const grey800 = Color(0xFF424242);
  static const grey700 = Color(0xFF616161);
  static const grey600 = Color(0xFF75767A);
  static const greyDark = Color(0xFF75767A);
  static const grey90 = Color(0xFF4C4C50);
  static const greyLight = Color(0xFFD9DBE0);
  static const grey200 = Color(0xFFEAEAEA);
  static const grey50 = Color(0xFFF8F8F8);
  static const infoBlue = Color(0xFF2F73D2);
  static const infoBlueText = Color(0xFF2765BD);
  static const infoBlueBg = Color(0xFFEAF1FB);
  static const red = Color(0xFFE94335);
}
```

## Next.js CSS variables

```css
:root {
  --ikh-primary-teal: #007f7c;
  --ikh-dark-teal: #00938f;
  --ikh-secondary-teal: #00b2a9;
  --ikh-teal-link-alt: #169d9a;
  --ikh-teal-surface: #f0f9f9;
  --ikh-black: #212124;
  --ikh-white: #ffffff;
  --ikh-grey-800: #424242;
  --ikh-grey-700: #616161;
  --ikh-grey-600: #75767a;
  --ikh-grey-dark: #75767a;
  --ikh-grey-90: #4c4c50;
  --ikh-grey-light: #d9dbe0;
  --ikh-grey-200: #eaeaea;
  --ikh-grey-50: #f8f8f8;
  --ikh-info-blue: #2f73d2;
  --ikh-info-blue-text: #2765bd;
  --ikh-info-blue-bg: #eaf1fb;
  --ikh-red: #e94335;
}
```

## Tokens pending hex confirmation

| Style | Intended use |
|-------|--------------|
| Darker Teal | Pressed/clicked CTA |
| Grey 300 | Disabled button |
| Dark Gold | Secondary link |

## Rules

- Prefer semantic names over hex in code
- Do not use blue palette for primary CTAs — teal only
- Tab inactive = Grey 600 (`#75767A`), not Grey 700
