# Navigation

## header (web)

**Reference node:** `1167:26501`

### Spec

| Property | Value |
|----------|-------|
| Height | 66px (sticky) |
| Background | White |
| Logo | IKHLAS Logo component, ~136×26 |
| Menu gap | 24px |
| Menu text | 16px Regular, Grey Dark `#75767A` |
| Dropdown chevron | 24px |
| Language separator | 1px Grey Light `#D9DBE0`, 32px height |

### Flutter (mobile app bar)

- Different from web header — use app-specific header component from Customer App file
- Secondary Teal for top bar (non-CTA) per fill style description

## IKHLAS Logo (component_set)

**componentKey:** `8db94a9a22a8f8e44f7634f0edbf9c61228cf837`

- Teal wordmark + gold ".com" on web
- Use SVG asset from design system, never recreate in code

## icon + label (component_set)

**componentKey:** `794a22d596258d757491b5599b4ed937be5d4013`

Quick action grid on home screen:
- 60×75 tap target
- Icon + label stack
- Horizontal spacing ~30px between items (custom layout, not a spacing token)

## title_link (component_set)

**componentKey:** `1e71a676e4af16e2d9fe8f01c83011e1452788c8`

Section headers with "See all" action.

## Tab bar (mobile)

- Icon color: Grey 600 (tab bar icons fill style)
- Active state: Primary Teal

## btn_next

Circular 36×36 or 24×24 navigation control for horizontal carousels.
