# IKHLAS App UI — Cursor Agent Skill

A complete [Cursor Agent Skill](https://cursor.com/docs/agent/skills) for the **IKHLAS App UI Styles** design system. It teaches AI agents how to implement IKHLAS screens consistently across **Flutter (mobile)** and **Next.js (web)** using the same design tokens extracted from Figma.

**Figma source (read-only):** [IKHLAS App UI Styles](https://www.figma.com/design/Yi0hAYFAqMEDEvjhqA020v/IKHLAS-App-UI-Styles)

---

## What this repo is

This repository is the **canonical, version-controlled copy** of the `ikhlas-app-ui` skill. It contains:

- Agent orchestration (`SKILL.md`)
- Brand and UX principles (`design.md`)
- Task playbooks for implement / audit / refresh (`playbook.md`)
- Full token reference with Flutter + Next.js mappings (`references/`)
- Code examples (`examples/`)

The skill is derived entirely from the Figma library — no app codebase is required to use it.

---

## Quick install

### Option A — Personal skill (recommended)

Clone into your Cursor skills directory:

```bash
git clone https://github.com/shahrulestar/ikhlas.git ~/.cursor/skills/ikhlas-app-ui
```

### Option B — Project skill

Add as a submodule or copy into a project:

```bash
mkdir -p .cursor/skills
git clone https://github.com/shahrulestar/ikhlas.git .cursor/skills/ikhlas-app-ui
```

### Option C — Symlink from this repo

If you keep a local clone elsewhere:

```bash
ln -s /path/to/ikhlas ~/.cursor/skills/ikhlas-app-ui
```

After install, restart Cursor or start a new agent chat so the skill is discoverable.

---

## How to invoke

The skill uses `disable-model-invocation: true`, so **name it explicitly** in your prompt:

```
Use the ikhlas-app-ui skill to implement this action_card in Flutter
```

```
Use ikhlas-app-ui to build this IKHLAS web header in Next.js from Figma
```

Trigger terms the agent recognizes: **IKHLAS**, **IKH**, **IDS**, **IKHLAS App UI Styles**, or a Figma URL from the library.

When implementing from a Figma URL, also load the `figma-design-to-code` skill before calling `get_design_context`.

---

## Repository structure

```
ikhlas/
├── README.md                 ← You are here
├── SKILL.md                  ← Main agent instructions (<500 lines)
├── design.md                 ← Brand principles, do/don't, accessibility
├── playbook.md               ← Implement screen, UI audit, token refresh
├── examples/
│   └── implementations.md    ← Before/after Figma → code samples
└── references/
    ├── figma-source.md       ← File keys, node IDs, MCP guide
    ├── tokens.md             ← Master token index (Flutter + Next.js)
    ├── colors.md             ← Full color palette with hex
    ├── typography.md         ← DM Sans type scale
    ├── spacing.md            ← 4px grid (space2–space80)
    ├── radius-shadows.md     ← 12px card default, 4px info banner
    ├── motion.md             ← Motion defaults (no Figma motion tokens yet)
    ├── flutter.md            ← ThemeExtension, spacing, widgets
    ├── nextjs.md             ← CSS vars, Tailwind v4 @theme, fonts
    ├── components/
    │   ├── buttons.md        ← button, button_link
    │   ├── cards.md          ← action_card, user_greeting_card
    │   ├── navigation.md     ← header, logo, tab bar
    │   └── feedback.md       ← info, notice
    └── patterns/
        ├── lists.md          ← Carousels, settings lists
        ├── forms.md          ← Form tokens (input not in library)
        └── empty-states.md   ← Token-based empty state pattern
```

---

## Design system at a glance

### Platforms

| Platform | Stack | Reference |
|----------|-------|-----------|
| Mobile app | Flutter | [references/flutter.md](references/flutter.md) |
| Web | Next.js + Tailwind v4 | [references/nextjs.md](references/nextjs.md) |

Both platforms share the same semantic tokens. Layout differs (390px mobile vs ~1024px web content column).

### Figma library

| Field | Value |
|-------|-------|
| Name | IKHLAS App UI Styles |
| fileKey | `Yi0hAYFAqMEDEvjhqA020v` |
| libraryKey | `lk-d22f4ea0ae582208e0db86e002a131dc653b259a72c1be5a92b380efd7fe05cea4c5f713019724c5ccd8fa9c58c91580803549e0cab71a78a5d647ac0715e765` |
| Type | Figma Library (components + styles) |

Related product files:

| File | fileKey | Role |
|------|---------|------|
| WIP - IKH Customer App 2.0 | `r1ODKpGXGqwwDlOinO00ge` | Full app screens |
| HANDSHAKE - IKH Customer App 2.0 | `jE0BN6ZlWnn8kuHVTeCsZh` | Handoff screens |
| IKHLAS Design System (IDS) Research | `JZPpBdc5EyIgMJNsw48vEc` | FigJam research |

### Brand colors

| Token | Hex | Usage |
|-------|-----|-------|
| Primary Teal | `#007F7C` | Links, button_link text |
| Dark Teal | `#00938F` | Filled primary CTA |
| Secondary Teal | `#00B2A9` | Home header, logo accent |
| Teal Surface | `#F0F9F9` | action_card background |
| Black | `#212124` | Headings |
| Grey 700 | `#616161` | Secondary body |
| Grey 600 / Grey Dark | `#75767A` | Inactive tab bar, web nav |
| Grey 200 | `#EAEAEA` | Mobile borders (not Grey Light) |
| Grey Light | `#D9DBE0` | Web header separators |
| Info Blue | `#2F73D2` | Info banner border |
| Red | `#E94335` | Errors, alerts |

Full palette: [references/colors.md](references/colors.md)

### Spacing (4px grid)

`space2`, `space4`, `space8`, `space12`, `space16`, `space24`, `space32`, `space40`, `space48`, `space60`, `space64`, `space80`

**No `space10`.** Map 10px to `space8` (tighter) or `space12` (more breathing room).

Full table: [references/spacing.md](references/spacing.md)

### Typography

**DM Sans** only (Regular 400, Medium 500).

| Style | Size | Usage |
|-------|------|-------|
| H1 | 32px | Page titles |
| H2 | 24px | Section headings |
| H3 | 20px | Sub-headings, greetings |
| Body | 16px | Primary body |
| Sub Body | 14px | Secondary body |
| Caption | 12px | Captions, info banners |

Full scale: [references/typography.md](references/typography.md)

### Radius

| Token | Value | Usage |
|-------|-------|-------|
| radius-sm | 4px | Info banners |
| radius-md | 12px | Cards, CTAs (IKHLAS-3640) |

### Components in library

| Component | Type | Reference |
|-----------|------|-----------|
| button | component_set | [components/buttons.md](references/components/buttons.md) |
| button_link | component_set | [components/buttons.md](references/components/buttons.md) |
| action_card | component_set | [components/cards.md](references/components/cards.md) |
| user_greeting_card | component_set | [components/cards.md](references/components/cards.md) |
| info | component | [components/feedback.md](references/components/feedback.md) |
| notice | component_set | [components/feedback.md](references/components/feedback.md) |
| header | instance | [components/navigation.md](references/components/navigation.md) |
| IKHLAS Logo | component_set | [components/navigation.md](references/components/navigation.md) |
| icon + label | component_set | [components/navigation.md](references/components/navigation.md) |

---

## Flutter quick start

```dart
// Spacing
padding: EdgeInsets.all(IkhlasSpacing.space16)

// Color
color: IkhlasColors.primaryTeal

// Typography
style: IkhlasTypography.h3
```

See [references/flutter.md](references/flutter.md) for `ThemeExtension` setup and widget patterns.

---

## Next.js quick start

```tsx
<div className="rounded-[var(--ikh-radius-md)] bg-[var(--ikh-teal-surface)] p-[var(--ikh-space-16)]">
  <p className="text-base font-medium text-[var(--ikh-black)]">Title</p>
  <p className="text-sm text-[var(--ikh-grey-800)]">Subtitle</p>
</div>
```

See [references/nextjs.md](references/nextjs.md) for CSS vars, Tailwind v4 `@theme`, and DM Sans loading.

---

## Agent workflows

| Task | Guide |
|------|-------|
| Implement screen from Figma | [playbook.md](playbook.md) → Implement screen |
| UI consistency audit | [playbook.md](playbook.md) → UI audit checklist |
| Refresh tokens after Figma update | [playbook.md](playbook.md) → Token refresh |
| Brand / UX rules | [design.md](design.md) |

---

## Updating the skill

When the Figma library changes:

1. Re-run Figma MCP extraction (`search_design_system`, `get_variable_defs` on bound instances)
2. Update `references/tokens.md` and affected reference files
3. Commit and push to this repo
4. Pull or re-clone into `~/.cursor/skills/ikhlas-app-ui`

**Do not edit Figma from the skill.** Read-only via MCP.

---

## Known gaps

These Figma fill styles exist but hex was not bound on any instance during extraction:

| Style | Intended use |
|-------|--------------|
| Darker Teal | Pressed/clicked CTA |
| Grey 300 | Disabled button |
| Dark Gold | Secondary link |

To resolve: select the relevant instance in Figma desktop, then run `get_variable_defs` via Figma MCP.

Input `component_set` is not in this library — check the Customer App file (`r1ODKpGXGqwwDlOinO00ge`) for form fields.

---

## License

Internal IKHLAS design system documentation. Figma assets remain property of IKHLAS / respective owners.

---

## Links

- **GitHub:** https://github.com/shahrulestar/ikhlas
- **Figma library:** https://www.figma.com/design/Yi0hAYFAqMEDEvjhqA020v/IKHLAS-App-UI-Styles
- **IKHLAS:** https://ikhlas.com
