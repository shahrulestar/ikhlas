# Typography Tokens

**Font family:** DM Sans (Google Fonts)

Load in Flutter via `google_fonts` package. Load in Next.js via `next/font/google`.

## Type scale

| Style name | Size | Weight | Line height | Usage |
|------------|------|--------|-------------|-------|
| H1 - 32px | 32 | Medium (500) | 42px | Prayer time clock, hero numbers |
| H2 - 24px | 24 | Medium (500) | 32px | Page titles, prices in cards |
| H3 - 20px | 20 | Medium (500) | 28px | Section titles, greetings, form section titles |
| H4 - 18px | 18 | Medium (500) | 25px | Content headings |
| 16px Body Text | 16 | Regular (400) | 24px | Primary body, list rows, section subtitles |
| 16px Body Text Medium | 16 | Medium (500) | 24px | Button labels, navbar title, card titles |
| 14px Sub Body Text | 14 | Regular (400) | 21px | Secondary body, settings group labels |
| 14px Sub Body Text Medium | 14 | Medium (500) | 21px | Compact button_link (Rate now) |
| 12px Caption Text | 12 | Regular (400) | 18px | Captions, notices, bottom nav labels |
| 12px Caption Text Medium | 12 | Medium (500) | 18px | Chips, labels, active bottom nav label |
| Arabic Text | 32 | Regular | 42px | Quran ayah / Arabic content (font: Arabic Typesetting) |

## Product card text (screen pattern)

| Role | Style |
|------|-------|
| Card title | 18px Medium, line-height 1.4, max 2 lines, ellipsis |
| Price | 24px Medium (e.g. "MYR 850") |
| Price unit | 14px Regular, Grey 600 (e.g. "per portion") |
| Label chip | 12px Medium, Black, on white pill |

## Legacy local styles (map to canonical)

Some working files use local styles with auto or 100% line height. Always map them:

| Local style | Use instead |
|-------------|-------------|
| 20px Title Medium | H3 - 20px |
| 16px Title Medium | 16px Body Text Medium |
| 14px Title Medium | 14px Sub Body Text Medium |
| 16px Description Regular | 16px Body Text |
| 14px Description Regular | 14px Sub Body Text |
| H2 with 36px line height | H2 - 24px (32px line height) |

## Text colors (pair with styles)

| Role | Color token |
|------|-------------|
| Headings | Black `#212124` |
| Body primary | Black or Grey 800 |
| Body secondary / section subtitle | Grey 700 `#616161` |
| Form labels, checkout body | Grey 90 `#4C4C50` |
| Nav / muted / captions | Grey Dark `#75767A` |
| Links | Primary Teal `#007F7C` |
| Info text | Tertiary Blue Hover `#2765BD` |
| Errors / destructive | Red `#DC3224` |

## Flutter

```dart
abstract class IkhlasTypography {
  static TextStyle h1 = GoogleFonts.dmSans(fontSize: 32, fontWeight: FontWeight.w500, height: 42/32);
  static TextStyle h2 = GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w500, height: 32/24);
  static TextStyle h3 = GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 28/20);
  static TextStyle h4 = GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w500, height: 25/18);
  static TextStyle body = GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400, height: 24/16);
  static TextStyle bodyMedium = GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500, height: 24/16);
  static TextStyle subBody = GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w400, height: 21/14);
  static TextStyle subBodyMedium = GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500, height: 21/14);
  static TextStyle caption = GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w400, height: 18/12);
  static TextStyle captionMedium = GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500, height: 18/12);
  // Arabic Typesetting is not on Google Fonts — bundle the font asset in the app.
  static const TextStyle arabic = TextStyle(fontFamily: 'ArabicTypesetting', fontSize: 32, height: 42/32);
}
```

## Next.js

```tsx
import { DM_Sans } from 'next/font/google';

const dmSans = DM_Sans({ subsets: ['latin'], weight: ['400', '500'] });

// Usage
<h3 className={`${dmSans.className} text-xl font-medium leading-7 text-[var(--ikh-black)]`}>
```

Or CSS:
```css
.ikh-h1 { font-family: var(--ikh-font); font-size: 32px; font-weight: 500; line-height: 42px; }
.ikh-h2 { font-family: var(--ikh-font); font-size: 24px; font-weight: 500; line-height: 32px; }
.ikh-h3 { font-family: var(--ikh-font); font-size: 20px; font-weight: 500; line-height: 28px; }
.ikh-h4 { font-family: var(--ikh-font); font-size: 18px; font-weight: 500; line-height: 25px; }
.ikh-caption-medium { font-family: var(--ikh-font); font-size: 12px; font-weight: 500; line-height: 18px; }
```

## Rules

- Never substitute system fonts for DM Sans in IKHLAS UI (Arabic Text is the only exception)
- Use named styles — don't invent font-size/weight pairs
- Malay and English share the same scale; Malay strings run longer — design for wrap or 2-line clamp (see [patterns/states.md](patterns/states.md#long-text))
