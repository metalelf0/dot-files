# Promote Obsidian task to project

> **Status:** Implemented

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
- [x] Extend `lua/user/obsidian/task_utils.lua`: `PRIORITY_ICONS`, `EXTRA_MARKERS`, `parse_task(line)` → `{ title, dates, priority, extras }`, with plenary specs
- [x] Add `lua/user/obsidian/promote_task_to_project.lua`: template constant, `render()`, `filename_for()`, `extract_links()`, `create_project()`, `promote()`, with plenary specs
- [x] Wire `<Leader>otf` in `lua/user/plugins/obsidian.lua` keys table

## Agent decisions

- Plenary placed as a real plugin dependency (`lua/user/plugins/plenary.lua`) rather than relying on transitive availability: no top-level plenary spec exists, specs must be runnable standalone (box 2)
- `M.DATE_MARKER_KEYS` split from `M.EXTRA_MARKERS` with a separate `M.DONE_MARKERS`: ✅ maps to an extras key but its value is a date, so it needs date-shaped matching (box 3)
- Recurrence is parsed last, its value running to end of line, because Tasks recurrence text contains spaces (`every week`) (box 3)
- `create_project()` folded into `promote()`: a separate function would only wrap `writefile` and the collision-suffix loop, adding a seam with one caller (box 4)
- `#` kept inside filenames, only a leading run stripped: `#` is legal on every target filesystem, and dropping it would mangle titles like `PR #2819` (box 4)
- Source status and date markers ported onto the project task line (`- [-] #task #project … ➕ … 🛫 … ⏳ … 📅 … ❌ …`), per user request after implementation: the promoted project task inherits the original's state instead of starting fresh (box 5)
- Ported markers emitted in frontmatter key order (created, started, scheduled, planned, cancelled) rather than source-line order, so the task line reads like the note header (box 5)
- Block scoping added after implementation, per user request: `is_task_line` relaxed to allow any indentation (child tasks now also get urgency labels and date concealment), and `parse_task` gained an optional `children` argument returning `{ text, tasks }` (box 5)
- Child text dedented to its common prefix into `## Description`; child tasks dedented then re-indented two spaces under the project task so they read as subtasks; runs of 2+ blank lines collapsed file-wide (box 5)