# Feedback Components

## info (component / banner)

**Reference node:** `377:10952`

Informational banner for contextual help (e.g. Zakat calculator).

| Property | Value |
|----------|-------|
| Background | Lighter Blue `#EAF1FB` |
| Border | 1px Tertiary Blue `#2F73D2` |
| Radius | 4px (radius-sm) |
| Padding | 16px horizontal, 8px vertical |
| Icon | info_outline 24px |
| Text | 12px Caption, Tertiary Blue Hover `#2765BD` |
| Icon-text gap | space8 |

### Flutter

`IkhlasInfoBanner`

### Next.js

See info banner in [nextjs.md](../nextjs.md).

---

## notice (component_set)

**componentKey:** `a011d8386869f67b28cac518c3ef8eef4f6e41c0`  
**Reference node:** `1503:19843`

| Property | Value |
|----------|-------|
| Background | `#F8F8F8` (treat as Grey 50) |
| Radius | 4px |
| Padding | 16px / 8px |
| Text | Caption 12px, Black `#212124` |
| Gap | space8 |

---

## Error / alert colors

| Style | Hex | Usage |
|-------|-----|-------|
| Branding/Red | `#E94335` | Alerts, errors |
| Tertiary Blue family | `#2F73D2` / `#EAF1FB` | Information only — not errors |

Do not use blue banners for error states.
