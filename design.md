# IKHLAS Design Principles

## Brand identity

IKHLAS is an Islamic fintech and travel platform (Umrah, Zakat, Sadaqah, travel packages). UI must feel **trustworthy, calm, and accessible** — not flashy or gamified.

## Visual language

| Element | Guideline |
|---------|-----------|
| Primary accent | Primary Teal `#007F7C` — filled CTAs, links, active tabs |
| Brand surface | Secondary Teal `#00B2A9` — home navbar, prayer header, detail navbars (never a CTA fill) |
| Neutrals | Grey scale for body text, borders, disabled states; Grey 50 `#F9F9F9` scaffold |
| Feedback | Notices with tinted fill + border: information (blue), warning (gold), error (red `#DC3224`), general (grey) |
| Font | **DM Sans** exclusively (Regular 400, Medium 500); Arabic Text for Quran content |
| Grid | 4px spacing grid via `Spacing/space{N}` tokens; 16 margin, 40 between sections |
| Shape | 12px radius for buttons, cards, notices, dialogs, sheets (IKHLAS-3640); 4px text fields; pill chips |
| Elevation | Flat — borders and tints, no shadows; 50% black overlay for modals |
| Icons | Custom IKHLAS icon set (24px default); Iconex/Light for legacy |

## Platform parity

Mobile (Flutter) and web (Next.js) share the same tokens. Differences are layout-only:

| Aspect | Mobile | Web |
|--------|--------|-----|
| Touch targets | Min 44px height for primary actions | Hover states on links/buttons |
| Navigation | Bottom tab bar, app header | Sticky web header, mega-menu |
| Content width | Full-bleed with 16px screen padding | 1024px content column (1248px wide banners) |

## Do

- Use semantic color names (Primary Teal, Grey 700) not arbitrary hex
- Use spacing tokens for all padding, gap, and margin
- Support Malay and English copy; DM Sans handles both scripts
- Use Hijri + Gregorian dates where shown in designs (e.g. user greeting card)
- Prefer library components (`button`, `action_card`, `notice`, `navbar`, tabs) over one-offs
- Design every state: loading, empty, offline, error, and permission / guest where relevant ([references/patterns/states.md](references/patterns/states.md))
- End scrolling screens with the "End of the section" footer
- Follow the IDS component when an older screen differs ([references/legacy-migration.md](references/legacy-migration.md))

## Don't

- Invent spacing values (especially 10px — use space8 or space12)
- Use fonts other than DM Sans
- Hard-code colors when a semantic token exists in [references/colors.md](references/colors.md)
- Use Secondary Teal or external teals (`#00938F`) as a CTA fill
- Add drop shadows
- Mix Material Design icons with IKHLAS custom icons in the same context

## Accessibility

- Body text minimum 14px (Sub Body) on mobile
- Contrast: Black (#212124) on white; Grey 700 (#616161) for secondary text
- Interactive elements need visible focus states on web
- Notices include icon + text (never color alone)
- Primary CTA contrast: white on Primary Teal `#007F7C` meets WCAG AA; Secondary Teal does not for 16px text
- Malay copy runs longer than English — allow wrapping; clamp card titles at 2 lines with ellipsis

## Islamic context

- Greeting patterns: "Assalamualaikum" in user-facing headers
- Product categories: Umrah, Zakat, Sadaqah, Travel, Quran-related features
- Respectful imagery and copy — no casual treatment of religious content
