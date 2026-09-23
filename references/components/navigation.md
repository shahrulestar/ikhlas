# Navigation

## navbar (mobile, component_set)

Total height **92** = status bar 44 + header 48 (older screens use 86). Header padding 12 vertical / 16 horizontal.

| Variant | Background | Content |
|---------|-----------|---------|
| end with text | White | Back · title · trailing text link ("Help?", 16 Medium) |
| end with icon | White | Back · title · trailing icon(s) 24 (info, settings, share, favourite) |
| middle text | White | Back · centred title 16 Medium Black |
| middle text with icon | White | Back · centred title · trailing icon |
| logo only | White | Centred IKHLAS / product logo |
| all appear | White | Back · logo · trailing action |
| home guest | Secondary Teal `#00B2A9` | Logo · "Account" 16 Medium white |
| home login | Secondary Teal `#00B2A9` | Logo · avatar initials (12 Medium) |

- Detail pages (2026 pattern) may use a Secondary Teal navbar with white icons over a white content sheet (top radius 12). See [layout.md](../layout.md#detail-page-2026-pattern).
- Back and trailing icons are 24 × 24; title is 16px Body Medium Black.

## bottom bar menu (mobile, component_set)

Property `tab` = home | umrah | travel | activity | services.

| Property | Value |
|----------|-------|
| Height | 50 (+ 34 home indicator) |
| Top border | 1px Grey 200 `#EAEAEA` |
| Item width | 78 (5 equal items) |
| Icon | 26 bound / 18 glyph |
| Label | 12px, below icon |
| Active | Label 12 Medium Black `#212124`; icon filled Black |
| Inactive | Label 12 Regular Grey 600 `#75767A`; icon outline Grey 600 |

Active state is **Black**, not teal.

## icon + label (component_set)

Home quick actions (Prayer, Qibla, Quran, Qurban…).

| Variant | Spec |
|---------|------|
| default | 60 wide; 46px icon; label 14 Regular Black; gap 8 |
| no label | 46px icon only |
| with badge | "New" badge above icon: Badge Red `#FB7268`, radius full, padding 2 / 4, 8px white text; gap 2 |

Row of 4 tiles with **gap 30** inside a 334 container.

## title_link (component_set)

Section header link: H3 20 Medium Black + optional 24px chevron (gap 8). Pair with a 16px Grey 700 subtitle (gap 4). See [layout.md](../layout.md#home).

## Tabs

Primary and secondary tab bars: [tabs.md](tabs.md).

## header (web)

| Property | Value |
|----------|-------|
| Height | 66 (sticky; optional top bar makes the group 106) |
| Background | White, 1px Grey Light `#D9DBE0` bottom separator |
| Logo | IKHLAS Logo, ~136 × 26 |
| Menu gap | 24 |
| Menu text | 16px Regular, Grey Dark `#75767A` |
| Dropdown chevron | 24 |
| Language separator | 1px Grey Light, 32 tall |

## IKHLAS Logo

- Teal wordmark + gold ".com" on web; white on Secondary Teal navbars; muted grey above "End of the section"
- Use the SVG asset from the design system — never recreate in code

## btn_next

Circular 36 × 36 or 24 × 24 control for carousels and month navigation (teal-tinted circle with Primary Teal chevron).
