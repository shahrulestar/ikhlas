# List Patterns

## Horizontal card carousel

Used for stories, sadaqah cards, travel promos.

| Property | Mobile | Web |
|----------|--------|-----|
| Card width | 160–244px | 244–308px |
| Card gap | 16px | 16–24px |
| Section header | H3/H4 + optional title_link | Same |
| Navigation | btn_next 36×36 at trailing edge | btn_next or arrow link |

```dart
// Flutter
ListView.separated(
  scrollDirection: Axis.horizontal,
  padding: EdgeInsets.symmetric(horizontal: IkhlasSpacing.space16),
  separatorBuilder: (_, __) => SizedBox(width: IkhlasSpacing.space16),
  itemBuilder: ...
)
```

## Settings group (grouped list card)

Used on Account, Settings, Prayer Time Settings and Notifications screens.

| Property | Value |
|----------|-------|
| Card | White, 1px Grey 200 border, radius 12, padding 16 |
| Group gap | 16 between cards |
| Group label | 14px Sub Body, Grey 600 (e.g. "Account details", "Settings", "General") |
| Row | 16px Body, Black; min height 48; horizontal padding 16 |
| Trailing | Chevron 24 (navigation), toggle, radio (22px) or tick icon |
| Separator | 1px Grey 200 between rows; none after the last row |

Older frames show radius 4 and 18px padding — legacy ([legacy-migration.md](../legacy-migration.md)).

### Row trailing controls

| Control | Spec |
|---------|------|
| Toggle on | Track Primary Teal family, white knob |
| Toggle off / disabled | Track grey at 16% (`#787880`), knob white; row label turns Grey 600 when disabled |
| Radio / select | 22px circle outline `#787880` at 16%; selected = Teal Link Alt `#169D9A` filled tick |
| Chevron | 24px, Grey 600 |

When a permission is blocked, place an error notice at the top of the group and fade the dependent rows ([patterns/states.md](states.md#permission-denied)).

## Account header card

- Avatar 70 (circle, initials 22 Regular white on a colour fill) + name 16 Medium
- Loyalty strip: Loyalty Surface `#E9F9FA`, 3 columns (points, member ID, tier), labels 12 Grey 600 / values 12 Black
- "Powered by" caption 12 Grey 600 + partner logo

## Link row (button variant)

Text + chevron, full width row:
- Text: bodyMedium, grey90 or black
- Trailing icon: 24px
- Gap: space8

## prayer_time_heading (component_set)

| State | Line 1 | Line 2 | Action |
|-------|--------|--------|--------|
| located | "Today, 15 Nov 2023" H3 Black | "Prayer times in Kuala Lumpur" 16 Grey 700 | "Change location" button_link |
| locating | same | "Locating..." 16 Grey 700 | same |
| location_outdated | same | "Location outdated" 16 Red `#DC3224` | same |

Layout: column, gap 4, left padding 16; a 24px refresh icon may sit at the trailing edge.

## Inbox / message rows

| Variant | Title | Preview | Time |
|---------|-------|---------|------|
| new (unread) | 16 SemiBold Black | 14 Regular Black | 12 SemiBold Black |
| default (read) | 16 Regular Black | 14 Regular Grey 90 | 12 Regular Black |

Unread rows may sit on a tinted band; unread counts use a red badge ([tabs.md](../components/tabs.md)).

## icon + label grid

Home quick actions:
- 4 tiles, 60px wide each, gap 30 (container 334)
- Vertical: 46px icon + 14px label, gap 8
- Spec: [navigation.md](../components/navigation.md#icon--label-component_set)
