# Spacing Tokens

4px base grid. Figma collection: **Tokens** → `Spacing/space{N}`.

## Token table

| Figma variable | px | Flutter | Next.js CSS | Tailwind (approx) |
|--------------|-----|---------|-------------|-------------------|
| Spacing/space2 | 2 | `IkhlasSpacing.space2` | `--ikh-space-2` | `0.5` (2px) |
| Spacing/space4 | 4 | `IkhlasSpacing.space4` | `--ikh-space-4` | `1` (4px) |
| Spacing/space8 | 8 | `IkhlasSpacing.space8` | `--ikh-space-8` | `2` (8px) |
| Spacing/space12 | 12 | `IkhlasSpacing.space12` | `--ikh-space-12` | `3` (12px) |
| Spacing/space16 | 16 | `IkhlasSpacing.space16` | `--ikh-space-16` | `4` (16px) |
| Spacing/space24 | 24 | `IkhlasSpacing.space24` | `--ikh-space-24` | `6` (24px) |
| Spacing/space32 | 32 | `IkhlasSpacing.space32` | `--ikh-space-32` | `8` (32px) |
| Spacing/space40 | 40 | `IkhlasSpacing.space40` | `--ikh-space-40` | `10` (40px) |
| Spacing/space48 | 48 | `IkhlasSpacing.space48` | `--ikh-space-48` | `12` (48px) |
| Spacing/space60 | 60 | `IkhlasSpacing.space60` | `--ikh-space-60` | `15` (60px) |
| Spacing/space64 | 64 | `IkhlasSpacing.space64` | `--ikh-space-64` | `16` (64px) |
| Spacing/space80 | 80 | `IkhlasSpacing.space80` | `--ikh-space-80` | `20` (80px) |

## Usage patterns (from components)

| Context | Token |
|---------|-------|
| Screen horizontal padding (mobile) | space16 |
| Card internal padding | space16 |
| Stack gap between title + body | space8 |
| Header element gap | space4 |
| Web header menu gap | space24 |
| Info banner padding | space16 horizontal, space8 vertical |
| Icon + text gap | space8 |

## Rules

1. **No space10** — use space8 or space12
2. Prefer space16 as default screen/card padding on mobile
3. Use space8 for tight inline groups (icon + label, title stack)
4. Web content column offset often 208px (layout constant, not a spacing token)

## Figma CSS variable syntax

In design context exports, spacing appears as:
```css
var(--spacing/space16, 16px)
```
Map to platform tokens, not the slash syntax.
