return {
	"stevearc/quicker.nvim",
	event = "FileType qf",
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		wrap = true,
		max_filename_width = function()
			return 50
		end,
	},
}
