---
name: ikhlas-app-ui
description: >-
  Implements UI using the IKHLAS App design system. Maps design tokens to Flutter
  and Next.js code, reuses IKH components, and enforces spacing, color, and
  typography rules. Use when building IKHLAS app screens (Flutter mobile or
  Next.js web), auditing UI consistency, or when the user mentions IKHLAS, IKH,
  IDS, or IKHLAS App UI Styles.
references:
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
  - components/skeleton-ui
  - components/activity-detail
  - patterns/lists
  - patterns/forms
---

# IKHLAS App UI Design System

AI agent skill for **Flutter (mobile)** and **Next.js (web)**. Same design language, same tokens. Load `SKILL.md` at session start or when the user names this skill explicitly.

## When to load

Load when the user mentions:
- IKHLAS, IKH, IDS, Ikhlas App, ikhlas.com web
- Implementing IKHLAS app screens
- Flutter ThemeData / ThemeExtension for IKHLAS
- Next.js / Tailwind styling for IKHLAS web

## Quick start

1. Identify platform: **Flutter** → [references/flutter.md](references/flutter.md); **Next.js** → [references/nextjs.md](references/nextjs.md)
2. Resolve tokens from [references/tokens.md](references/tokens.md) — never use magic numbers
3. Look up component specs in [references/components/](references/components/) before building from scratch
4. Reuse existing project components before creating new ones
5. Validate against [playbook.md](playbook.md) audit checklist

## Token resolution rules

1. **Spacing:** Use `Spacing/space{N}` tokens only. No `space10` exists — map 10px to `space8` (tighter) or `space12` (more breathing room).
2. **Colors:** Prefer semantic names (Primary Teal, Grey 700) over raw hex. See [references/colors.md](references/colors.md).
3. **Typography:** DM Sans only. Use named text styles (H1–H4, Body, Caption). See [references/typography.md](references/typography.md).
4. **Radius:** Default card/action radius is **12px** (IKHLAS-3640). See [references/radius-shadows.md](references/radius-shadows.md).
5. **Platform mapping:** Every token has Flutter + Next.js equivalents in [references/tokens.md](references/tokens.md).

## Implement screen

### Gate protocol

1. Read the relevant component and pattern references for the screen
2. Map layout to platform tokens (not raw Tailwind from design exports)
3. Reuse library components where they exist in the codebase

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
| activity_detail sections | [references/components/activity-detail.md](references/components/activity-detail.md) |
| skeleton UI | [references/components/skeleton-ui.md](references/components/skeleton-ui.md) |
| header, IKHLAS Logo | [references/components/navigation.md](references/components/navigation.md) |
| info, notice | [references/components/feedback.md](references/components/feedback.md) |

## UI audit checklist

Copy from [playbook.md](playbook.md#ui-consistency-audit). Fail if:
- Raw hex/spacing px not mapped to tokens
- Wrong font (not DM Sans)
- Card radius ≠ 12px without design approval
- 10px spacing used instead of space8/space12

## Token refresh

When the design system updates:
1. Diff new token values against [references/tokens.md](references/tokens.md)
2. Update affected reference files
3. Keep SKILL.md under 500 lines

## Additional resources

- Brand & UX principles: [design.md](design.md)
- Task recipes: [playbook.md](playbook.md)
- Code examples: [examples/implementations.md](examples/implementations.md)
- Full docs index: [README.md](README.md)
