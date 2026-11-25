local promote = require("user.obsidian.promote_task_to_project")

describe("promote_task_to_project.filename_for", function()
	it("replaces a markdown link with its text", function()
		assert.are.same(
			"Merge PR #2819",
			promote.filename_for("Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819)")
		)
	end)

	it("replaces filesystem-illegal characters", function()
		assert.are.same("a-b-c-d-e-f-g-h", promote.filename_for("a/b:c*d?e\"f<g>h"))
	end)

	it("drops a leading hash", function()
		assert.are.same("task title", promote.filename_for("#task title"))
	end)
end)

describe("promote_task_to_project.extract_links", function()
	it("finds a github url", function()
		local links = promote.extract_links("Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819)")

		assert.are.same("https://github.com/qonto-private/accounting/pull/2819", links.github)
		assert.is_nil(links.notion)
	end)

	it("finds a notion url", function()
		local links = promote.extract_links("See https://www.notion.so/qonto/Page-abc123 for context")

		assert.are.same("https://www.notion.so/qonto/Page-abc123", links.notion)
		assert.is_nil(links.github)
	end)

	it("finds both", function()
		local links = promote.extract_links("https://github.com/a/b/pull/1 and https://foo.notion.site/x-y")

		assert.are.same("https://github.com/a/b/pull/1", links.github)
		assert.are.same("https://foo.notion.site/x-y", links.notion)
	end)
end)

describe("promote_task_to_project.render", function()
	local task = {
		title = "Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819)",
		priority = "high",
		dates = { created = "2026-11-18", planned = "2026-11-19", cancelled = "2026-11-23" },
		extras = {},
	}

	it("writes frontmatter dates as quoted YYYY-MM-DD HH:mm, defaulting the time to 00:00", function()
		local out = promote.render(task, { now = "2026-11-25 14:30" })

		assert.is_truthy(out:find('created: "2026-11-18 00:00"', 1, true))
		assert.is_truthy(out:find('planned: "2026-11-19 00:00"', 1, true))
		assert.is_truthy(out:find('cancelled: "2026-11-23 00:00"', 1, true))
	end)

	it("omits date keys the task does not set", function()
		local out = promote.render(task, { now = "2026-11-25 14:30" })

		assert.is_nil(out:find("scheduled:"))
		assert.is_nil(out:find("started:"))
	end)

	it("defaults created to now when the task has none", function()
		local undated = { title = "Ship", priority = "medium", dates = {}, extras = {} }

		local out = promote.render(undated, { now = "2026-11-25 14:30" })

		assert.is_truthy(out:find('created: "2026-11-25 14:30"', 1, true))
	end)

	it("writes the priority", function()
		local out = promote.render(task, { now = "2026-11-25 14:30" })

		assert.is_truthy(out:find("priority: high", 1, true))
	end)

	it("writes the title as a heading, keeping markdown links", function()
		local out = promote.render(task, { now = "2026-11-25 14:30" })

		assert.is_truthy(out:find("# Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819)", 1, true))
	end)

	it("fills the links section", function()
		local out = promote.render(task, { now = "2026-11-25 14:30" })

		assert.is_truthy(
			out:find("- [g] GitHub PR: https://github.com/qonto-private/accounting/pull/2819", 1, true)
		)
		assert.is_truthy(out:find("- [n] Notion page: \n", 1, true))
	end)

	it("lists the project tasks with today's date", function()
		local out = promote.render(task, { now = "2026-11-25 14:30", today = "2026-11-25" })

		assert.is_truthy(out:find("- [ ] #task #project Merge [PR #2819]", 1, true))
		assert.is_truthy(out:find("- [ ] #task Update notion page link ➕ 2026-11-25", 1, true))
	end)

	it("adds the extra markers after priority, only when present", function()
		local with_extras = {
			title = "Ship",
			priority = "low",
			dates = {},
			extras = { done = "2026-11-20", recurrence = "every week", id = "abc123" },
		}

		local out = promote.render(with_extras, { now = "2026-11-25 14:30" })

		assert.is_truthy(out:find("done: 2026-11-20", 1, true))
		assert.is_truthy(out:find("recurrence: every week", 1, true))
		assert.is_truthy(out:find("id: abc123", 1, true))
		assert.is_nil(out:find("depends_on:"))
	end)
end)

describe("promote_task_to_project.promoted_line", function()
	it("replaces the task with a wikilink list item", function()
		assert.are.same(
			"- [[Merge PR #2819]]",
			promote.promoted_line("Merge [PR #2819](https://github.com/a/b/pull/1)")
		)
	end)
end)