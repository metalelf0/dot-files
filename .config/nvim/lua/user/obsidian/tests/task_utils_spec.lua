local task_utils = require("user.obsidian.task_utils")

describe("task_utils.parse_task", function()
	it("returns nil for a non-task line", function()
		assert.is_nil(task_utils.parse_task("- [-] plain list item"))
		assert.is_nil(task_utils.parse_task(""))
	end)

	it("extracts the title from an obsidian task line", function()
		local task = task_utils.parse_task("- [-] #task Buy milk")

		assert.are.same("Buy milk", task.title)
	end)

	it("stops the title before a date marker", function()
		local task = task_utils.parse_task("- [-] #task Merge PR #2819 ⏫ ➕ 2026-11-18 🛫 2026-11-18")

		assert.are.same("Merge PR #2819", task.title)
	end)

	it("reads every date marker into its own field", function()
		local task = task_utils.parse_task(
			"- [-] #task Ship it ➕ 2026-11-18 🛫 2026-11-19 ⏳ 2026-11-20 📅 2026-11-21 ❌ 2026-11-22"
		)

		assert.are.same({
			created = "2026-11-18",
			started = "2026-11-19",
			scheduled = "2026-11-20",
			planned = "2026-11-21",
			cancelled = "2026-11-22",
		}, task.dates)
	end)

	it("leaves absent date markers out of the result", function()
		local task = task_utils.parse_task("- [-] #task Ship it ➕ 2026-11-18")

		assert.are.same({ created = "2026-11-18" }, task.dates)
	end)

	it("maps each priority icon to its name", function()
		local cases = {
			{ "🔺", "highest" },
			{ "⏫", "high" },
			{ "🔼", "medium" },
			{ "🔽", "low" },
			{ "⏬", "lowest" },
		}

		for _, case in ipairs(cases) do
			local task = task_utils.parse_task("- [ ] #task Ship it " .. case[1] .. " ➕ 2026-11-18")
			assert.are.same(case[2], task.priority, "icon " .. case[1])
		end
	end)

	it("defaults priority to medium when no icon is present", function()
		local task = task_utils.parse_task("- [ ] #task Ship it ➕ 2026-11-18")

		assert.are.same("medium", task.priority)
	end)

	it("reads the extra markers without leaking them into the title", function()
		local task = task_utils.parse_task(
			"- [x] #task Ship it ✅ 2026-11-20 🔁 every week 🆔 abc123 ⛔ xyz789 🏁 delete ➕ 2026-11-18"
		)

		assert.are.same("Ship it", task.title)
		assert.are.same({
			done = "2026-11-20",
			recurrence = "every week",
			id = "abc123",
			depends_on = "xyz789",
			on_completion = "delete",
		}, task.extras)
	end)

	it("keeps markdown links in the title", function()
		local task = task_utils.parse_task(
			"- [-] #task Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819) ⏫ ➕ 2026-11-18"
		)

		assert.are.same("Merge [PR #2819](https://github.com/qonto-private/accounting/pull/2819)", task.title)
	end)

	it("reports the checkbox status", function()
		local cases = {
			{ "- [ ] #task Ship", " " },
			{ "- [/] #task Ship", "/" },
			{ "- [-] #task Ship", "-" },
			{ "- [x] #task Ship", "x" },
		}

		for _, case in ipairs(cases) do
			assert.are.same(case[2], task_utils.parse_task(case[1]).status, case[1])
		end
	end)

	it("reports the status of an indented task", function()
		assert.are.same("-", task_utils.parse_task("    - [-] #task Ship").status)
	end)
end)

describe("task_utils.is_task_line", function()
	it("matches a task at column 0", function()
		assert.is_true(task_utils.is_task_line("- [ ] #task Ship"))
	end)

	it("matches an indented task", function()
		assert.is_true(task_utils.is_task_line("  - [ ] #task Ship"))
		assert.is_true(task_utils.is_task_line("\t- [ ] #task Ship"))
	end)

	it("rejects a plain bullet and a plain line", function()
		assert.is_false(task_utils.is_task_line("  - plain bullet"))
		assert.is_false(task_utils.is_task_line("  Remember to buy the milk."))
	end)
end)

describe("task_utils.parse_task children", function()
	it("splits child lines into text and tasks", function()
		local task = task_utils.parse_task("- [ ] #task Do something", {
			"  Remember to buy the milk.",
			"  - [ ] #task Remember to buy the milk.",
			"  More prose.",
		})

		assert.are.same({ "  Remember to buy the milk.", "  More prose." }, task.children.text)
		assert.are.same({ "  - [ ] #task Remember to buy the milk." }, task.children.tasks)
	end)

	it("treats a plain indented bullet as text", function()
		local task = task_utils.parse_task("- [ ] #task Do something", { "  - plain bullet" })

		assert.are.same({ "  - plain bullet" }, task.children.text)
		assert.are.same({}, task.children.tasks)
	end)

	it("returns empty children when none are given", function()
		local task = task_utils.parse_task("- [ ] #task Do something")

		assert.are.same({ text = {}, tasks = {} }, task.children)
	end)

	it("does not treat the task's own line as a child", function()
		local task = task_utils.parse_task("- [ ] #task Do something", {})

		assert.are.same("Do something", task.title)
	end)
end)