# Color Tokens

Semantic color palette for the IKHLAS App UI design system.

## Brand / Teal

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Primary Teal | `#007F7C` | Primary Teal | **Filled primary CTA**, links, button_link, active tab text |
| Darker Teal | `#006260` | Darker Teal | Pressed primary CTA |
| Secondary Teal | `#00B2A9` | Secondary Teal | Non-CTA: home navbar, prayer header, tab underline, calendar today |
| Teal Link Alt | `#169D9A` | — | Bottom nav icon accent, ticked icon |
| Teal Surface | `#F0F9F9` | — | action_card (primary) background |
| Teal Pressed Surface | `#E1F3F2` | — | Secondary button pressed fill, action_card icon background |

Secondary Teal is the brand teal for surfaces and headers — **never** use it as a CTA fill (legacy screens do; see [legacy-migration.md](legacy-migration.md)).

## Gold

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Dark Gold | `#D97F00` | Dark Gold | Warning notice text/icon, secondary button_link |
| Gold Link | `#956B00` | — | action_card (secondary) link |
| Gold Surface | `#FAF8F2` | — | action_card (secondary) background |
| Gold Icon Background | `#F4F0E5` | — | action_card (secondary) icon background |

## Neutrals

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Black | `#212124` | Black | Headings, titles |
| White | `#FFFFFF` | White | Surfaces |
| Grey 800 | `#424242` | Grey 800 | Body on tinted backgrounds |
| Grey 700 | `#616161` | Grey 700 | Secondary body |
| Grey 600 | `#75767A` | Grey 600 | Inactive tab bar icons/labels |
| Grey Dark | `#75767A` | Grey Dark | Web nav items — **same hex as Grey 600** |
| Grey 90 | `#4C4C50` | Activity Detail Subtitle | Form labels, checkout body, secondary descriptions |
| Grey Light | `#D9DBE0` | Grey Light | Text field border, web header separators |
| Grey 300 | `#E0E0E0` | Grey 300 | Disabled button fill, general notice border, "End of the section" caption |
| Grey 200 | `#EAEAEA` | Grey 200 / Border | Card borders, list separators, bottom nav top border |
| Grey 50 | `#F9F9F9` | Grey 50 | Scaffold / card background |
| Grey Notice | `#F8F8F8` | — | General notice fill, disabled text field fill |
| Field Disabled Text | `#C5C9D0` | — | Disabled text field label and value |

Grey Light (`#D9DBE0`), Grey 300 (`#E0E0E0`) and Grey 200 (`#EAEAEA`) are **different**. Grey 50 is `#F9F9F9` — `#F8F8F8` is only for the general notice and disabled field.

## Status

| Semantic name | Hex | Style name | Usage |
|---------------|-----|------------|-------|
| Red | `#DC3224` | Red | Errors, destructive text, location outdated |
| Green | `#067E41` | Green | Success |
| Badge Red | `#FB7268` | — | "New" badge, unread dot |
| Focus Purple | `#4B4FA6` | — | Text field focus / hover / activated border |

## Notice sets

| Style | Fill | Border | Text + icon |
|-------|------|--------|-------------|
| information | `#EAF1FB` | `#B4D0F4` | `#2765BD` |
| error | `#FEECEA` | `#FCAAA3` | `#DC3224` |
| warning | `#FFF4E5` | `#FFD199` | `#D97F00` |
| general | `#F8F8F8` | `#E0E0E0` | `#212124` |

Info blue family (`#2F73D2` Tertiary Blue, `#2765BD` Tertiary Blue Hover, `#EAF1FB` Lighter Blue) is informational only — never for errors or CTAs.

## Overlays, toast, snackbar

| Semantic name | Value | Usage |
|---------------|-------|-------|
| Overlay | `rgba(0, 0, 0, 0.5)` | Modal, dialog, bottom sheet scrim |
| Snackbar | `#212124` bg, `#FFFFFF` text, `#67C1BF` action | Bottom snackbar |
| Toast Grey | `#E5E5E5` bg, `#636363` text | Top toast ("Profile updated", "Session expired") |

## Product & marketing accents

| Semantic name | Hex | Usage |
|---------------|-----|-------|
| Loyalty Surface | `#E9F9FA` | airasia points strip in account card |
| WhatsApp Green | `#4BD763` | WhatsApp action card (bg at 10% opacity) |
| USP Crimson | `#E31F52` | Landing page USP tile |
| USP Pink | `#FFA3A6` | Landing page USP tile |
| USP Indigo | `#3838A8` | Landing page USP tile |
| USP Orange | `#F99D1C` | Landing page USP tile |
| USP Forest | `#044532` | Landing page USP tile |
| USP Blue | `#1877F2` | Landing page USP tile |

### Package chips (bg / text)

| Chip | Background | Text |
|------|-----------|------|
| Green | `#DCFCE7` | `#16A34A` |
| Blue | `#DBEAFE` | `#2563EB` |
| Orange | `#FFF7ED` | `#F97316` |
| Red | `#FEE2E2` | `#DC2626` |

## Deprecated / external (do not use in new UI)

| Hex | Origin | Replace with |
|-----|--------|--------------|
| `#00938F` | External web library (TU/MMB "Dark Teal") | Primary Teal `#007F7C` |
| `#E94335` | External library "Branding/Red" | Red `#DC3224` |
| `#E30917` | Old error red | Red `#DC3224` |
| `#67C1BF` | Old button fill / outline | Primary Teal `#007F7C` (still valid as snackbar action text) |
| `#00B2A9` as CTA fill | Legacy screens | Primary Teal `#007F7C` |
| `#F8F8F8` as Grey 50 | Old token | Grey 50 `#F9F9F9` |
| `#F2F2F2`, `#787880`, `#6B7280` | iOS / MMB web styles | Nearest IKH grey |

Full legacy map: [legacy-migration.md](legacy-migration.md).

## Flutter mapping

```dart
abstract class IkhlasColors {
  // Teal
  static const primaryTeal = Color(0xFF007F7C);
  static const darkerTeal = Color(0xFF006260);
  static const secondaryTeal = Color(0xFF00B2A9);
  static const tealLinkAlt = Color(0xFF169D9A);
  static const tealSurface = Color(0xFFF0F9F9);
  static const tealPressedSurface = Color(0xFFE1F3F2);
  // Gold
  static const darkGold = Color(0xFFD97F00);
  static const goldLink = Color(0xFF956B00);
  static const goldSurface = Color(0xFFFAF8F2);
  static const goldIconBg = Color(0xFFF4F0E5);
  // Neutrals
  static const black = Color(0xFF212124);
  static const white = Color(0xFFFFFFFF);
  static const grey800 = Color(0xFF424242);
  static const grey700 = Color(0xFF616161);
  static const grey600 = Color(0xFF75767A);
  static const greyDark = grey600;
  static const grey90 = Color(0xFF4C4C50);
  static const greyLight = Color(0xFFD9DBE0);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey200 = Color(0xFFEAEAEA);
  static const grey50 = Color(0xFFF9F9F9);
  static const greyNotice = Color(0xFFF8F8F8);
  static const fieldDisabledText = Color(0xFFC5C9D0);
  // Status
  static const red = Color(0xFFDC3224);
  static const green = Color(0xFF067E41);
  static const badgeRed = Color(0xFFFB7268);
  static const focusPurple = Color(0xFF4B4FA6);
  // Info blue
  static const infoBlue = Color(0xFF2F73D2);
  static const infoBlueText = Color(0xFF2765BD);
  static const infoBlueBg = Color(0xFFEAF1FB);
  // Notice borders / fills
  static const noticeInfoBorder = Color(0xFFB4D0F4);
  static const noticeErrorBg = Color(0xFFFEECEA);
  static const noticeErrorBorder = Color(0xFFFCAAA3);
  static const noticeWarningBg = Color(0xFFFFF4E5);
  static const noticeWarningBorder = Color(0xFFFFD199);
  // Overlays
  static const overlay = Color(0x80000000);
  static const snackbarBg = Color(0xFF212124);
  static const snackbarAction = Color(0xFF67C1BF);
  static const toastBg = Color(0xFFE5E5E5);
  static const toastText = Color(0xFF636363);
  // Accents
  static const loyaltySurface = Color(0xFFE9F9FA);
  static const whatsappGreen = Color(0xFF4BD763);
}
```

## Next.js CSS variables

```css
:root {
  --ikh-primary-teal: #007f7c;
  --ikh-darker-teal: #006260;
  --ikh-secondary-teal: #00b2a9;
  --ikh-teal-link-alt: #169d9a;
  --ikh-teal-surface: #f0f9f9;
  --ikh-teal-pressed-surface: #e1f3f2;
  --ikh-dark-gold: #d97f00;
  --ikh-gold-link: #956b00;
  --ikh-gold-surface: #faf8f2;
  --ikh-gold-icon-bg: #f4f0e5;
  --ikh-black: #212124;
  --ikh-white: #ffffff;
  --ikh-grey-800: #424242;
  --ikh-grey-700: #616161;
  --ikh-grey-600: #75767a;
  --ikh-grey-dark: #75767a;
  --ikh-grey-90: #4c4c50;
  --ikh-grey-light: #d9dbe0;
  --ikh-grey-300: #e0e0e0;
  --ikh-grey-200: #eaeaea;
  --ikh-grey-50: #f9f9f9;
  --ikh-grey-notice: #f8f8f8;
  --ikh-field-disabled-text: #c5c9d0;
  --ikh-red: #dc3224;
  --ikh-green: #067e41;
  --ikh-badge-red: #fb7268;
  --ikh-focus-purple: #4b4fa6;
  --ikh-info-blue: #2f73d2;
  --ikh-info-blue-text: #2765bd;
  --ikh-info-blue-bg: #eaf1fb;
  --ikh-notice-info-border: #b4d0f4;
  --ikh-notice-error-bg: #feecea;
  --ikh-notice-error-border: #fcaaa3;
  --ikh-notice-warning-bg: #fff4e5;
  --ikh-notice-warning-border: #ffd199;
  --ikh-overlay: rgba(0, 0, 0, 0.5);
  --ikh-snackbar-bg: #212124;
  --ikh-snackbar-action: #67c1bf;
  --ikh-toast-bg: #e5e5e5;
  --ikh-toast-text: #636363;
  --ikh-loyalty-surface: #e9f9fa;
  --ikh-whatsapp-green: #4bd763;
}
```

## Rules

- Prefer semantic names over hex in code
- Filled primary CTA = Primary Teal `#007F7C`; pressed = Darker Teal `#006260`; disabled = Grey 300 `#E0E0E0` with white text
- Do not use the blue palette or Secondary Teal for CTAs
- Bottom nav inactive = Grey 600 (`#75767A`); active label = Black `#212124` Medium
- Errors and destructive actions = Red `#DC3224`, never `#E30917` or `#E94335`
