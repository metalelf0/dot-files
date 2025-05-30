local M = {
	"akinsho/toggleterm.nvim",
}

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc><esc>", [[<C-\><C-n>]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
end

function _LAZYGIT_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", dir = vim.fn.getcwd(), hidden = true })
	lazygit:toggle()
end

function _NODE_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local node = Terminal:new({ cmd = "node", hidden = true })
	node:toggle()
end

function _NCDU_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
	ncdu:toggle()
end

function _HTOP_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local htop = Terminal:new({ cmd = "htop", hidden = true })
	htop:toggle()
end

function _PYTHON_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local python = Terminal:new({ cmd = "python", hidden = true })
	python:toggle()
end

M.config = function()
	local tt = require("toggleterm")
	local ttt = require("toggleterm.terminal")

	vim.g["test#custom_strategies"] = {
		tterm = function(cmd)
			tt.exec(cmd)
		end,

		tterm_close = function(cmd)
			local term_id = 0
			tt.exec(cmd, term_id)
			ttt.get_or_create_term(term_id):close()
		end,
	}

	vim.g["test#strategy"] = "tterm"

	tt.setup({
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		-- shade_filetypes = {},
		-- shade_terminals = false,
		-- shading_factor = 1,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			highlights = {
				border = "shadow",
				-- background = "Normal",
				width = 10,
			},
		},
	})

	vim.api.nvim_create_autocmd("TermOpen", {
		callback = function()
			set_terminal_keymaps()
		end,
		pattern = "term://*",
	})
end

return M
