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

## Settings / menu list

From Issues page stickies (IKHLAS UI enhancements):
- List item horizontal padding: **space16**
- Corner radius on grouped items: **12px**
- Separator between items: Grey 200 border or 1px line

## Link row (button variant)

Text + chevron, full width row:
- Text: bodyMedium, grey90 or black
- Trailing icon: 24px
- Gap: space8

## icon + label grid

Home quick actions:
- 4 columns on mobile (~60px wide cells)
- Vertical: icon + caption label
- Row gap between cells: ~30px (layout-specific)
