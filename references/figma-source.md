# Figma Source Reference

Read-only. Never edit these files via MCP write tools.

## Primary library

| Field | Value |
|-------|-------|
| Name | IKHLAS App UI Styles |
| fileKey | `Yi0hAYFAqMEDEvjhqA020v` |
| libraryKey | `lk-d22f4ea0ae582208e0db86e002a131dc653b259a72c1be5a92b380efd7fe05cea4c5f713019724c5ccd8fa9c58c91580803549e0cab71a78a5d647ac0715e765` |
| Variable collection | `Tokens` (setKey: `7806043e61533729025aa2b0753d9a5d15f23823`) |
| URL | https://www.figma.com/design/Yi0hAYFAqMEDEvjhqA020v/IKHLAS-App-UI-Styles |

## Linked libraries

| Name | Notes |
|------|-------|
| V6.0 - Figma Design Library | Team library, subscribed |
| Material 3 Design Kit | Community, available |

## Related product files

| Name | fileKey | Use |
|------|---------|-----|
| WIP - IKH Customer App 2.0 | r1ODKpGXGqwwDlOinO00ge | Full app screens |
| HANDSHAKE - IKH Customer App 2.0 | jE0BN6ZlWnn8kuHVTeCsZh | Handoff screens |
| IKHLAS Design System (IDS) Research | JZPpBdc5EyIgMJNsw48vEc | FigJam research |

## URL patterns

```
Design file:  https://www.figma.com/design/{fileKey}/{name}?node-id={page}-{node}
Node ID:      Convert 1256-22296 → 1256:22296 for MCP tools
```

## Documented node IDs (instances for get_design_context)

| Component | nodeId | Context |
|-----------|--------|---------|
| info | 377:10952 | Info banner (blue) |
| button (link style) | 1167:26132 | Text + chevron link |
| header (web) | 1167:26501 | Sticky web header |
| Primary CTA button | 1167:26190 | Filled teal button |
| action_card | 1256:22296 | Teal tint card, 12px radius |
| user_greeting_card | 1256:22082 | Greeting + location |
| home header | 1256:22066 | Secondary Teal `#00B2A9` |
| bottom bar | 1256:22313 | Grey 600 / Grey 200 |
| notice | 1503:19843 | Grey 50 candidate `#F8F8F8` |
| activity_detail sections (Sadaqah) | 11610:34052 | Key-value section cards, Customer App 2.0 |
| activity_detail sections (Zakat) | 11734:292043 | Key-value section cards, aligned to Zakat email receipt |
| Activity Details Zakat (full screen) | 11639:291235 | Mobile Activity Detail with CTA support |
| [Zakat] Payment Receipt Email | 11717:24994 | Email receipt field source, Current UI section |
| skeleton UI (Events Calendar) | 11649:291687 | Loading placeholders, Customer App 2.0 |
| Chatwoot Agent V1 Zakat | 11666:690 | Agent dashboard, system message only, Zakat section |
| Chatwoot Agent V2 Qurban | 11666:783 | Agent dashboard, full thread, Zakat section |
| Chatwoot Agent Q02 Zakat Receipt | 11669:19343 | Q02 PPZ-MAIWP receipt thread, Zakat section |
| Chatwoot Agent Sadaqah Help FAQ Q03 | 11748:3293 | Agent dashboard, Help/FAQ processing fee, Sadaqah section |
| Chatwoot Agent Sadaqah Activity Q04 | 11748:3396 | Agent dashboard, Activity Detail LHDN tax relief, Sadaqah section |
| Lifestyle Services — Sadaqah Chatwoot | 11707:1432 | 5 inbox Q&A frames + welcome, CHAR-3276 |
| Lifestyle Services — Fidyah Chatwoot | 11707:1433 | 5 inbox Q&A frames + welcome, CHAR-3276 |
| Lifestyle Services — Aqiqah Chatwoot | 11707:1434 | 5 inbox Q&A frames + welcome, CHAR-3276 |
| Aqiqah support section | 11755:17075 | 3 convo situations (new / resume / past post-receipt) |
| Activity Details Aqiqah | 11755:17320 | Mobile Activity Detail aligned to Aqiqah receipt email |
| [Aqiqah] Payment Receipt Email | 11755:19410 | Email receipt field source, Aqiqah section |
| Chatwoot Agent Aqiqah Q01 new | 11755:17655 | Agent dashboard, new convo from Help |
| Chatwoot Agent Aqiqah Q03 Activity | 11755:17857 | Agent dashboard, order support from Activity CTA |
| Chatwoot Agent Aqiqah Q03 resolved | 11755:17550 | Agent dashboard, past convo full thread |
| Chatwoot Agent Aqiqah Default | 11755:17758 | Agent dashboard, empty ticket |
| Fidyah support section | 11759:19963 | 3 convo situations (new / resume / past post-receipt) |
| Activity Details Fidyah | 11759:20192 | Mobile Activity Detail aligned to Fidyah receipt email |
| [Fidyah] Payment Receipt Email (section) | 11763:4677 | Email receipt in Fidyah section (cloned from 11717:25121) |
| Chatwoot Agent Fidyah Q01 new | 11759:20529 | Agent dashboard, new convo from Help |
| Chatwoot Agent Fidyah Q03 Activity | 11759:20731 | Agent dashboard, order support from Activity CTA |
| Chatwoot Agent Fidyah Q03 resolved | 11759:20424 | Agent dashboard, past convo full thread |
| Chatwoot Agent Fidyah Default | 11759:20632 | Agent dashboard, empty ticket |
| desktop marketing | 1167:26114 | Branding/Red `#E94335` |
| Iconography page | 410:21385 | Icon comparison frame |

## Chatwoot system automated messages (CHAR-3276)

Updated 2026-09-18 across Sadaqah, Zakat, Aqiqah, and Fidyah service sections (35 nodes: mobile inbox + agent dashboard).

**Scenario A — Specific Order** (Activity Detail CTA, past post-receipt inbox):

```
🤖 [System Automated Message] We have initiated a support ticket for {product} Order #{orderId}. Please describe your issue below, and our support team will assist you shortly, insha Allah.
```

**Scenario B — General Inquiry** (Homepage → Help, resume convo, default/welcome):

```
🤖 [System Automated Message] We have initiated a General Inquiry ticket for {product}. Please describe your issue below, and our support team will assist you shortly, insha Allah.
```

| Product | Order ID (Scenario A) | Scenario A entry | Scenario B entry |
|---------|----------------------|------------------|------------------|
| Sadaqah | `#SD20250806001` | Activity Detail → Q04 LHDN | Help → Q03 Processing fee |
| Zakat | `#ZK20250915001` | Activity Detail → Q04 Tax relief | Help → Q02 Receipt PPZ-MAIWP, Default |
| Aqiqah | `#177198008508834967` | Activity → Q03 Video proof; past resolved | Help → Q01 Day of Aqiqah (new/resume), Default |
| Fidyah | `#175153016225847588` | Activity → Q03 Elderly/chronic; past resolved | Help → Q01 Daily rate (new/resume), Default |

Mobile inbox and agent dashboard threads for the same situation must show identical system copy.

## Color re-extract (2026-09-11)

`get_variable_defs` works when a **concrete instance** is selected. Canvas `1167:26065` still fails (“nothing selected”). Use the instance nodes above, not the Issues page root.

## Pages note

User-provided URL node `1167:26065` is the **🚨 Issues** canvas (QA screenshots), not the token foundation page. Use `search_design_system` to find library assets rather than relying on that page.

## MCP tools

| Tool | Use |
|------|-----|
| `search_design_system` | Find components, variables, styles by name |
| `get_design_context` | Extract specs from a specific node |
| `get_metadata` | Page/section structure (XML) |
| `get_variable_defs` | Variable values (requires Figma desktop selection) |
| `get_libraries` | List subscribed libraries |

Always pass `includeLibraryKeys` with the IKHLAS libraryKey when searching.

## Component keys (for cross-file lookup)

| Component | componentKey | assetType |
|-----------|--------------|-----------|
| button | f787ec21f3b177cba65af187755153bac9cd63b5 | component_set |
| button_link | c751e279349b3080dc640e782d3b8e10fbe8b01e | component_set |
| action_card | f2cd1e11e5a97353961dbaf8d31897bb90f69d9b | component_set |
| user_greeting_card | ec77f9e08a0de2dd3907286601e708fafb1a14 | component_set |
| notice | a011d8386869f67b28cac518c3ef8eef4f6e41c0 | component_set |
| IKHLAS Logo | 8db94a9a22a8f8e44f7634f0edbf9c61228cf837 | component_set |
| icon + label | 794a22d596258d757491b5599b4ed937be5d4013 | component_set |
| title_link | 1e71a676e4af16e2d9fe8f01c83011e1452788c8 | component_set |
| user info | a41f82f15066f9e7c1381fd8a527cccd77256ccd | component_set |
