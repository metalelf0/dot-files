return {
	"bloznelis/before.nvim",
	event = "VeryLazy",
	config = function()
		local before = require("before")
		before.setup()

		vim.keymap.set("n", "<C-h>", before.jump_to_last_edit, {})
		vim.keymap.set("n", "<C-l>", before.jump_to_next_edit, {})
	end,
}
