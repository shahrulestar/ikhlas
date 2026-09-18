# Motion

No motion/animation tokens are documented in the IKHLAS App UI design system yet.

## Defaults (when animation is needed)

Use sparingly — IKHLAS UI is calm and functional.

| Interaction | Suggested duration | Easing |
|-------------|-------------------|--------|
| Button press | 100–150ms | ease-out |
| Page transition (mobile) | 250–300ms | ease-in-out |
| Expand/collapse | 200ms | ease-out |

## Flutter

```dart
const kIkhlasAnimationDuration = Duration(milliseconds: 200);
```

## Next.js / CSS

```css
.ikh-transition { transition: opacity 150ms ease-out, transform 150ms ease-out; }
```

## Refresh

If motion tokens are added to the design system, document duration and easing values here.
