# Form Patterns

No dedicated `input` component documented yet. Spec below is inferred from design system tokens.

## Inferred from design system tokens

| Element | Token |
|---------|-------|
| Field label | 14px Sub Body Medium, Black |
| Field text | 16px Body, Black |
| Placeholder | Grey 700 |
| Border | Grey 200, 1px |
| Focus border | Primary Teal |
| Field padding | space12 vertical, space16 horizontal |
| Field radius | 8px or 12px — verify against design reference |
| Error text | 12px Caption, Red |
| Error border | Red |

## Primary submit

Use Primary CTA button spec from [components/buttons.md](../components/buttons.md):
- Dark Teal fill, white text, 12px radius

## Info helper

Place `info` banner above form sections when contextual help is needed (see [components/feedback.md](../components/feedback.md)).

## Validation

When implementing forms:
1. Check the design reference for input component specs
2. Update this file once input component tokens are confirmed
