# Form Patterns

Field component specs (text field, floating label, phone, password, stepper, checkbox, radio): [components/text-field.md](../components/text-field.md).

## Form layout

| Element | Value |
|---------|-------|
| Section title | H3 20 Medium Black |
| Section description | 16 Regular Grey 90 `#4C4C50`, gap 4 below title |
| Title block → fields | 16 |
| Between fields | 16 |
| Between sections | 40 |
| Screen margin | 16 |

Example sections (checkout): "Registration details", "Participant details", "Additional notes", "Akad".

## Primary submit

- Primary button from [components/buttons.md](../components/buttons.md): Primary Teal `#007F7C`, white text, radius 12, height 48, full width in a sticky footer
- **Disabled (Grey 300) until every required field is valid**
- Stays pinned above the keyboard while typing
- While submitting: spinner overlay over the whole screen ([patterns/states.md](states.md#loading))
- After success: top toast ("Profile updated") or navigate to a success screen

## Validation

| Moment | Behaviour |
|--------|-----------|
| On blur / submit | Show error border Red `#DC3224` + error message 12px Red below the field |
| Label | Turns Red while the field is in error |
| Fix | Error clears as soon as the value becomes valid |
| Server error | Error dialog "Oops! Something went wrong" with Cancel / Try Again ([components/overlays.md](../components/overlays.md)) |

## Info helper

Place an information notice above or inside a form section when contextual help is needed ([components/feedback.md](../components/feedback.md)).

## Read-only / locked fields

Fields managed by SSO (e.g. email on the airasia account) use the disabled field style plus a warning notice explaining where to change them.
