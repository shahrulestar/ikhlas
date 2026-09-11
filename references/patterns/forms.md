# Form Patterns

No dedicated `input` component_set found in library search. Forms likely live in Customer App file (r1ODKpGXGqwwDlOinO00ge).

## Inferred from design system tokens

| Element | Token |
|---------|-------|
| Field label | 14px Sub Body Medium, Black |
| Field text | 16px Body, Black |
| Placeholder | Grey 700 |
| Border | Grey 200, 1px |
| Focus border | Primary Teal |
| Field padding | space12 vertical, space16 horizontal |
| Field radius | 8px or 12px — verify in Customer App |
| Error text | 12px Caption, Red |
| Error border | Red |

## Primary submit

Use Primary CTA button spec from [components/buttons.md](../components/buttons.md):
- Dark Teal fill, white text, 12px radius

## Info helper

Place `info` banner above form sections when contextual help is needed (see [components/feedback.md](../components/feedback.md)).

## Validation

When implementing forms:
1. Check Customer App Figma for input component instances
2. Call `get_design_context` on specific input nodes
3. Update this file if input component_set is found
