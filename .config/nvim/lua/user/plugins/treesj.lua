return {
	"Wansmer/treesj",
	config = function()
		require("treesj").setup({ use_default_keymaps = false, check_syntax_error = true, max_join_length = 100 })
	end,
}
