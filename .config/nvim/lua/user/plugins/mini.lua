local config = require("user.config")

local mini = {
	"echasnovski/mini.nvim",
	-- event = "VeryLazy",
}

local specs = { mini, {
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = "VeryLazy",
} }

function mini.surround()
	require("mini.surround").setup({
		mappings = {
			add = "ys", -- Add surrounding in Normal and Visual modes
			delete = "ds", -- Delete surrounding
			find = "gzf", -- Find surrounding (to the right)
			find_left = "gzF", -- Find surrounding (to the left)
			highlight = "gzh", -- Highlight surrounding
			replace = "cs", -- Replace surrounding
			update_n_lines = "gzn", -- Update `n_lines`
		},
	})
end

function mini.align()
	require("mini.align").setup({})
end

function mini.jump()
	require("mini.jump").setup({})
end

function mini.pairs()
	require("mini.pairs").setup({})
end

function mini.clue()
	if config.keymapper == "mini.clue" then
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				{ mode = "n", keys = "<Leader>P", desc = " Packer / Projects" },
				{ mode = "n", keys = "<Leader>b", desc = "󰓩 Buffers" },
				{ mode = "n", keys = "<Leader>c", desc = "󰓩 Code" },
				{ mode = "n", keys = "<Leader>g", desc = " Git" },
				{ mode = "n", keys = "<Leader>h", desc = "󰋖 Helpers" },
				{ mode = "n", keys = "<Leader>i", desc = " Insert" },
				{ mode = "n", keys = "<Leader>j", desc = "󰙨 Test / join" },
				{ mode = "n", keys = "<Leader>l", desc = "󰢻 LSP" },
				{ mode = "n", keys = "<Leader>o", desc = " Obsidian" },
				{ mode = "n", keys = "<Leader>r", desc = "󰬢 Refactorings" },
				{ mode = "n", keys = "<Leader>s", desc = "󰍉 Search" },
				{ mode = "n", keys = "<Leader>t", desc = " Terminal" },
				{ mode = "n", keys = "<Leader>u", desc = " UI" },
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = {
				delay = 0,
				config = {
					width = "auto",
				},
			},
		})
	end
end

function mini.comment()
	require("mini.comment").setup({
		hooks = {
			pre = function()
				require("ts_context_commentstring.internal").update_commentstring({})
			end,
		},
	})
end

function mini.files()
	if config.filemanager == "mini.files" then
		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 120,
			},
			mappings = {
				go_in_plus = "<CR>",
			},
		})
	end
end

function mini.ai()
	local ai = require("mini.ai")
	require("mini.ai").setup({
		n_lines = 500,
		-- search_method = "cover_or_next",
		custom_textobjects = {
			o = ai.gen_spec.treesitter({
				a = { "@block.outer", "@conditional.outer", "@loop.outer" },
				i = { "@block.inner", "@conditional.inner", "@loop.inner" },
			}, {}),
			f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
			c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
		},
	})

	local map = function(text_obj, desc)
		for _, side in ipairs({ "left", "right" }) do
			for dir, d in pairs({ prev = "[", next = "]" }) do
				local lhs = d .. (side == "right" and text_obj:upper() or text_obj:lower())
				for _, mode in ipairs({ "n", "x", "o" }) do
					vim.keymap.set(mode, lhs, function()
						ai.move_cursor(side, "a", text_obj, { search_method = dir })
					end, {
						desc = dir .. " " .. desc,
					})
				end
			end
		end
	end

	map("f", "function")
	map("c", "class")
	map("o", "block")
end

function mini.config()
	-- M.jump()
	mini.surround()
	mini.ai()
	mini.pairs()
	mini.comment()
	mini.files()
	mini.clue()
	mini.align()
	-- mini.animate()
end

function mini.animate()
	local mouse_scrolled = false
	for _, scroll in ipairs({ "Up", "Down" }) do
		local key = "<ScrollWheel" .. scroll .. ">"
		vim.keymap.set("", key, function()
			mouse_scrolled = true
			return key
		end, { remap = true, expr = true })
	end

	local animate = require("mini.animate")
	vim.go.winwidth = 20
	vim.go.winminwidth = 5

	animate.setup({
		resize = {
			timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
		},
		scroll = {
			timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
			subscroll = animate.gen_subscroll.equal({
				predicate = function(total_scroll)
					if mouse_scrolled then
						mouse_scrolled = false
						return false
					end
					return total_scroll > 1
				end,
			}),
		},
	})
end

function mini.init()
	vim.keymap.set("n", "<leader>bd", function()
		require("mini.bufremove").delete(0, false)
	end, { desc = "Close buffer" })
	vim.keymap.set("n", "<leader>bD", function()
		require("mini.bufremove").delete(0, true)
	end, { desc = "Force close buffer" })
end

return specs
