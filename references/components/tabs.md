# Tabs

One standard tab system for the whole app (Inbox, Activity, Umrah Guide, Events). Behaviour follows Material Design 3 tabs. Do not introduce other tab libraries or styles.

## Primary tab — style 1 (text colour)

| Property | Value |
|----------|-------|
| Height | 48, full width (390) |
| Label | 16px Body Medium |
| Active label | Primary Teal `#007F7C` |
| Inactive label | Grey 600 `#75767A` |
| Indicators | Optional red dot or count badge next to the label |

Variants: default · red dot (one or both tabs) · badge (count) · red dot + badge.

## Primary tab — style 2 (underline)

| Property | Value |
|----------|-------|
| Height | 48 |
| Label | 16px Body Medium; active Primary Teal, inactive Grey 600 |
| Active indicator | 2px bottom border, Secondary Teal `#00B2A9`, full tab width |
| Divider | 1px Grey 200 under the whole bar |

Used for two-tab screens such as "Calendar | Events" and "Notification | Support".

## Secondary tab (scrollable strip)

Horizontal strip under a primary tab or navbar.

| Property | Value |
|----------|-------|
| Height | 56, background Grey 50 `#F9F9F9` |
| Padding | 16 vertical; items gap 16; scrolls horizontally |
| Active label | 16px Medium, Primary Teal |
| Inactive label | 16px Regular, Black |

Groupings in use:
- **By line of business:** All · Umrah · Travel · Qurban · Aqiqah · Zakat · Sadaqah · Fidyah
- **By content type:** All · News · Promotions · Reminders

Older Activity frames show the active label in Secondary Teal — use Primary Teal ([legacy-migration.md](../legacy-migration.md)).

## Badges and dots

| Indicator | Spec |
|-----------|------|
| Red dot | 8px circle, Badge Red `#FB7268` |
| Count badge | Pill, Red, 12px white text (e.g. "25") |

## Flutter

```dart
TabBar(
  labelStyle: IkhlasTypography.bodyMedium,
  unselectedLabelStyle: IkhlasTypography.bodyMedium,
  labelColor: IkhlasColors.primaryTeal,
  unselectedLabelColor: IkhlasColors.grey600,
  indicator: const UnderlineTabIndicator(
    borderSide: BorderSide(width: 2, color: IkhlasColors.secondaryTeal),
  ),
  indicatorSize: TabBarIndicatorSize.tab,
  dividerColor: IkhlasColors.grey200,
  tabs: const [Tab(text: 'Calendar'), Tab(text: 'Events')],
)
```

For style 1, set `indicator: const BoxDecoration()` (no underline).

## Next.js

```tsx
<div role="tablist" className="flex h-12 border-b border-[var(--ikh-grey-200)]">
  {tabs.map((tab) => (
    <button
      key={tab.id}
      role="tab"
      aria-selected={tab.id === active}
      className="flex-1 border-b-2 border-transparent text-base font-medium text-[var(--ikh-grey-600)] aria-selected:border-[var(--ikh-secondary-teal)] aria-selected:text-[var(--ikh-primary-teal)]"
    >
      {tab.label}
    </button>
  ))}
</div>
```

Keep the active tab in the URL with `nuqs` on web.
