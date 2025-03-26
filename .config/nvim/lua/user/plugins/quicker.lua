return {
	"stevearc/quicker.nvim",
	event = "FileType qf",
	enabled = false,
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		wrap = true,
		max_filename_width = function()
			return 100
		end,
	},
}
