return {
	"supermaven-inc/supermaven-nvim",
	enabled = false,
	config = function()
		require("supermaven-nvim").setup({
			disable_inline_completion = true, -- disables inline completion for use with cmp
		})
	end,
}
