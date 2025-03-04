return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPost",
	config = function()
		local harpoon = require("harpoon")
		require("harpoon"):setup()
		local keymap = vim.keymap.set

		keymap("n", "<leader>`", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })

		keymap("n", "<leader>~", function()
			harpoon:list():add()
		end, { desc = "Add file" })

		keymap("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Goto file 1" })
		keymap("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Goto file 2" })
		keymap("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Goto file 3" })
		keymap("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Goto file 4" })
	end,
}
