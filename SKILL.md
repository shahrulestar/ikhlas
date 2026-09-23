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
  - layout
  - motion
  - legacy-migration
  - flutter
  - nextjs
  - components/buttons
  - components/cards
  - components/product-card
  - components/navigation
  - components/tabs
  - components/text-field
  - components/feedback
  - components/overlays
  - components/calendar
  - components/skeleton-ui
  - components/activity-detail
  - patterns/states
  - patterns/empty-states
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
3. Pick the screen recipe in [references/layout.md](references/layout.md) (Home, landing, detail, checkout, settings, activity)
4. Look up component specs in [references/components/](references/components/) before building from scratch
5. Design every required state from [references/patterns/states.md](references/patterns/states.md)
6. Reuse existing project components before creating new ones
7. Validate against [playbook.md](playbook.md) audit checklist

## Token resolution rules

1. **Spacing:** Use `Spacing/space{N}` tokens only. No `space10` exists — map 10px to `space8` (tighter) or `space12` (more breathing room). Layout rhythm: 16 margin, 40 between sections, 60 before "End of the section".
2. **Colors:** Prefer semantic names (Primary Teal, Grey 700) over raw hex. **Filled CTA = Primary Teal `#007F7C`** (pressed `#006260`, disabled `#E0E0E0`). Secondary Teal `#00B2A9` is for headers/navbars only. Errors = Red `#DC3224`. See [references/colors.md](references/colors.md).
3. **Typography:** DM Sans only (Arabic Text for Quran content). Use named text styles (H1–H4, Body, Sub Body, Caption). See [references/typography.md](references/typography.md).
4. **Radius:** Buttons, cards, notices, dialogs and sheets use **12px** (IKHLAS-3640); text fields 4px; chips 24px. See [references/radius-shadows.md](references/radius-shadows.md).
5. **Elevation:** No shadows — flat fills, 1px Grey 200 borders, 50% black overlay for modals.
6. **Platform mapping:** Every token has Flutter + Next.js equivalents in [references/tokens.md](references/tokens.md).

## IDS wins over legacy screens

Many existing screens predate the design system components (Secondary Teal CTAs, 4px radius, borderless notices). **When a screen and an IDS component disagree, implement the IDS component** and report the screen value as legacy. Map: [references/legacy-migration.md](references/legacy-migration.md).

## Implement screen

### Gate protocol

1. Read the screen recipe, component and pattern references for the screen
2. Map layout to platform tokens (not raw Tailwind from design exports)
3. Reuse library components where they exist in the codebase
4. Cover loading, empty, offline, error and (if relevant) permission and guest states

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
| product card, banner slider, USP grid, info chip, event card | [references/components/product-card.md](references/components/product-card.md) |
| navbar, bottom bar menu, icon + label, title_link, web header, logo | [references/components/navigation.md](references/components/navigation.md) |
| primary / secondary tabs, badges | [references/components/tabs.md](references/components/tabs.md) |
| text field, phone, password, stepper, checkbox, radio | [references/components/text-field.md](references/components/text-field.md) |
| notice | [references/components/feedback.md](references/components/feedback.md) |
| bottom sheet, dialog, toast, snackbar, spinner | [references/components/overlays.md](references/components/overlays.md) |
| events calendar | [references/components/calendar.md](references/components/calendar.md) |
| skeleton UI | [references/components/skeleton-ui.md](references/components/skeleton-ui.md) |
| activity_detail sections | [references/components/activity-detail.md](references/components/activity-detail.md) |
| settings group, prayer_time_heading, inbox rows | [references/patterns/lists.md](references/patterns/lists.md) |
| form layout, validation | [references/patterns/forms.md](references/patterns/forms.md) |
| loading, offline, empty, error, permission states | [references/patterns/states.md](references/patterns/states.md) |

## UI audit checklist

Copy from [playbook.md](playbook.md#ui-consistency-audit). Fail if:
- Raw hex/spacing px not mapped to tokens
- Wrong font (not DM Sans)
- Filled CTA not Primary Teal `#007F7C` (e.g. `#00B2A9`, `#00938F`)
- Button, card or notice radius ≠ 12px without design approval
- Errors not in Red `#DC3224`
- 10px spacing used instead of space8/space12
- Missing loading / empty / offline / error state
- Scrolling screen without "End of the section" footer

## Token refresh

When the design system updates:
1. Diff new token values against [references/tokens.md](references/tokens.md)
2. Update affected reference files and [references/legacy-migration.md](references/legacy-migration.md)
3. Never store design-tool URLs, file keys, node IDs or component keys in this repo — refer to components and screens by name
4. Keep SKILL.md under 500 lines

## Additional resources

- Brand & UX principles: [design.md](design.md)
- Task recipes: [playbook.md](playbook.md)
- Code examples: [examples/implementations.md](examples/implementations.md)
- Full docs index: [README.md](README.md)
