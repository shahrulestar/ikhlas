# IKHLAS App UI — AI Agent Skill

A **Markdown-only** skill package for AI coding agents working on the **IKHLAS App UI** design system. It teaches agents how to implement IKHLAS screens consistently across **Flutter (mobile)** and **Next.js (web)** using shared design tokens, component specs, and platform guides.

---

## What this repo is

This repository is the **canonical, version-controlled copy** of the `ikhlas-app-ui` agent skill — a **100% Markdown package** (`SKILL.md` + reference `.md` files). No scripts, no runtime, no dependencies.

Works with **Cursor**, **Claude Code**, or any agent that can read Markdown instructions and reference files.

| File / folder | Purpose |
|---------------|---------|
| [SKILL.md](SKILL.md) | Main agent instructions — load this first |
| [design.md](design.md) | Brand principles, UX rules, do/don't |
| [playbook.md](playbook.md) | Task recipes: implement screens, audit UI, token refresh |
| [references/](references/) | Tokens, colors, typography, platform guides, components |
| [examples/](examples/) | Before/after design export → code samples |

No app codebase is required. Install by cloning the repo or uploading the Markdown files manually.

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
| [references/radius-shadows.md](references/radius-shadows.md) | Radius scale (12px default), no shadows |
| [references/motion.md](references/motion.md) | Motion defaults and overlay behaviour |
| [references/layout.md](references/layout.md) | Screen anatomy, screen recipes, web grid, asset sizes |
| [references/illustrations.md](references/illustrations.md) | Flat scene illustration style, palette, motifs, and prompt so new category art stays consistent |
| [references/legacy-migration.md](references/legacy-migration.md) | Legacy → IDS map and open items with defaults |

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
| product card, banner slider, USP grid, info chip, event card | [references/components/product-card.md](references/components/product-card.md) |
| navbar, bottom bar menu, icon + label, web header, logo | [references/components/navigation.md](references/components/navigation.md) |
| tabs, badges | [references/components/tabs.md](references/components/tabs.md) |
| text field and form controls | [references/components/text-field.md](references/components/text-field.md) |
| notice | [references/components/feedback.md](references/components/feedback.md) |
| bottom sheet, dialog, toast, snackbar, spinner | [references/components/overlays.md](references/components/overlays.md) |
| events calendar | [references/components/calendar.md](references/components/calendar.md) |
| skeleton UI | [references/components/skeleton-ui.md](references/components/skeleton-ui.md) |
| activity_detail sections | [references/components/activity-detail.md](references/components/activity-detail.md) |

### Patterns

| Pattern | Reference |
|---------|-----------|
| Screen states & edge cases | [references/patterns/states.md](references/patterns/states.md) |
| Lists, settings groups, separators | [references/patterns/lists.md](references/patterns/lists.md) |
| Forms | [references/patterns/forms.md](references/patterns/forms.md) |
| Empty states | [references/patterns/empty-states.md](references/patterns/empty-states.md) |

### Examples

| Doc | Description |
|-----|-------------|
| [examples/implementations.md](examples/implementations.md) | Before/after token mapping for common components |

---

## Installation

The skill ships on the `main` branch only — Markdown docs, tokens, and component references. Three ways to install:

### 1. Terminal — personal install (Cursor, recommended)

Copy-paste into your terminal:

```text
git clone git@github.com:shahrulestar/ikhlas.git ~/.cursor/skills/ikhlas-app-ui
```

HTTPS alternative:

```text
git clone https://github.com/shahrulestar/ikhlas.git ~/.cursor/skills/ikhlas-app-ui
```

| Type | Path | Scope |
|------|------|-------|
| Personal | `~/.cursor/skills/ikhlas-app-ui/` | All projects (developers and designers) |
| Project | `.cursor/skills/ikhlas-app-ui/` | Everyone who clones the app repo |

Do **not** install to `~/.cursor/skills-cursor/` — that directory is reserved for Cursor built-in skills.

**Symlink (local development):**

```text
ln -s /path/to/ikhlas ~/.cursor/skills/ikhlas-app-ui
```

### 2. Terminal — project install (submodule)

From your app repo root:

```text
git submodule add git@github.com:shahrulestar/ikhlas.git .cursor/skills/ikhlas-app-ui
```

Team members after clone:

```text
git submodule update --init --recursive
```

### 3. Manual file upload (no git)

1. Download ZIP from GitHub (`Code → Download ZIP`) on the **`main`** branch
2. Extract to your agent skills folder (e.g. `~/.cursor/skills/ikhlas-app-ui/`)
3. Confirm `SKILL.md` is at the folder root and `references/` is intact
4. Start a new agent session

**Minimum files for a short session:** `SKILL.md` plus the references you need (e.g. `references/layout.md`, `references/components/buttons.md`).

### Other AI agents

| Agent | Install path |
|-------|--------------|
| Claude Code / CLI | `.claude/skills/ikhlas-app-ui/` or path in agent config |
| Generic agent | Point at repo root or `SKILL.md` |
| No skill discovery | Attach `SKILL.md` at session start; pull reference files as needed |

Clone to any agent skills folder:

```text
git clone git@github.com:shahrulestar/ikhlas.git /path/to/your/agent/skills/ikhlas-app-ui
```

### Update and uninstall

```text
git -C ~/.cursor/skills/ikhlas-app-ui pull
rm -rf ~/.cursor/skills/ikhlas-app-ui
```

If the remote URL changed:

```text
git -C ~/.cursor/skills/ikhlas-app-ui remote set-url origin git@github.com:shahrulestar/ikhlas.git
```

### Verify install

- [ ] Folder contains `SKILL.md` at the root
- [ ] `references/tokens.md` exists
- [ ] New agent session started
- [ ] Test prompt: `Use the ikhlas-app-ui skill to audit this button`

After install, start a **new agent session** so the skill is loaded fresh.

### Prototypes (optional)

HTML zakat prototypes are **not** part of the skill install. They live on the separate `prototypes` branch:

```text
git clone -b prototypes git@github.com:shahrulestar/ikhlas.git ikhlas-prototypes
cd ikhlas-prototypes/prototypes && python3 -m http.server 8765
```

Use prototypes for visual reference only — implement screens from `references/` and `playbook.md`.

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
| Primary Teal | `#007F7C` | Filled primary CTA, links, active tabs |
| Darker Teal | `#006260` | Pressed CTA |
| Secondary Teal | `#00B2A9` | Home navbar, prayer header (not a CTA) |
| Teal Surface | `#F0F9F9` | action_card background |
| Dark Gold | `#D97F00` | Warning notice, secondary link |
| Black | `#212124` | Headings, active bottom nav label |
| Grey 700 | `#616161` | Secondary body |
| Grey 600 / Grey Dark | `#75767A` | Inactive bottom nav, muted text |
| Grey 300 | `#E0E0E0` | Disabled button |
| Grey 200 | `#EAEAEA` | Card borders, separators |
| Grey Light | `#D9DBE0` | Text field border, web header separator |
| Grey 50 | `#F9F9F9` | Scaffold / card background |
| Red | `#DC3224` | Errors, destructive actions |
| Green | `#067E41` | Success |

Full palette: [references/colors.md](references/colors.md)

### Spacing (4px grid)

`space2`, `space4`, `space8`, `space12`, `space16`, `space24`, `space32`, `space40`, `space48`, `space60`, `space64`, `space80`

**No `space10`.** Map 10px to `space8` (tighter) or `space12` (more breathing room).

Full table: [references/spacing.md](references/spacing.md)

### Typography

**DM Sans** only (Regular 400, Medium 500).

| Style | Size | Usage |
|-------|------|-------|
| H1 | 32 / 42 | Prayer clock, hero numbers |
| H2 | 24 / 32 | Page titles, prices |
| H3 | 20 / 28 | Section titles, greetings |
| H4 | 18 / 25 | Content headings |
| Body | 16 / 24 | Primary body |
| Sub Body | 14 / 21 | Secondary body |
| Caption | 12 / 18 | Captions, notices, nav labels |

Full scale: [references/typography.md](references/typography.md)

### Radius

| Token | Value | Usage |
|-------|-------|-------|
| radius-sm | 4px | Text fields, steppers, thumbnails |
| radius-md | 12px | Buttons, cards, notices, dialogs, sheets (IKHLAS-3640) |
| radius-pill | 24px | Info chips |

### Layout

16px screen margin · 40px between sections · 60px before "End of the section" · navbar 92 · bottom nav 50 + 34. See [references/layout.md](references/layout.md).

### Legacy rule

Older screens use Secondary Teal CTAs, 4px radius and borderless notices. Always implement the IDS component — see [references/legacy-migration.md](references/legacy-migration.md).

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
    ├── colors.md             ← Full color palette, notice sets, deprecated values
    ├── typography.md         ← DM Sans type scale + Arabic Text
    ├── spacing.md            ← 4px grid (space2–space80) + semantic spacing
    ├── radius-shadows.md     ← Radius scale, no shadows
    ├── layout.md             ← Screen anatomy, screen recipes, web grid
    ├── motion.md             ← Motion defaults, overlay behaviour
    ├── legacy-migration.md   ← Legacy → IDS map, open items
    ├── flutter.md            ← ThemeExtension, spacing, widgets
    ├── nextjs.md             ← CSS vars, Tailwind v4 @theme, fonts
    ├── components/
    │   ├── buttons.md
    │   ├── cards.md
    │   ├── product-card.md
    │   ├── navigation.md
    │   ├── tabs.md
    │   ├── text-field.md
    │   ├── feedback.md
    │   ├── overlays.md
    │   ├── calendar.md
    │   ├── activity-detail.md
    │   └── skeleton-ui.md
    └── patterns/
        ├── states.md
        ├── lists.md
        ├── forms.md
        └── empty-states.md
```

---

## Contributing

Token values and component specs in this repo should stay in sync with the live design system. If you find drift, open an issue or PR with the corrected token values and reference the semantic name from the design system. Do not commit design-tool URLs, file keys, node IDs or component keys — refer to components and screens by name.

---

## Links

- **GitHub:** https://github.com/shahrulestar/ikhlas
- **IKHLAS:** https://ikhlas.com
