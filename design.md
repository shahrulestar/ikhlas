# IKHLAS Design Principles

## Brand identity

IKHLAS is an Islamic fintech and travel platform (Umrah, Zakat, Sadaqah, travel packages). UI must feel **trustworthy, calm, and accessible** — not flashy or gamified.

## Visual language

| Element | Guideline |
|---------|-----------|
| Primary accent | Teal family — CTAs, links, brand logo |
| Neutrals | Grey scale for body text, borders, disabled states |
| Info/alerts | Blue tints for informational banners; red for errors |
| Font | **DM Sans** exclusively (Regular 400, Medium 500) |
| Grid | 4px spacing grid via `Spacing/space{N}` tokens |
| Cards | 12px corner radius (IKHLAS-3640) unless noted |
| Icons | Custom IKHLAS icon set (24px default); Iconex/Light for legacy |

## Platform parity

Mobile (Flutter) and web (Next.js) share the same tokens. Differences are layout-only:

| Aspect | Mobile | Web |
|--------|--------|-----|
| Touch targets | Min 44px height for primary actions | Hover states on links/buttons |
| Navigation | Bottom tab bar, app header | Sticky web header, mega-menu |
| Content width | Full-bleed with 16px screen padding | Max ~1024px content column |

## Do

- Use semantic color names (Primary Teal, Grey 700) not arbitrary hex
- Use spacing tokens for all padding, gap, and margin
- Support Malay and English copy; DM Sans handles both scripts
- Use Hijri + Gregorian dates where shown in designs (e.g. user greeting card)
- Prefer library components (`button`, `action_card`, `info`, `notice`) over one-offs

## Don't

- Invent spacing values (especially 10px — use space8 or space12)
- Use fonts other than DM Sans
- Hard-code colors when a Figma fill style or variable exists
- Edit the Figma library file
- Mix Material Design icons with IKHLAS custom icons in the same context

## Accessibility

- Body text minimum 14px (Sub Body) on mobile
- Contrast: Black (#212124) on white; Grey 700 (#616161) for secondary text
- Interactive elements need visible focus states on web
- Info/notice banners include icon + text (never color alone)

## Islamic context

- Greeting patterns: "Assalamualaikum" in user-facing headers
- Product categories: Umrah, Zakat, Sadaqah, Travel, Quran-related features
- Respectful imagery and copy — no casual treatment of religious content
