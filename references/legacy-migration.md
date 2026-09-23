# Legacy → IDS Migration

Many existing screens predate the IKHLAS Design System (IDS) components. **Rule: when a screen and an IDS component disagree, implement the IDS component** and report the screen value as legacy in audits.

## Migration map

| Area | Legacy (seen in older screens) | IDS target |
|------|-------------------------------|------------|
| Primary CTA fill | Secondary Teal `#00B2A9` (or `#67C1BF`), radius 4 | Primary Teal `#007F7C`, radius 12, pressed `#006260` |
| Secondary button | `#00B2A9` / `#67C1BF` outline, radius 4 | 1px Primary Teal outline, radius 12, pressed fill `#E1F3F2` |
| Disabled button | `#F8F8F8` fill + `#EBEBEB` border + `#DFE1E5` text, radius 4 | Grey 300 `#E0E0E0` fill, white text, radius 12 |
| CTA "Dark Teal" | `#00938F` (external web library) | Primary Teal `#007F7C` |
| Link text | 16px `#00B2A9` or `#169D9A` | button_link primary: 14px Medium `#007F7C` |
| Notice | Radius 4, no border (or `#2F73D2` border for info) | Radius 12 + tinted border per style |
| action_card | old_teal (`#00B2A9` at 10%), old_gold (`#D7B250` link) | primary (`#F0F9F9`) / secondary (`#FAF8F2`, `#956B00` link) |
| Error / destructive red | `#E30917`, `#E94335` | Red `#DC3224` |
| Grey 50 | `#F8F8F8` | `#F9F9F9` (`#F8F8F8` only for general notice / disabled field) |
| Bottom sheet | Top radius 4 | Top radius 12 |
| Settings / activity detail cards | Radius 4, 18px padding | Radius 12, rows with 16px horizontal padding |
| USP tiles | Radius 4 | Radius 12 |
| Secondary tab active label | Secondary Teal | Primary Teal |
| Local text styles | "16px Title Medium" (100% line height), H2 with 36px line height | Canonical styles in [typography.md](typography.md) |

## Open items (defaults applied)

These were not fully settled in the design files. The skill uses the defaults below until a designer confirms otherwise.

1. **Activity detail and settings group radius** — target radius 12 with 16px row padding (from the "UI Enhancements" notes). Existing 4px frames are legacy.
2. **Destructive red** — use Red `#DC3224` for tertiary buttons and destructive text ("Log out", "Delete account"), even where older frames show `#E30917`.
3. **Header during loading** — the spinner overlay dims the whole screen including the navbar; skeleton loading keeps the navbar as an undimmed shell.
4. **Text field focus colour** — keep Focus Purple `#4B4FA6` as defined in the Text Field component.
5. **Bottom sheet radius** — top corners 12 (no official IDS sheet component yet).
6. **Web header height** — 66px header bar; an optional top bar makes the sticky group 106px.

When a default changes, update this list and the affected reference file in the same edit.

## How to use in audits

1. Compare the implementation against the IDS reference files, not against older screens.
2. For each mismatch, check this table: if the implementation matches a legacy value, report **"Legacy — migrate to IDS"** (Critical for CTA colour and error red, Suggestion for radius-only differences).
3. Never introduce legacy values in new UI.
