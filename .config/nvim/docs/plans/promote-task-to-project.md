# Promote Obsidian task to project

> **Status:** In progress

## Goal

`<Leader>otf` on an Obsidian Tasks line creates a project note from a template and replaces the task line with a wikilink to it.

## Scope

- Parse a task line: title, 5 date markers, priority, extra markers (`✅ 🔁 🆔 ⛔ 🏁`).
- Render a project note from an in-module template + `{{...}}` renderer.
- Write it to `config.project_dir` (relative to vault root, default `--- Inbox`).
- Replace the task line with `- [[<filename>]]`.
- Plenary specs for parser + renderer.

Out of scope: creating the reverse task in the project note, syncing back, editing an existing project.

## Decisions

| Topic | Decision |
|---|---|
| Module | `lua/user/obsidian/promote_task_to_project.lua` |
| Datetime | `YYYY-MM-DD HH:mm`, quoted string |
| Template | Lua multi-line constant + `{{placeholder}}` renderer |
| Folder | `config.project_dir = "--- Inbox"`, resolved against `obsidian_workspace_path` |
| Filename | title with `[x](y)` → `x`, illegal chars → `-` |
| Heading | full title text, markdown link kept |
| Links | first `github.com` → `[g] GitHub PR`, first `notion.so`/`notion.site` → `[n] Notion page` |
| Priority | `🔺` highest `⏫` high `🔼` medium `🔽` low `⏬` lowest; none → medium |
| Markers → frontmatter | `➕` created, `⏳` scheduled, `🛫` started, `📅` planned, `❌` cancelled, `✅` done, `🔁` recurrence, `🆔` id, `⛔` depends_on, `🏁` on_completion |
| Key order | template order first, extras appended only when present |
| `{{date}}` in Tasks | today |
| Replacement | `- [[<filename>]]` (checkbox and `#task` dropped) |
| Idempotence | no `#task` on line → notify error, abort |
| Folder missing | `mkdir -p` |
| Collision | suffix `-2`, `-3` |
| Buffer | rewrite line only, no `:write` |
| After | stay put, one `vim.notify` with path |
| Keymap | `obsidian.lua` keys table, desc "Obsidian - promote task to project" |

## PR split

1. `feat(nvim): promote obsidian task to project note` — paths — S — depends on none

Single PR: one concern, no consumer without the other halves, ~300 changed lines.

## Tasks

- [x] Add `plenary.nvim` as a top-level plugin spec in `lua/user/plugins/plenary.lua`
- [ ] Add `project_dir = "--- Inbox"` to `lua/user/config.lua`
- [ ] Extend `lua/user/obsidian/task_utils.lua`: `PRIORITY_ICONS`, `EXTRA_MARKERS`, `parse_task(line)` → `{ title, dates, priority, extras }`, with plenary specs
- [ ] Add `lua/user/obsidian/promote_task_to_project.lua`: template constant, `render()`, `filename_for()`, `extract_links()`, `create_project()`, `promote()`, with plenary specs
- [ ] Wire `<Leader>otf` in `lua/user/plugins/obsidian.lua` keys table

## Agent decisions

- Plenary placed as a real plugin dependency (`lua/user/plugins/plenary.lua`) rather than relying on transitive availability: no top-level plenary spec exists, specs must be runnable standalone (box 2)