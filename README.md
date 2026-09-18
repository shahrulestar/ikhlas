# IKHLAS App UI — AI Agent Skill

A structured skill package for AI coding agents working on the **IKHLAS App UI** design system. It teaches agents how to implement IKHLAS screens consistently across **Flutter (mobile)** and **Next.js (web)** using shared design tokens, component specs, and platform guides.

---

## What this repo is

This repository is the **canonical, version-controlled copy** of the `ikhlas-app-ui` agent skill. It is not tied to a single IDE or agent product — any AI agent that can load markdown instructions and reference files can use it.

| File / folder | Purpose |
|---------------|---------|
| [SKILL.md](SKILL.md) | Main agent instructions — load this first |
| [design.md](design.md) | Brand principles, UX rules, do/don't |
| [playbook.md](playbook.md) | Task recipes: implement screens, audit UI, token refresh |
| [references/](references/) | Tokens, colors, typography, platform guides, components |
| [examples/](examples/) | Before/after design export → code samples |

No app codebase is required to use this skill. All token values and component specs are documented in the reference files.

---

## Documentation index

### Core guides

| Doc | Description |
|-----|-------------|
| [SKILL.md](SKILL.md) | Entry point — when to load, quick start, component lookup |
| [design.md](design.md) | Brand identity, visual language, accessibility |
| [playbook.md](playbook.md) | Implement screens, UI audit checklist, token resolution |

### Design tokens

| Doc | Description |
|-----|-------------|
| [references/tokens.md](references/tokens.md) | Master token index (Flutter + Next.js) |
| [references/colors.md](references/colors.md) | Full color palette with hex and semantic names |
| [references/typography.md](references/typography.md) | DM Sans type scale (H1–Caption) |
| [references/spacing.md](references/spacing.md) | 4px grid (`space2`–`space80`) |
| [references/radius-shadows.md](references/radius-shadows.md) | 12px card default, 4px info banner |
| [references/motion.md](references/motion.md) | Motion defaults |

### Platform guides

| Platform | Stack | Reference |
|----------|-------|-----------|
| Mobile app | Flutter | [references/flutter.md](references/flutter.md) |
| Web | Next.js + Tailwind v4 | [references/nextjs.md](references/nextjs.md) |

### Components

| Component | Reference |
|-----------|-----------|
| button, button_link | [references/components/buttons.md](references/components/buttons.md) |
| action_card, user_greeting_card | [references/components/cards.md](references/components/cards.md) |
| activity_detail sections | [references/components/activity-detail.md](references/components/activity-detail.md) |
| skeleton UI | [references/components/skeleton-ui.md](references/components/skeleton-ui.md) |
| header, IKHLAS Logo | [references/components/navigation.md](references/components/navigation.md) |
| info, notice | [references/components/feedback.md](references/components/feedback.md) |

### Patterns

| Pattern | Reference |
|---------|-----------|
| Lists & separators | [references/patterns/lists.md](references/patterns/lists.md) |
| Forms | [references/patterns/forms.md](references/patterns/forms.md) |
| Empty states | [references/patterns/empty-states.md](references/patterns/empty-states.md) |

### Examples

| Doc | Description |
|-----|-------------|
| [examples/implementations.md](examples/implementations.md) | Before/after token mapping for common components |

---

## Installation

Clone the repo to a location your agent can read. The exact path depends on your agent setup.

### Option A — Standalone clone

```bash
git clone https://github.com/shahrulestar/ikhlas.git
```

Point your agent at the repo root (or at `SKILL.md`) when starting a session.

### Option B — Project-local skill

Add inside a project so the whole team shares the same version:

```bash
git submodule add https://github.com/shahrulestar/ikhlas.git skills/ikhlas-app-ui
```

Or copy the folder:

```bash
git clone https://github.com/shahrulestar/ikhlas.git skills/ikhlas-app-ui
```

### Option C — Agent skills directory

If your agent runtime supports a skills/plugins folder, clone or symlink there:

```bash
git clone https://github.com/shahrulestar/ikhlas.git /path/to/your/agent/skills/ikhlas-app-ui
```

Replace `/path/to/your/agent/skills/` with whatever your tool expects (e.g. a personal skills directory, project `.agents/skills/`, or a custom config path).

### Option D — Manual context

For agents without skill discovery, attach or paste `SKILL.md` at the start of a session, then pull in reference files as needed.

After install, start a **new agent session** so the skill is loaded fresh.

---

## How to invoke

**Name the skill explicitly** in your prompt — do not assume auto-discovery:

```
Use the ikhlas-app-ui skill to implement this action_card in Flutter
```

```
Use ikhlas-app-ui to build this IKHLAS web header in Next.js
```

**Trigger terms:** IKHLAS, IKH, IDS, Ikhlas App, ikhlas.com web, IKHLAS App UI Styles.

---

## Design system at a glance

Both platforms share the same semantic tokens. Layout differs (390px mobile vs ~1024px web content column).

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
| radius-sm | 4px | Info banners, activity detail cards |
| radius-md | 12px | Cards, CTAs (IKHLAS-3640) |

---

## Flutter quick start

```dart
padding: EdgeInsets.all(IkhlasSpacing.space16)
color: IkhlasColors.primaryTeal
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
| Implement a screen | [playbook.md](playbook.md) |
| UI consistency audit | [playbook.md](playbook.md) |
| Refresh tokens | [playbook.md](playbook.md) |
| Brand / UX rules | [design.md](design.md) |

---

## Repository structure

```
ikhlas/
├── README.md                 ← You are here
├── SKILL.md                  ← Main agent entry point
├── design.md                 ← Brand principles, do/don't, accessibility
├── playbook.md               ← Implement screen, UI audit, token refresh
├── examples/
│   └── implementations.md    ← Before/after design → code samples
└── references/
    ├── tokens.md             ← Master token index (Flutter + Next.js)
    ├── colors.md             ← Full color palette with hex
    ├── typography.md         ← DM Sans type scale
    ├── spacing.md            ← 4px grid (space2–space80)
    ├── radius-shadows.md     ← 12px card default, 4px info banner
    ├── motion.md             ← Motion defaults
    ├── flutter.md            ← ThemeExtension, spacing, widgets
    ├── nextjs.md             ← CSS vars, Tailwind v4 @theme, fonts
    ├── components/
    │   ├── buttons.md
    │   ├── cards.md
    │   ├── navigation.md
    │   ├── feedback.md
    │   ├── activity-detail.md
    │   └── skeleton-ui.md
    └── patterns/
        ├── lists.md
        ├── forms.md
        └── empty-states.md
```

---

## Contributing

Token values and component specs in this repo should stay in sync with the live design system. If you find drift, open an issue or PR with the corrected token values and reference the semantic name from the design system.

---

## Links

- **GitHub:** https://github.com/shahrulestar/ikhlas
- **IKHLAS:** https://ikhlas.com
