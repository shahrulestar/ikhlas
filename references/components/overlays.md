# Overlays

Bottom sheet, dialog, toast, snackbar and loading overlay. All modal surfaces sit on the overlay `rgba(0, 0, 0, 0.5)` with no shadow. Motion: [motion.md](../motion.md).

## Bottom sheet

| Property | Value |
|----------|-------|
| Surface | White, full width, top corners radius 12 |
| Drag handle (optional) | 40 × 6, radius 4, centred, 16 from top |
| Title row | 56 tall: title 16 Medium Black (left, padding 16) + close icon 24 (right, padding 16) |
| Separator | 1px Grey Light `#D9DBE0` under the title row |
| List items | 16px Regular Black, padding 16, min height 48 |
| Bottom | Home indicator safe area 34 |

Uses: "Help?" (Frequently asked questions · Contact IKHLAS), "How it works", booking summary, lafaz, select lists, reminders.

Older frames use radius 4 on the sheet — use 12.

## Dialog

| Property | Value |
|----------|-------|
| Surface | White, width 358 (16 screen margin), radius 12, padding 24 |
| Title | 16px Medium Black |
| Body | 14px Regular Grey 600, gap 8 below title |
| Actions | Row, gap 16, 24 below body: secondary (Cancel) left + primary right, each flex 1, height 48 |

Copy patterns:
- **Confirmation:** "Confirmation" / "Are you sure to delete your account?" / Cancel · Yes
- **Error:** "Oops! Something went wrong" / "We couldn't send your feedback… Please try again." / Cancel · Try Again
- **Update app:** title + body + primary "Update now" (+ secondary "Later" if optional)

For destructive confirmations the triggering action is a tertiary (Red) button; the confirm button stays primary.

## Toast (top)

| Property | Value |
|----------|-------|
| Position | Below the status bar, margin 16 |
| Surface | Toast Grey `#E5E5E5`, radius 12, padding 12 / 16 |
| Text | 14px Regular `#636363` (centred for single-line confirmations) |
| Behaviour | Auto-dismiss ~3s, no action |

Uses: "Profile updated", "Sorry. Your session has expired. Please log in again."

## Snackbar (bottom)

| Style | Surface | Text | Action |
|-------|---------|------|--------|
| text | `#212124` | 14 Regular white | — |
| text_action | `#212124` | 14 Regular white | 12 Medium `#67C1BF` uppercase ("ACTION") |
| text_action_icon | `#212124` | 14 Regular white + leading icon | optional |
| grey | `#E5E5E5` | 14 Regular `#636363` | — |

Size 358 × 45 (single line), radius 12, padding 12 / 16, 16 above the bottom nav. Example: "Reminder set for Birthday of Prophet Muhammad on 25 August 2026".

## Loading overlay (spinner)

- Shown while submitting a form or processing a payment
- The whole screen **including the navbar** is dimmed by the overlay and blocks input
- White circle (~80) with a Primary Teal / Secondary Teal arc spinner, centred
- Keyboard may stay open underneath

First-load loading uses skeletons instead ([skeleton-ui.md](skeleton-ui.md)).

## Flutter

```dart
showModalBottomSheet(
  context: context,
  barrierColor: IkhlasColors.overlay,
  shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.sheet),
  builder: (_) => const HelpSheet(),
);

showDialog(
  context: context,
  barrierColor: IkhlasColors.overlay,
  builder: (_) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: IkhlasRadius.card),
    insetPadding: const EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
    child: const ConfirmDeleteContent(),
  ),
);
```

## Next.js

Use Radix / shadcn `Dialog` and `Sheet` with overlay `bg-[var(--ikh-overlay)]`, content `rounded-[var(--ikh-radius-md)]` (sheet: `rounded-t-[var(--ikh-radius-md)]`). Toasts via `sonner` positioned `top-center` with the Toast Grey style.
