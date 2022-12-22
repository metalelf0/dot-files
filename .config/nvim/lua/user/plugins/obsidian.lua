local M = {
  "epwalsh/obsidian.nvim",
  cmd = { 'ObsidianOpen', 'ObsidianToday', 'ObsidianYesterday', 'ObsidianSearch', 'ObsidianNew' }
}

M.config = function()
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
