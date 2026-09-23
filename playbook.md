# IKHLAS UI Playbook

Task recipes for agents using the ikhlas-app-ui skill.

## Implement screen

### Prerequisites

- Read relevant component and pattern references before writing code
- Confirm platform: Flutter or Next.js

### Steps

```
Task Progress:
- [ ] Identify screen type and pick its recipe in references/layout.md
- [ ] Load component/pattern references for every element on the screen
- [ ] Identify platform stack in target codebase
- [ ] Map design tokens → IkhlasSpacing / --ikh-* CSS vars
- [ ] Reuse existing IKH components from project
- [ ] Implement layout (mobile 390px or web 1440px as designed)
- [ ] Implement required states (references/patterns/states.md)
- [ ] Replace any legacy values with IDS values (references/legacy-migration.md)
- [ ] Run UI audit checklist below
```

### Screen recipes

| Screen | Recipe | Key components |
|--------|--------|----------------|
| Home | [layout.md#home](references/layout.md#home) | navbar (home guest/login), prayer header, user_greeting_card, icon + label, title_link, banner slider, product card, action_card |
| Product landing | [layout.md#product-landing-page-qurban-aqiqah-zakat-sadaqah](references/layout.md#product-landing-page-qurban-aqiqah-zakat-sadaqah) | USP grid, secondary button, action_card check_status, product card grid, bottom sheet "Help?" |
| Detail (event / article) | [layout.md#detail-page-2026-pattern](references/layout.md#detail-page-2026-pattern) | teal navbar + content sheet, event card, info chips, primary button |
| Checkout | [layout.md#checkout](references/layout.md#checkout) | item summary card, text fields, stepper, notice, checkboxes, sticky footer |
| Settings / Account | [layout.md#settings--account](references/layout.md#settings--account) | account header card, settings groups, tertiary "Log out" |
| Activity | [layout.md#activity-listing](references/layout.md#activity-listing) | secondary tab strip, activity detail cards, promotional empty state |

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
- [ ] Layout rhythm: 16 screen margin, 40 between sections, 60 before "End of the section"
- [ ] Scrolling screens end with the "End of the section" footer
- [ ] Colors match semantic tokens in references/colors.md (Grey 50 = #F9F9F9)
- [ ] Typography uses DM Sans with correct style (H1–H4, Body, Sub Body, Caption)
- [ ] Button, card, notice, dialog and sheet radius = 12px; text field 4px
- [ ] Primary CTA uses Primary Teal #007F7C (pressed #006260, disabled #E0E0E0)
- [ ] Links use Primary Teal text + chevron (button_link)
- [ ] Notices use the 4 IDS styles with border; errors in Red #DC3224
- [ ] Bottom nav active label is Black Medium; tabs active label Primary Teal
- [ ] Icons are 24px default (20px in compact button_link)
- [ ] Loading (skeleton / spinner), empty, offline, error states present
- [ ] Permission-dependent screens show the denied state
- [ ] Malay/English strings wrap or clamp (2 lines + ellipsis) without clipping
- [ ] No legacy values (see references/legacy-migration.md)
```

Report findings as:
- **Critical:** Breaks design system (wrong token, wrong font, Secondary Teal or `#00938F` CTA, wrong error red, missing required state)
- **Legacy:** Matches an older screen value listed in legacy-migration.md — migrate to IDS
- **Suggestion:** Minor deviation (e.g. space12 vs space16 in low-impact area, radius-only differences)

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
| 40px | `space40` (section gap) |
| 60px | `space60` (before end of section) |
| #007F7C | `Primary Teal` / `--ikh-primary-teal` (CTA fill, links) |
| #00B2A9 as button fill | Legacy → `Primary Teal` |
| #212124 | `Black` / title text |
| #616161 | `Grey 700` / body secondary |
| #F8F8F8 as background | `Grey 50` `#F9F9F9` |
| #E94335 / #E30917 | `Red` `#DC3224` |
| 12px radius | `radius-md` / `BorderRadius.circular(12)` |

When design exports raw hex, cross-check [references/colors.md](references/colors.md) and [references/legacy-migration.md](references/legacy-migration.md).

---

## Legacy check

1. For every mismatch between the implementation and the IDS references, look it up in [references/legacy-migration.md](references/legacy-migration.md)
2. If it matches a legacy value, report it as **Legacy** and replace it with the IDS target
3. Open items there have defaults applied — use the defaults until a designer confirms otherwise

---

## Token refresh

1. Diff new token values against [references/tokens.md](references/tokens.md)
2. Update `references/colors.md`, `references/typography.md`, `references/legacy-migration.md` and affected component files
3. Refer to components and screens by name — never paste design-tool URLs, file keys, node IDs or component keys into this repo
4. Keep SKILL.md under 500 lines

---

## Design-to-code rules

When implementing from a design reference:

- Treat raw exports as reference, not paste-ready code
- Map to platform tokens — honor semantic names over raw hex from export
- If the export shows a legacy value (Secondary Teal CTA, 4px card, borderless notice), use the IDS value instead
- Preserve icon/image assets from exports; do not redraw or omit
- Adapt to Flutter or Next.js per [references/flutter.md](references/flutter.md) / [references/nextjs.md](references/nextjs.md)
