return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup()
	end,
	keys = {
		-- #TODO: implement "search in current file"
		-- {
		-- 	"<leader>sf",
		-- 	function()
		--       require('grug-far').open()
		-- 	end,
		-- 	desc = "Search in file (spectre)",
		-- },
		{
			"<leader>ss",
			function()
				require("grug-far").open()
			end,
			desc = "Search and replace",
		},
		{
			"<leader>Sv",
			function()
				require("grug-far").with_visual_selection()
			end,
			mode = "v",
			desc = "Search and replace",
		},
	},
}
