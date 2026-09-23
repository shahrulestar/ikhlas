# Screen States & Edge Cases

Every screen that loads data or accepts input must handle these states. Each section lists the visual rule, reference copy (EN; provide BM equivalents from the copy deck) and what an audit checks.

## Required states per screen

| Screen type | Must design |
|-------------|-------------|
| Data list / feed | loading, empty, offline, error, populated, end of list |
| Form / checkout | default, filled, validation error, submitting, success, server error |
| Settings with OS permission | granted, denied / system blocked, partially enabled |
| Search | initial, typing, results, no results, offline |
| Personalised content | guest, registered |

## Loading

**First load → skeleton.** Keep the static shell (status bar, navbar, tab bar, card outlines, separators) and replace dynamic content with skeleton blocks — [components/skeleton-ui.md](../components/skeleton-ui.md).

**Submitting → spinner overlay.** Overlay `rgba(0,0,0,0.5)` over the whole screen including the navbar; white circular spinner centred; input blocked — [components/overlays.md](../components/overlays.md#loading-overlay-spinner).

Audit: no blank white screen while loading; no spinner used for first-load lists; header is dimmed under the spinner overlay.

## Offline

**Full-screen (content cannot load):**
- Illustration (centred, ~200 wide) on the Grey 50 background
- Title "You are currently in offline mode" — 20 Medium Black, centred
- Body "Make sure that you're connected to the internet." — 14 Regular Grey 600, centred
- Small secondary pill button "Retry" (14 Medium) that re-requests the screen
- Search fields on the screen are disabled with icon and text at 50% opacity

**Inline (cached content available):** show a notice or banner ("Oh no! You are offline — you can still access downloaded content") and keep the cached content usable.

Audit: offline never shows a raw error; Retry always present on full-screen offline.

## No search results

- Icon or illustration + "No results found" (16 Medium) / "Please search using other keywords" (14 Grey 600)
- The clear "×" icon in the search field is hidden by default and appears as soon as input length > 0
- Reuse the same copy across all search pages (location, Quran, guides)

## Empty

Two approved patterns:

1. **Illustration empty state** — illustration + title + description + optional CTA ([empty-states.md](empty-states.md)).
2. **Promotional empty state** — when a product list is empty (Activity per product), show that product's action_card ("Explore qurban packages / Explore now") followed by "End of the section".

## Error

**Network / server error on an action:** dialog "Oops! Something went wrong" + short explanation + Cancel (secondary) · Try Again (primary).

**Field validation:** Red border, Red label, 12px Red message under the field ([components/text-field.md](../components/text-field.md)).

Audit: errors use Red `#DC3224` and the error notice / dialog patterns, never blue.

## Permission denied

**Global (OS level, e.g. notifications blocked):** error notice at the top of the affected settings group — "Notification permissions are denied. Tap here to allow them." Tapping opens OS Settings. Dependent toggles appear faded (labels Grey 600).

**Local (feature level, e.g. location services off):** error notice inside the relevant row group — "Your phone's location services are off. Tap to enable in Settings."

**Location heading states:** located ("Prayer times in Kuala Lumpur"), locating ("Locating..."), location outdated ("Location outdated" in Red) — see [lists.md](lists.md#prayer_time_heading-component_set).

## Session & success feedback

| Event | Pattern |
|-------|---------|
| Session expired | Top toast "Sorry. Your session has expired. Please log in again." then the login screen |
| Profile saved | Top toast "Profile updated" |
| Reminder set | Bottom snackbar "Reminder set for {event} on {date}" |
| Feedback sent | Success screen or toast |

## Forms

- Primary CTA disabled (Grey 300) until all required fields are valid
- Sticky CTA stays above the keyboard
- Submitting → spinner overlay; success → toast or success screen; failure → error dialog

## Destructive actions

- Trigger: tertiary Red button ("Delete account", "Log out")
- Confirm: dialog "Confirmation" / "Are you sure to delete your account?" — Cancel · Yes
- Multi-step flows (delete account): terms → verification (password or SSO) → "deleting" progress → "deleted" confirmation

## Guest vs registered

- Home navbar: home guest ("Account") vs home login (avatar initials)
- Greeting: "Assalamualaikum" vs "Assalamualaikum {Name}"
- Gated actions prompt login only when needed (save, transact), not on app open

## Badges & unread

- Unread message rows use the "new" style; unread tabs show a red dot or count badge ([components/tabs.md](../components/tabs.md#badges-and-dots))
- "New" feature badge on icon + label tiles

## Download status (Quran audio / guides)

not downloaded (download icon) → downloading (progress) → downloaded (tick, Teal Link Alt). Offline playback only for downloaded items.

## Long text

- Malay copy is usually longer than English — never assume single-line fits
- Card titles: max 2 lines with ellipsis; buttons: single line, shorten copy rather than shrink text
- Hijri dates can be long ("23 Rabi Al-Awwal 1447 H") — allow wrapping in greetings and headings
- Keep text alignment consistent per component (left for lists and cards, centred only for empty / offline states and dialogs on web)

## Audit checklist

```
- [ ] Loading: skeleton on first load; spinner overlay only when submitting
- [ ] Empty: illustration or promotional action_card, plus "End of the section"
- [ ] Offline: full-screen with Retry, or inline notice with cached content
- [ ] Error: dialog for actions, field errors for validation, Red #DC3224
- [ ] Permission: error notice + faded dependent controls
- [ ] Forms: CTA disabled until valid, above keyboard
- [ ] Long BM/EN copy wraps or clamps without clipping
- [ ] Guest and registered variants covered
```
