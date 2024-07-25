return {
	-- Neovim plugin for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
	"Wansmer/treesj",
	event = "VeryLazy",
	config = function()
		require("treesj").setup({ check_syntax_error = true, max_join_length = 100, use_default_keymaps = false })
	end,
}
