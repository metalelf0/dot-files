local utils = require("user.utils")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local find_files = function ()
  require("telescope.builtin").find_files(
    require("telescope.themes").get_dropdown({ path_display = { truncate = 5 } })
  )
end

local telescope_colorscheme = function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end

local insert_emoji = function()
  require("telescope.builtin").symbols({ sources = { "emoji" } })
end

local insert_gitmoji = function()
  require("telescope.builtin").symbols({ sources = { "gitmoji" } })
end

-- == Normal mode mappings == --

-- Top-level mappings --
vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Alpha dashboard" })
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Find text" })
vim.keymap.set("n", "<leader>p", find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>k", require('telescope.builtin').grep_string, { desc = "Find word under cursor" })
vim.keymap.set("n", "<leader>R", require('telescope.builtin').resume, { desc = "Resume last search" })
vim.keymap.set("n", "<leader><leader>", require('legendary').find, { desc = "Legendary" })
vim.keymap.set("n", "<leader>N", function() utils.search_files_in_dir("~/iCloud-Obsidian") end, { desc = "Notes" })

-- Buffers --
vim.keymap.set("n", "<leader>bb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })
vim.keymap.set("n", "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
vim.keymap.set("n", "<leader>bca", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all" })
vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
vim.keymap.set("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
vim.keymap.set("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
vim.keymap.set("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })

-- Git --
vim.keymap.set("n", "<leader>gR", require('gitsigns').reset_buffer, { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Diff" })
vim.keymap.set("n", "<leader>gg", function() _LAZYGIT_TOGGLE() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gj", require('gitsigns').next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>gk", require('gitsigns').prev_hunk, { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>gl", require('gitsigns').blame_line, { desc = "Blame line" })
vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
vim.keymap.set("n", "<leader>gp", require('gitsigns').preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gr", require('gitsigns').reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gs", require('gitsigns').stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gu", require('gitsigns').undo_stage_hunk, { desc = "Undo stage hunk" })

-- Helpers --
vim.keymap.set("n", "<leader>ht", telescope_colorscheme, { desc = "Colorschemes" })

-- Insert --
vim.keymap.set("n", "<leader>ie", insert_emoji, { desc = "Emoji" })
vim.keymap.set("n", "<leader>ig", insert_gitmoji, { desc = "Gitmoji" })

-- Test --
vim.keymap.set("n", "<leader>jl", "<cmd>TestLast<CR>", { desc = "Last" })
vim.keymap.set("n", "<leader>jn", "<cmd>TestNearest<CR>", { desc = "Nearest" })
vim.keymap.set("n", "<leader>jf", "<cmd>TestFile<CR>", { desc = "File" })
vim.keymap.set("n", "<leader>js", "<cmd>TestSuite<CR>", { desc = "Suite" })

-- LSP --
vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer info" })
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
vim.keymap.set("n", "<leader>ld", function() require("telescope.builtin").lsp_definitions({ jump_type = "never"}) end, { desc = "Show definition" })
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
vim.keymap.set("n", "<leader>lj", function() vim.lsp.diagnostic.goto_next() end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>lk", function() vim.lsp.diagnostic.goto_prev() end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "<leader>ll", function() vim.lsp.diagnostic.open_float() end, { desc = "Line diagnostic" })
vim.keymap.set("n", "<leader>lr", function() require("telescope.builtin").lsp_references({ jump_type = "never"}) end, { desc = "Show references" })
vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })

-- Org, obsidian and friends --
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian - today" })

-- Packer and projects --
vim.keymap.set("n", "<leader>Pc", "<cmd>PackerCompile<cr>", { desc = "Packer - compile" })
vim.keymap.set("n", "<leader>Pi", "<cmd>PackerInstall<cr>", { desc = "Packer - install" })
vim.keymap.set("n", "<leader>Ps", "<cmd>PackerSync<cr>", { desc = "Packer - sync" })
vim.keymap.set("n", "<leader>PS", "<cmd>PackerStatus<cr>", { desc = "Packer - status" })
vim.keymap.set("n", "<leader>Pu", "<cmd>PackerUpdate<cr>", { desc = "Packer - update" })
vim.keymap.set("n", "<leader>Pp", require("telescope").extensions.projects.projects, { desc = "Projects" })

-- Search --
vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
vim.keymap.set("n", "<leader>sb", function() require("telescope.builtin").live_grep({ grep_open_files = true }) end, { desc = "Search in buffers" })
vim.keymap.set("n", "<leader>sf", function() require("spectre").open_file_search() end, { desc = "Search in file" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sp", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard (aka pastes)" })
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open recent File" })
vim.keymap.set("n", "<leader>ss", function() require("spectre").open() end, { desc = "Spectre" })

-- Terminal --
vim.keymap.set("n", "<leader>tn", function() _NODE_TOGGLE() end, { desc = "Node" })
vim.keymap.set("n", "<leader>tu", function() _NCDU_TOGGLE() end, { desc = "NCDU" })
vim.keymap.set("n", "<leader>tt", function() _HTOP_TOGGLE() end, { desc = "Htop" })
vim.keymap.set("n", "<leader>tp", function() _PYTHON_TOGGLE() end, { desc = "Python" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["b"] = { name = "Buffers", ["c"] = { name = "Close" } },
	P = { name = "Packer / Projects" },
	g = { name = "Git" },
	h = { name = "helpers", },
	i = { name = "Insert", },
	j = { name = "Test", },
	l = { name = "LSP" },
	o = {
		name = "org",
		a = { "Org: agenda" },
		c = { "Org: capture" },
		-- n = {
		-- 	name = "neorg",
		-- 	c = { "<cmd>Neorg gtd capture<cr>", "(GTD) capture" },
		-- 	e = { "<cmd>Neorg gtd edit<cr>", "(GTD) edit" },
		-- 	l = { "<cmd>Telescope neorg insert_file_link<cr>", "Insert file link" },
		-- 	s = { "<cmd>NeorgStart<cr>", "Start neorg" },
		-- 	v = { "<cmd>Neorg gtd views<cr>", "(GTD) views" },
		-- 	w = { "<cmd>Telescope neorg switch_workspace<cr>", "Switch workspace" },
		-- },
	},
	s = {
		name = "Search",
	},
	t = {
		name = "Terminal",
	},

}

if vim.g.neovide then
	mappings["h"]["+"] = {
		function()
			ResizeGuiFont(1)
		end,
		"Increase font size",
	}
	mappings["h"]["-"] = {
		function()
			ResizeGuiFont(-1)
		end,
		"Decrease font size",
	}
	mappings["h"]["="] = {
		function()
			ResetGuiFont()
		end,
		"Reset font size",
	}
end

which_key.setup(setup)
which_key.register(mappings, opts)

local visualModeMappings = {
	S = {
		name = "Spectre",
		v = {
			function()
				require("spectre").open_visual()
			end,
			"Open spectre",
		},
		w = {
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			"Search word",
		},
	},
}

local visualModeOpts = {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
which_key.register(visualModeMappings, visualModeOpts)

