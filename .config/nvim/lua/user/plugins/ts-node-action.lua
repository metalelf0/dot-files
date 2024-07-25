-- ts-node-action allows running code actions on treesitter nodes
return {
	"ckolkey/ts-node-action",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter" },
	config = function() -- Optional
		require("ts-node-action").setup({})
	end,
}
