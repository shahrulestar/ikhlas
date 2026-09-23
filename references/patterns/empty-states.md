# Empty State Patterns

All states (loading, offline, error, permission): [states.md](states.md).

## Pattern 1 — Illustration empty state

| Element | Token |
|---------|-------|
| Illustration | Centred, ~200px wide (support empty state 256 × 292) |
| Title | 16px Medium Black, centred (20 Medium for full-screen states) |
| Description | 14px Regular Grey 600, centred, max 2–3 lines |
| Action | Primary button, secondary pill, or button_link |
| Vertical gap | space8 title → description, space16 → action |
| Screen padding | space16 horizontal |

### Examples

| Screen | Title | Description | Action |
|--------|-------|-------------|--------|
| Inbox — Notification | "Your inbox is empty" | — | — |
| Inbox — Support | "No active chats yet" | "Have a question or an issue? Reach out to our support team or browse our guides below." | "Chat with Support", then "Get Help With..." category list |
| Inbox — Support (alt) | "Need some assistance?" | "Chat with our team by selecting an order in your Activity page, or find quick answers in the categories below." | "Go to Activity" |
| Calendar day | "Nothing Scheduled" | "Select another date to view events" | — |
| Bookmarks / saved | Title + short hint | — | Link back to browse |

## Pattern 2 — Promotional empty state

Used where an empty list is an opportunity to sell (Activity per product):

- action_card for that product, e.g. "Explore qurban packages" / "Discover local, international & delivery Qurban packages—easy and trusted" / "Explore now"
- Content starts 40 below the tab strip; "End of the section" 60 below the card

## Flutter

```dart
Center(
  child: Padding(
    padding: const EdgeInsets.all(IkhlasSpacing.space16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // illustration asset
        const SizedBox(height: IkhlasSpacing.space16),
        Text('No active chats yet', style: IkhlasTypography.bodyMedium, textAlign: TextAlign.center),
        const SizedBox(height: IkhlasSpacing.space8),
        Text(
          'Have a question or an issue? Reach out to our support team or browse our guides below.',
          style: IkhlasTypography.subBody.copyWith(color: IkhlasColors.grey600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: IkhlasSpacing.space16),
        // primary button
      ],
    ),
  ),
)
```

## Next.js

Centered flex column with `gap-[var(--ikh-space-8)]`, `max-w-sm`, `text-center`; action wrapped with an extra `mt-[var(--ikh-space-8)]`.
