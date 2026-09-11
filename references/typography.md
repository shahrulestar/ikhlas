# Typography Tokens

**Font family:** DM Sans (Google Fonts)

Load in Flutter via `google_fonts` package. Load in Next.js via `next/font/google`.

## Type scale

| Figma text style | Size | Weight | Line height | Usage |
|------------------|------|--------|-------------|-------|
| H1 - 32px | 32 | Medium* | — | Page titles |
| H2 - 24px | 24 | Medium* | — | Section headings |
| H3 - 20px | 20 | Medium (500) | 28px | Sub-headings, greetings |
| H4 - 18px | 18 | Medium* | — | Content headings |
| 16px Body Text | 16 | Regular (400) | 24px | Primary body |
| 16px Body Text Medium | 16 | Medium (500) | 24px | Emphasized body, nav links |
| 14px Sub Body Text | 14 | Regular (400) | 21px | Secondary body |
| 14px Sub Body Text Medium | 14 | Medium (500) | 21px | Compact actions (Rate now) |
| 12px Caption Text | 12 | Regular (400) | 18px (1.5) | Captions, info banners |
| 12px Caption Text Medium | 12 | Medium (500) | — | Caption emphasis |

*Heading weights: use Medium (500) unless Figma specifies otherwise.

## Text colors (pair with styles)

| Role | Color token |
|------|-------------|
| Headings | Black `#212124` |
| Body primary | Black or Grey 800 |
| Body secondary | Grey 700 `#616161` |
| Nav / muted | Grey Dark `#75767A` |
| Links | Primary Teal `#007F7C` |
| Info text | Tertiary Blue Hover `#2765BD` |

## Flutter

```dart
abstract class IkhlasTypography {
  static TextStyle h1 = GoogleFonts.dmSans(fontSize: 32, fontWeight: FontWeight.w500);
  static TextStyle h2 = GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w500);
  static TextStyle h3 = GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 28/20);
  static TextStyle h4 = GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle body = GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400, height: 24/16);
  static TextStyle bodyMedium = GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500, height: 24/16);
  static TextStyle subBody = GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w400, height: 21/14);
  static TextStyle subBodyMedium = GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500, height: 21/14);
  static TextStyle caption = GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5);
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
.ikh-h3 { font-family: var(--ikh-font); font-size: 20px; font-weight: 500; line-height: 28px; }
```

## Rules

- Never substitute system fonts for DM Sans in IKHLAS UI
- Use named styles — don't invent font-size/weight pairs
- Malay and English share the same scale
