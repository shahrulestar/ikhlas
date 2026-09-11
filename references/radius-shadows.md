# Radius & Elevation

## Border radius

| Token | Value | Usage |
|-------|-------|-------|
| radius-sm | 4px | Info banners, small chips |
| radius-md | **12px** | action_card, primary CTA buttons, cards (IKHLAS-3640) |
| radius-full | 50% / 9999px | Circular icon buttons (btn_next 36×36) |

**Default for cards and primary buttons: 12px.**

Extracted from components:
- `action_card`: `rounded-[12px]`, padding space16
- Primary CTA (`1167:26190`): `rounded-[12px]`, px 24px, py 11px
- `info` banner: `rounded-[4px]`

## Flutter

```dart
abstract class IkhlasRadius {
  static const sm = Radius.circular(4);
  static const md = Radius.circular(12);  // default card
  static BorderRadius card = BorderRadius.circular(12);
  static BorderRadius button = BorderRadius.circular(12);
  static BorderRadius info = BorderRadius.circular(4);
}
```

## Next.js

```css
:root {
  --ikh-radius-sm: 4px;
  --ikh-radius-md: 12px;
}
```

## Shadows / elevation

No dedicated shadow tokens found in Figma variable search. Components use flat fills with border or background tint rather than drop shadows.

| Pattern | Treatment |
|---------|-----------|
| Cards | Background fill (Grey 50 or Teal Surface), no shadow |
| Web header | White fill, 1px bottom implied by layout |
| Sticky elements | Flat — avoid adding shadows unless Figma shows them |

If shadows appear in future Figma updates, document here and map to `--ikh-shadow-*`.
