local M = {
	"dnlhc/glance.nvim",
	enabled = false,
}

M.config = function()
	require("glance").setup({
		folds = {
			folded = false, -- don't fold items, please
		},
		-- your configuration
	})
end

return M
