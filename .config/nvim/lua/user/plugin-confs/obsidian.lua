local M = {}

M.setup = function()
	require("obsidian").setup({
		dir = "~/iCloud-Obsidian",
		daily_notes = {
			folder = "work/dailies",
		},
		completion = {
			nvim_cmp = true,
		},
	})
end

return M
