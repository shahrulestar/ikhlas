# Buttons

Figma component sets: `button`, `button_link`

## button (component_set)

**componentKey:** `f787ec21f3b177cba65af187755153bac9cd63b5`

### Variants observed

| Variant | Appearance | Tokens |
|---------|------------|--------|
| Primary CTA | Filled Dark Teal `#00938F`, white text, 12px radius | darkTeal, bodyMedium, px 24, py 11 |
| Pressed CTA | Darker Teal fill | style exists; hex not bound on Issues page |
| Disabled | Grey 300 fill | style exists; hex not bound on Issues page |
| Link + chevron | Grey90 text `#4C4C50`, 24px chevron, gap space8 | bodyMedium, grey90 |
| button_link | Teal text, 20–24px icon, gap space8 | primaryTeal `#007F7C` or tealLinkAlt `#169D9A` |

### Primary CTA spec (node 1167:26190)

```
Background: #00938F (Dark Teal)
Text: white, 16px Medium, line-height 24px
Padding: 24px horizontal, 11px vertical
Radius: 12px
```

### Flutter

```dart
// Primary
FilledButton(...)

// Link style
TextButton.icon(
  icon: Icon(Icons.chevron_right, size: 24),
  label: Text('Rate now', style: IkhlasTypography.subBodyMedium.copyWith(color: IkhlasColors.primaryTeal)),
)
```

### Next.js

See [nextjs.md](../nextjs.md) Primary CTA and button_link patterns.

## button_link (component_set)

**componentKey:** `c751e279349b3080dc640e782d3b8e10fbe8b01e`

- Teal text + trailing icon (20px in action_card, 24px in greeting card)
- No background fill
- Used for secondary actions: "Rate now", "Change location", "Lihat lagi"

## Disabled state

Use Grey 300 fill style (see [colors.md](../colors.md)). Do not reduce opacity alone.

## Don't

- Use blue for primary CTAs
- Use radius other than 12px for filled buttons without design approval
- Stack multiple primary CTAs in one view
