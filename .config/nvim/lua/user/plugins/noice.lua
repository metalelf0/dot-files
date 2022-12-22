local M = {
  "folke/noice.nvim",
  event = "VeryLazy"
}

M.config = function()
	require("noice").setup({
		routes = {
			{
				filter = { event = "msg_show", find = "not a git repository" },
				opts = { skip = true },
			},
			{
				filter = { event = "msg_show", find = "is outside repository at" },
				opts = { skip = true },
			},
		},
	})
end

return M
