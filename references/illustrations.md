# Flat scene illustrations

Locked look for IKHLAS category art (Dua, Dhikr, and later sets). Load this file before generating, tracing, or placing a new illustration. Do not invent a second style.

The first set is the canon: Morning, Evening, Night, After salah, Waking, Tasbih, Istighfar, Daily dhikr, Travel, Food, Home, Gathering, Mosque, Parents, Knowledge, Protection, Rain, General dua.

## Objectives

| Goal | Rule |
|------|------|
| Spiritual resonance | Serene, respectful, contemplative — supports *khusyu'*, not transactional utility cards |
| Content primacy | Art is secondary. Category title, translation, count badge, and Arabic script (UI only) always win |
| Production scalability | Modular system: reuse motifs + 3-layer stack so a new card takes **15–30 minutes**, not bespoke hand art |
| Cross-surface adaptability | Same visual language scales to small, medium, and wide frames (see sizes below) |
| Brand cohesion | Align with IKHLAS App 2.0 tokens — teal/gold palette, DM Sans, 12px radius, flat elevation |

## Surfaces & sizes

One illustration concept, multiple crops. Generate at **3:4**, then fit.

| Surface | Size | Radius | Notes |
|---------|------|--------|-------|
| Category card (small) | 160 × 220 | 12 | Default Dua/Dhikr grid tile |
| Category card (medium) | 175 × 175 | 12 | 2-col exploration grid |
| Wide banner / carousel | 358 × 175 | 12 | Hero or discovery strip; keep motif left or right, text zone opposite |
| Push / social preview | 1200 × 630 or 1:1 crop | 12 | Reuse wide composition; never redesign for channel |

Push, deep-link, and social assets reuse the same Layer 1–2 art. Only the crop and overlay text change.

## Hierarchy & legibility

| Rule | Spec |
|------|------|
| Text contrast | Foreground text ≥ **4.5:1 WCAG AA** against the area it sits on |
| Scrim | **Directional gradient** scrim behind text: **20%–45%** black (`#00000033`–`#00000073`). Bottom-up for title-at-bottom cards; top-down for badges at top |
| Non-compete | Keep the text zone visually quiet. No motifs, badges, or busy detail where title, counter, or Arabic script will sit |
| Typography | DM Sans only on overlays. Title: Medium 20px / 26px (small card) or H3 20px (medium). Arabic script is **UI text**, never baked into the art |
| Center | Quiet band through the middle third for centered titles |

## Conceptual & cultural appropriateness

| Rule | Spec |
|------|------|
| Aniconism | **No human depictions** — no faces, full figures, identifiable silhouettes, or stylized people |
| No hands | Do not use open palms or raised hands in the artwork. Use rain, arch, lamp, or celestial cues instead |
| Symbolic expression | Repentance, gratitude, remembrance → atmosphere, celestial cues, nature, sacred geometry — not literal storytelling |
| Geometry | Mihrab / ogee / horseshoe arch silhouettes only. Classical balance, clean and contemporary. No calligraphy in art |
| Authenticity | Abstract mosque forms, not photos of real buildings. No depiction of the Prophet |

## Modular 3-layer architecture

Every tile or banner uses the same stack. Layers 1–2 are the illustration. Layer 3 is UI.

```
┌─────────────────────────┐
│ Layer 3 — Overlay       │  Directional scrim + title + badge + Arabic (live text)
├─────────────────────────┤
│ Layer 2 — Motif         │  One primary symbolic cluster (arch, lamp, beads, path…)
├─────────────────────────┤
│ Layer 1 — Atmosphere    │  Sky band, hills, celestial cue (sun / crescent / moon)
└─────────────────────────┘
```

| Layer | Contents | Rules |
|-------|----------|-------|
| **1 — Atmosphere** | Sky gradient bands, layered hills, stars, soft clouds | Teal Surface → Primary Teal. One celestial cue max |
| **2 — Motif** | Single motif cluster from the list below | Anchor bottom third or side edge. Never overlap the text zone |
| **3 — Overlay** | Scrim + typography + badges | Applied in Figma/code, not in the generated image |

Production workflow: pick atmosphere + one motif → compose Layers 1–2 → add Layer 3 in the product frame.

## Look

Calm, flat, graphic poster. Trustworthy, not decorative or gamified. One scene, one idea.

| Rule | Spec |
|------|------|
| Style | Flat vector scene. Solid shapes. No photo, 3D, texture, or drop shadow |
| Frame | See sizes table. Default 160 × 220, radius 12, clipped |
| Generate at | 3:4, then crop into target frame |

## Palette

Use only these. Gold is a small accent (sun, lamp, bead, lantern). Teal carries the scene.

| Token | Hex | Role in the picture |
|-------|-----|---------------------|
| Primary Teal | `#007F7C` | Main shapes, arches, hills |
| Darker Teal | `#006260` | Depth, foreground leaves, mat |
| Secondary Teal | `#00B2A9` | Mid shapes, sky bands |
| Teal Surface | `#F0F9F9` | Light sky, quiet center |
| Dark Gold | `#D97F00` | Accent only |
| Gold Surface | `#FAF8F2` | Cloth, cushion, warm ground |
| White | `#FFFFFF` | Highlights, title overlay |
| Black | `#212124` | Scrim source, rare thin detail |
| Grey 50 | `#F9F9F9` | Neutral ground |

No other hues. No red, purple, or photo skin tones.

## Motifs

Reuse these objects. Do not design a new object language for each card.

- Pointed or round geometric arch (mihrab / ogee / horseshoe)
- Layered rounded hills
- Small leaf sprig
- Crescent and a few dots for stars
- Hanging lamp or standing lantern
- Prayer mat
- Prayer beads, a few beads picked out in gold
- Open window, small kettle
- Path and a small bag
- Bowl, dates, cup on a cloth
- Doorway and one plant
- Circle of cushions (no people)
- Two cups and a folded shawl
- Open blank book and a lamp (no writing)
- Rain over plants (no hands — use for Istighfar, Rain, General dua mood)

Time of day: gold sun + hills (morning), crescent + lamp (evening), moon + mat (night).

## Do not

- Arabic, Quran text, or any letters **inside the artwork** (Arabic script belongs in Layer 3 UI only)
- Any human figure, face, silhouette, or hands
- Depict the Prophet, or copy a real building
- Put the subject in the text zone or center quiet band
- Add drop shadow, gradient mesh, or outline sticker look
- Mix in a second illustration style (isometric, 3D, watercolor, outline icon)

## Prompt

Paste this prefix unchanged. Add one sentence for the scene. Do not add style words of your own.

```
Flat vector scene illustration, no photorealism, no 3D, no drop shadows, no text, no Arabic script, no letters, no faces, no people, no hands, no silhouettes. Portrait 3:4. Quiet empty center for a title overlay. Palette only: teal #007F7C, darker teal #006260, light teal #00B2A9, pale teal #F0F9F9, gold #D97F00, cream #FAF8F2, white, soft grey #F9F9F9. Graphic poster style, serene and contemplative. Scene: <one sentence using an existing motif>.
```

Example:

```
... Scene: sunrise over quiet rounded hills, a simple gold sun low on a teal sky, a few flat clouds.
```

## New category

1. Read the canon list. If the meaning is already covered, reuse that card.
2. Pick **Layer 1 atmosphere** + **one Layer 2 motif**. Do not introduce a new object type.
3. Generate with the prompt prefix.
4. Place in the target frame; add Layer 3 scrim + live text in Figma/code.
5. Reject and regenerate if any check below fails.

Target: **15–30 minutes** per new card using motif reuse, not a fresh illustration concept.

## Reject if

- Text zone is busy or contrast falls below 4.5:1 with the scrim applied
- A color outside the palette appears
- There is text, a person, hands, or a shadow in the art
- The object is not from the motif list
- Frame size or radius does not match the surface table
- The mood feels transactional or gamified instead of contemplative
