# IKHLAS UI Playbook

Task recipes for agents using the ikhlas-app-ui skill.

## Implement screen

### Prerequisites

- Read relevant component and pattern references before writing code
- Confirm platform: Flutter or Next.js

### Steps

```
Task Progress:
- [ ] Identify screen type and load component/pattern references
- [ ] Identify platform stack in target codebase
- [ ] Map design tokens → IkhlasSpacing / --ikh-* CSS vars
- [ ] Reuse existing IKH components from project
- [ ] Implement layout (mobile 390px or web 1440px as designed)
- [ ] Run UI audit checklist below
```

### Flutter branch

1. Read [references/flutter.md](references/flutter.md)
2. Wrap screen in `Theme` with `IkhlasThemeExtension`
3. Use `IkhlasSpacing`, `IkhlasColors`, `IkhlasTypography` constants
4. Match component names to widgets: `ActionCard`, `ButtonLink`, `UserGreetingCard`

### Next.js branch

1. Read [references/nextjs.md](references/nextjs.md)
2. Import `@/styles/ikhlas-theme.css` or scoped wrapper class
3. Use CSS variables: `var(--ikh-space-16)`, `var(--ikh-primary-teal)`
4. Prefer server components; client only for interactivity

---

## UI consistency audit

Run after any IKHLAS UI change:

```
Audit Progress:
- [ ] All spacing uses space2/4/8/12/16/24/32/40/48/60/64/80 — no magic px
- [ ] No 10px values (remap to space8 or space12)
- [ ] Colors match semantic tokens in references/colors.md
- [ ] Typography uses DM Sans with correct style (H1–H4, Body, Caption)
- [ ] Card/action_card radius = 12px
- [ ] Primary CTA uses Primary Teal / Dark Teal fill
- [ ] Links use teal text + optional chevron icon
- [ ] Icons are 24px default (20px in compact button_link)
- [ ] Malay/English strings not truncated without ellipsis design
```

Report findings as:
- **Critical:** Breaks design system (wrong token, wrong font)
- **Suggestion:** Minor deviation (e.g. space12 vs space16 in low-impact area)

---

## Add new component

1. Check existing component references in `references/components/`
2. Document in `references/components/<name>.md` if not already covered
3. Implement in both platforms if shared, or note platform-specific variant
4. Name code components to match design system: `action_card` → `ActionCard`

---

## Token resolution (no magic numbers)

| Raw value | Resolution |
|-----------|------------|
| 10px spacing | `space8` (compact) or `space12` (default) — **never space10** |
| 8px | `space8` |
| 16px | `space16` |
| #007F7C | `Primary Teal` / `--ikh-primary-teal` |
| #212124 | `Black` / title text |
| #616161 | `Grey 700` / body secondary |
| 12px radius | `radius-md` / `BorderRadius.circular(12)` |

When design exports raw hex, cross-check [references/colors.md](references/colors.md).

---

## Token refresh

1. Diff new token values against [references/tokens.md](references/tokens.md)
2. Update `references/colors.md`, `references/typography.md`, and affected component files
3. Keep SKILL.md under 500 lines

---

## Design-to-code rules

When implementing from a design reference:

- Treat raw exports as reference, not paste-ready code
- Map to platform tokens — honor semantic names over raw hex from export
- Preserve icon/image assets from exports; do not redraw or omit
- Adapt to Flutter or Next.js per [references/flutter.md](references/flutter.md) / [references/nextjs.md](references/nextjs.md)
