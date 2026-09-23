# Product & Content Cards

Cards composed inside screens (Home, landing pages, events). Built from tokens — not all are published library components.

## Product card (carousel / grid)

| Property | Value |
|----------|-------|
| Width | 160 |
| Image | 160 × 160, radius 12, object-cover |
| Label chip | On the image, inset 8: white fill, radius full, padding 4 / 8, 12px Caption Medium Black (e.g. "Qurban Local", "Super Economy") |
| Title | 18px Medium Black, line-height 1.4, max 2 lines, ellipsis (height 50) |
| Price | 24px Medium Black ("MYR 850"; "From" 12 Grey 600 above when needed) |
| Unit | 14px Regular Grey 600 ("per portion", "whole cow") |
| Gaps | Image → title 8; title → pricing 8 |
| Carousel | Horizontal scroll, gap 16, starts at the 16px screen margin |
| Grid (landing page) | 2 columns, gap 16 |

Status chips for packages use the package chip pairs in [colors.md](../colors.md#package-chips-bg--text).

## Content card (article)

Image 160 × 160 + title 18 Medium (2-line clamp). No price.

## Banner slider

| Property | Value |
|----------|-------|
| Slide | 358 × 160, radius 12 |
| Slide gap | 16 (next slide peeks) |
| Page dots | 8px circles, gap 4, centred 8 below the slide; active Primary Teal, inactive Grey 300 |
| Total height | 184 |

## USP grid (landing page "Why choose ikhlas.com")

| Property | Value |
|----------|-------|
| Tile | 175 × 95, padding 16, text 14–16 white centred |
| Layout | 2 columns, wrap, gap 8 |
| Radius | 12 (older screens use 4) |
| Colours | USP palette in [colors.md](../colors.md#product--marketing-accents), one colour per tile |

Follow the grid with a full-width secondary button ("How it works").

## Info chip

Metadata pills on detail pages (date/time, location, speaker).

| Property | Value |
|----------|-------|
| Height | 24 |
| Padding | 4 / 8 |
| Radius | 24 (radius-pill) |
| Style | White fill, 1px Grey 200 border |
| Text | 12px Caption Medium, Grey 600 |
| Stack | Vertical, gap 8 |

## Event card (detail)

| Property | Value |
|----------|-------|
| Container | White, 1px Grey 200 border, radius 12, padding 16 |
| Content gap | 16 |
| Image | Full width, aspect 800 : 420, radius 4 |
| Chips | Info chips, gap 8 |
| CTA | Primary button, full width ("Register Now") |
| Body heading | 16px Medium Black ("About Event") |
| Body | 14px Regular Grey 600 |

## Item summary card (checkout)

White, radius 4, padding 16, row gap 16: 68px thumbnail (radius 4) + title 16 Medium + two 12px Grey 90 lines. Sits on the Grey 50 booking summary block ([layout.md](../layout.md#checkout)).

## WhatsApp action card

action_card layout with WhatsApp Green `#4BD763` at 10% as background and the WhatsApp icon; action text "Contact us".

## Flutter sketch (product card)

```dart
SizedBox(
  width: 160,
  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Stack(children: [
      ClipRRect(borderRadius: IkhlasRadius.card, child: Image.network(url, width: 160, height: 160, fit: BoxFit.cover)),
      Positioned(left: 8, top: 8, child: IkhlasLabelChip(label)),
    ]),
    const SizedBox(height: IkhlasSpacing.space8),
    Text(title, maxLines: 2, overflow: TextOverflow.ellipsis,
        style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w500, height: 1.4, color: IkhlasColors.black)),
    const SizedBox(height: IkhlasSpacing.space8),
    Text('MYR 850', style: IkhlasTypography.h2),
    Text('per portion', style: IkhlasTypography.subBody.copyWith(color: IkhlasColors.grey600)),
  ]),
)
```
