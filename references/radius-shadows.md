# Radius & Elevation

## Border radius

| Token | Value | Usage |
|-------|-------|-------|
| radius-sm | 4px | Text field, stepper, item thumbnails, small image in cards |
| radius-skeleton-text | 6px | Skeleton text blocks |
| radius-skeleton-image | 8px | Skeleton image blocks |
| radius-md | **12px** | Buttons, action_card, cards, notice, snackbar, dialog, settings groups, bottom sheet top corners, banner images |
| radius-pill | 24px | Info chips, primary chip, skeleton badge |
| radius-full | 9999px | Avatars, label chips on product images, badges, circular icon buttons |

**Default for cards, buttons and notices: 12px.** 4px on cards, buttons, notices or sheets is legacy — see [legacy-migration.md](legacy-migration.md).

Extracted from components:
- `action_card`: 12px, padding space16
- `button` (all types): 12px, padding 12px / 24px, height 48 (compact 40)
- `notice`: 12px with 1px border
- `snackbar`: 12px
- Text field: 4px
- Product image label chip: 40px (use radius-full)

## Flutter

```dart
abstract class IkhlasRadius {
  static const sm = Radius.circular(4);
  static const skeletonText = Radius.circular(6);
  static const skeletonImage = Radius.circular(8);
  static const md = Radius.circular(12);
  static const pill = Radius.circular(24);
  static const full = Radius.circular(9999);

  static BorderRadius card = BorderRadius.circular(12);
  static BorderRadius button = BorderRadius.circular(12);
  static BorderRadius notice = BorderRadius.circular(12);
  static BorderRadius field = BorderRadius.circular(4);
  static BorderRadius sheet = const BorderRadius.vertical(top: Radius.circular(12));
}
```

## Next.js

```css
:root {
  --ikh-radius-sm: 4px;
  --ikh-radius-skeleton-text: 6px;
  --ikh-radius-skeleton-image: 8px;
  --ikh-radius-md: 12px;
  --ikh-radius-pill: 24px;
  --ikh-radius-full: 9999px;
}
```

## Shadows / elevation

The design system has **no effect (shadow) styles**. Components use flat fills with borders or background tints.

| Pattern | Treatment |
|---------|-----------|
| Cards | White fill + 1px Grey 200 border, or tinted fill (Grey 50, Teal Surface, Gold Surface) — no shadow |
| Web header | White fill, 1px Grey Light bottom separator |
| Sticky footer / bottom nav | White fill + 1px Grey 200 top separator |
| Modal, dialog, bottom sheet | Overlay `rgba(0,0,0,0.5)` behind a white surface — no shadow |

Do not add shadows unless a design explicitly shows them. If shadow styles are added later, document them here as `--ikh-shadow-*`.
