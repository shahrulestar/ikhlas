# Master Token Index

Single source of truth. Every token maps to **Flutter** and **Next.js**.

Detail docs: [colors.md](colors.md) | [spacing.md](spacing.md) | [typography.md](typography.md) | [radius-shadows.md](radius-shadows.md)

## Spacing

| Figma variable | Semantic | Value | Flutter | Next.js |
|--------------|----------|-------|---------|---------|
| Spacing/space2 | space2 | 2px | `IkhlasSpacing.space2` | `--ikh-space-2` |
| Spacing/space4 | space4 | 4px | `IkhlasSpacing.space4` | `--ikh-space-4` |
| Spacing/space8 | space8 | 8px | `IkhlasSpacing.space8` | `--ikh-space-8` |
| Spacing/space12 | space12 | 12px | `IkhlasSpacing.space12` | `--ikh-space-12` |
| Spacing/space16 | space16 | 16px | `IkhlasSpacing.space16` | `--ikh-space-16` |
| Spacing/space24 | space24 | 24px | `IkhlasSpacing.space24` | `--ikh-space-24` |
| Spacing/space32 | space32 | 32px | `IkhlasSpacing.space32` | `--ikh-space-32` |
| Spacing/space40 | space40 | 40px | `IkhlasSpacing.space40` | `--ikh-space-40` |
| Spacing/space48 | space48 | 48px | `IkhlasSpacing.space48` | `--ikh-space-48` |
| Spacing/space60 | space60 | 60px | `IkhlasSpacing.space60` | `--ikh-space-60` |
| Spacing/space64 | space64 | 64px | `IkhlasSpacing.space64` | `--ikh-space-64` |
| Spacing/space80 | space80 | 80px | `IkhlasSpacing.space80` | `--ikh-space-80` |

## Colors (confirmed hex)

| Figma style / name | Semantic | Value | Flutter | Next.js |
|--------------------|----------|-------|---------|---------|
| Primary Teal | primaryTeal | #007F7C | `IkhlasColors.primaryTeal` | `--ikh-primary-teal` |
| MMB colors/brand/Dark Teal | darkTeal | #00938F | `IkhlasColors.darkTeal` | `--ikh-dark-teal` |
| Secondary Teal | secondaryTeal | #00B2A9 | `IkhlasColors.secondaryTeal` | `--ikh-secondary-teal` |
| — | tealLinkAlt | #169D9A | `IkhlasColors.tealLinkAlt` | `--ikh-teal-link-alt` |
| — | tealSurface | #F0F9F9 | `IkhlasColors.tealSurface` | `--ikh-teal-surface` |
| Black | black | #212124 | `IkhlasColors.black` | `--ikh-black` |
| White | white | #FFFFFF | `IkhlasColors.white` | `--ikh-white` |
| Grey 800 | grey800 | #424242 | `IkhlasColors.grey800` | `--ikh-grey-800` |
| Grey 700 | grey700 | #616161 | `IkhlasColors.grey700` | `--ikh-grey-700` |
| Grey 600 / Neutral/Grey Dark | grey600 | #75767A | `IkhlasColors.grey600` | `--ikh-grey-600` |
| Primary/Grey/90 | grey90 | #4C4C50 | `IkhlasColors.grey90` | `--ikh-grey-90` |
| Neutral/Grey Light | greyLight | #D9DBE0 | `IkhlasColors.greyLight` | `--ikh-grey-light` |
| Grey 200 | grey200 | #EAEAEA | `IkhlasColors.grey200` | `--ikh-grey-200` |
| Grey 50 (notice fill) | grey50 | #F8F8F8 | `IkhlasColors.grey50` | `--ikh-grey-50` |
| Tertiary/Blue | infoBlue | #2F73D2 | `IkhlasColors.infoBlue` | `--ikh-info-blue` |
| Tertiary/Blue Hover | infoBlueText | #2765BD | `IkhlasColors.infoBlueText` | `--ikh-info-blue-text` |
| Lighter/Blue | infoBlueBg | #EAF1FB | `IkhlasColors.infoBlueBg` | `--ikh-info-blue-bg` |
| Branding/Red | red | #E94335 | `IkhlasColors.red` | `--ikh-red` |

Unresolved: Darker Teal, Grey 300, Dark Gold — see [colors.md](colors.md).

## Typography

| Figma style | Semantic | Flutter | Next.js class |
|-------------|----------|---------|---------------|
| H1 - 32px | h1 | `IkhlasTypography.h1` | `.ikh-h1` |
| H2 - 24px | h2 | `IkhlasTypography.h2` | `.ikh-h2` |
| H3 - 20px | h3 | `IkhlasTypography.h3` | `.ikh-h3` |
| H4 - 18px | h4 | `IkhlasTypography.h4` | `.ikh-h4` |
| 16px Body Text | body | `IkhlasTypography.body` | `.ikh-body` |
| 16px Body Text Medium | bodyMedium | `IkhlasTypography.bodyMedium` | `.ikh-body-medium` |
| 14px Sub Body Text | subBody | `IkhlasTypography.subBody` | `.ikh-sub-body` |
| 14px Sub Body Text Medium | subBodyMedium | `IkhlasTypography.subBodyMedium` | `.ikh-sub-body-medium` |
| 12px Caption Text | caption | `IkhlasTypography.caption` | `.ikh-caption` |

Font family: **DM Sans** → `IkhlasTypography.fontFamily` / `--ikh-font`

## Radius

| Semantic | Value | Flutter | Next.js |
|----------|-------|---------|---------|
| radius-sm | 4px | `IkhlasRadius.sm` | `--ikh-radius-sm` |
| radius-md | 12px | `IkhlasRadius.md` | `--ikh-radius-md` |

## Resolution quick reference

| Raw | Use instead |
|-----|-------------|
| 10px | space8 or space12 |
| #007F7C | primaryTeal |
| #00938F | darkTeal (CTA fill) |
| #00B2A9 | secondaryTeal |
| #EAEAEA | grey200 (not greyLight) |
| #75767A | grey600 / greyDark |
| #E94335 | red |
| 12px radius | radius-md |
