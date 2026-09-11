---
name: ikhlas-app-ui
description: >-
  Implements UI using the IKHLAS App design system (Figma library Yi0hAYFAqMEDEvjhqA020v).
  Maps Figma tokens to Flutter and Next.js code, reuses IKH components, and enforces
  spacing, color, and typography rules. Use when building IKHLAS app screens (Flutter
  mobile or Next.js web), implementing Figma designs, auditing UI consistency, or when
  the user mentions IKHLAS, IKH, IDS, or IKHLAS App UI Styles.
references:
  - figma-source
  - tokens
  - colors
  - typography
  - spacing
  - radius-shadows
  - flutter
  - nextjs
  - components/buttons
  - components/cards
  - components/navigation
  - components/feedback
  - patterns/lists
  - patterns/forms
disable-model-invocation: true
---

# IKHLAS App UI Design System

Dual-platform skill for **Flutter (mobile)** and **Next.js (web)**. Same design language, same tokens.

## When to load

Load when the user mentions:
- IKHLAS, IKH, IDS, Ikhlas App, ikhlas.com web
- Implementing screens from the IKHLAS Figma library
- Flutter ThemeData / ThemeExtension for IKHLAS
- Next.js / Tailwind styling for IKHLAS web

## Quick start

1. Identify platform: **Flutter** → [references/flutter.md](references/flutter.md); **Next.js** → [references/nextjs.md](references/nextjs.md)
2. Resolve tokens from [references/tokens.md](references/tokens.md) — never use magic numbers
3. If a Figma URL is provided, load `figma-design-to-code` skill, then call `get_design_context`
4. Reuse existing project components before creating new ones
5. Validate against [playbook.md](playbook.md) audit checklist

## Figma source (read-only)

| Field | Value |
|-------|-------|
| File | IKHLAS App UI Styles |
| fileKey | `Yi0hAYFAqMEDEvjhqA020v` |
| libraryKey | `lk-d22f4ea0ae582208e0db86e002a131dc653b259a72c1be5a92b380efd7fe05cea4c5f713019724c5ccd8fa9c58c91580803549e0cab71a78a5d647ac0715e765` |
| Linked library | V6.0 - Figma Design Library |

**Do not edit Figma.** Read via MCP only: `search_design_system`, `get_metadata`, `get_design_context`, `get_variable_defs`.

Full node map: [references/figma-source.md](references/figma-source.md)

## Token resolution rules

1. **Spacing:** Use `Spacing/space{N}` tokens only. No `space10` exists — map 10px to `space8` (tighter) or `space12` (more breathing room).
2. **Colors:** Prefer semantic names (Primary Teal, Grey 700) over raw hex. See [references/colors.md](references/colors.md).
3. **Typography:** DM Sans only. Use named text styles (H1–H4, Body, Caption). See [references/typography.md](references/typography.md).
4. **Radius:** Default card/action radius is **12px** (IKHLAS-3640). See [references/radius-shadows.md](references/radius-shadows.md).
5. **Platform mapping:** Every token has Flutter + Next.js equivalents in [references/tokens.md](references/tokens.md).

## Implement screen from Figma

### Gate protocol

1. Parse URL → `fileKey` + `nodeId` (convert `-` to `:`)
2. Call `get_design_context` with `skillNames: figma-design-to-code`
3. Map output to platform tokens (not raw Tailwind from Figma export)
4. Reuse library components where they exist in the codebase

### Flutter branch

```dart
// Spacing
padding: EdgeInsets.all(IkhlasSpacing.space16)

// Color
color: IkhlasColors.primaryTeal

// Typography
style: IkhlasTypography.h3
```

See [references/flutter.md](references/flutter.md) for ThemeExtension setup.

### Next.js branch

```tsx
<div className="p-[var(--ikh-space-16)] rounded-[var(--ikh-radius-md)]">
  <p className="text-[var(--ikh-grey-700)] text-base">...</p>
</div>
```

See [references/nextjs.md](references/nextjs.md) for CSS vars + Tailwind v4 theme.

## Component lookup

| Component | Reference |
|-----------|-----------|
| button, button_link | [references/components/buttons.md](references/components/buttons.md) |
| action_card, user_greeting_card | [references/components/cards.md](references/components/cards.md) |
| header, IKHLAS Logo | [references/components/navigation.md](references/components/navigation.md) |
| info, notice | [references/components/feedback.md](references/components/feedback.md) |

Search Figma library: `search_design_system` with `includeLibraryKeys` set to the IKHLAS libraryKey above.

## UI audit checklist

Copy from [playbook.md](playbook.md#ui-consistency-audit). Fail if:
- Raw hex/spacing px not mapped to tokens
- Wrong font (not DM Sans)
- Card radius ≠ 12px without design approval
- 10px spacing used instead of space8/space12

## Token refresh

When Figma library updates:
1. Re-run `search_design_system` for variables and styles
2. Diff against [references/tokens.md](references/tokens.md)
3. Update reference files; keep SKILL.md under 500 lines

## Additional resources

- Brand & UX principles: [design.md](design.md)
- Task recipes: [playbook.md](playbook.md)
- Code examples: [examples/implementations.md](examples/implementations.md)
