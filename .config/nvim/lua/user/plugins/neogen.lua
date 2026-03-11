-- Neogen is a plugin to generate documentation for existing code
return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true,
	event = "BufReadPost",
}
