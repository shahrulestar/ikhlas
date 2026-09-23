# Motion

No motion/animation tokens are documented in the IKHLAS App UI design system yet.

## Defaults (when animation is needed)

Use sparingly — IKHLAS UI is calm and functional.

| Interaction | Suggested duration | Easing |
|-------------|-------------------|--------|
| Button press | 100–150ms | ease-out |
| Page transition (mobile) | 250–300ms | ease-in-out |
| Expand/collapse | 200ms | ease-out |
| Bottom sheet enter / exit | 250ms / 200ms | ease-out / ease-in |
| Overlay fade (scrim 50%) | 200ms | linear |
| Toast / snackbar in-out | 200ms, auto-dismiss ~3s | ease-out |
| Skeleton shimmer (optional) | 1200ms loop | linear |

## Behaviour notes

- **Bottom sheet:** slides up from the bottom edge over a 50% black overlay; tap on the overlay or the close icon dismisses it.
- **Dialog:** fades in centred over the overlay; never auto-dismisses.
- **Toast (top):** grey pill below the status bar for passive confirmations ("Profile updated") and session messages; auto-dismisses.
- **Snackbar (bottom):** dark bar above the bottom nav; may include one action; auto-dismisses.
- **Spinner overlay:** appears while submitting; the whole screen including the navbar is dimmed and non-interactive. See [patterns/states.md](patterns/states.md#loading).
- **Skeleton:** static blocks are acceptable; shimmer is optional and must stay subtle.

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
