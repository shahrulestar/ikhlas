# Motion

No motion/animation tokens were found in the IKHLAS App UI Styles Figma library via MCP search.

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

If Figma adds motion tokens, re-run `search_design_system` for "duration" or "easing" and update this file.
