local M = {
	"rest-nvim/rest.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("rest-nvim").setup()
end

return M
