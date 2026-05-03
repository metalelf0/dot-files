-- form-builder-nvim: a small floating-window form builder used by other plugins
-- (e.g. the obsidian "new task" popup). loaded lazily on demand by `require("form-builder")`.
return {
	"metalelf0/form-builder-nvim",
	dev = true,
	name = "form-builder-nvim",
	lazy = true,
	dependencies = {
		"folke/snacks.nvim",
	},
}
