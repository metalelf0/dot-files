local utils = require("user.utils")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

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
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
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
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
    name = "Buffers",
    ["b"] = { function() require("telescope.builtin").buffers() end, "Buffers" },
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "Buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "Buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "Buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "Buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "Buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "Buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<CR>", "Buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<CR>", "Buffer 9" },
    ["c"] = {
      name = "Close",
      ["a"] = { "<cmd>BufferLineCloseLeft<CR>", "All" },
      ["l"] = { "<cmd>BufferLineCloseLeft<CR>", "Left" },
      ["r"] = { "<cmd>BufferLineCloseRight<CR>", "Right" }

    }
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["C"] = { "<cmd>%bd|e#|bd#<CR>", "Close all buffers" },
	["p"] = {
		function()
			require("telescope.builtin").find_files(
				require("telescope.themes").get_dropdown({ path_display = { truncate = 5 } })
			)
		end,
		"Find files",
	},
	["f"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	P = {
		name = "Packer / Projects",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		p = {
			function()
				require("telescope").extensions.projects.projects()
			end,
			"Projects",
		},
	},
	g = {
		name = "Git",
		g = {
			function()
				_LAZYGIT_TOGGLE()
			end,
			"Lazygit",
		},
		j = {
			function()
				require("gitsigns").next_hunk()
			end,
			"Next Hunk",
		},
		k = {
			function()
				require("gitsigns").prev_hunk()
			end,
			"Prev Hunk",
		},
		l = {
			function()
				require("gitsigns").blame_line()
			end,
			"Blame",
		},
		p = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"Preview Hunk",
		},
		r = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"Reset Hunk",
		},
		R = {
			function()
				require("gitsigns").reset_buffer()
			end,
			"Reset Buffer",
		},
		s = {
			function()
				require("gitsigns").stage_hunk()
			end,
			"Stage Hunk",
		},
		u = {
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	h = {
		name = "helpers",
		t = {
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			"Theme",
		},
	},
	i = {
		name = "Insert",
		e = {
			function()
				require("telescope.builtin").symbols({ sources = { "emoji" } })
			end,
			"Emoji",
		},
		g = {
			function()
				require("telescope.builtin").symbols({ sources = { "gitmoji" } })
			end,
			"Gitmoji",
		},
	},
	j = {
		name = "Test",
		l = { "<cmd>TestLast<CR>", "Last" },
		n = { "<cmd>TestNearest<CR>", "Nearest" },
		f = { "<cmd>TestFile<CR>", "File" },
		s = { "<cmd>TestSuite<CR>", "Suite" },
		L = { "<cmd>TestLast -strategy=tterm_close<CR>", "Last (and close)" },
		N = { "<cmd>TestNearest -strategy=tterm_close<CR>", "Nearest (and close)" },
		F = { "<cmd>TestFile -strategy=tterm_close<CR>", "File (and close)" },
		S = { "<cmd>TestSuite -strategy=tterm_close<CR>", "Suite (and close)" },
	},
	l = {
		name = "LSP",
		a = {
			function()
				vim.lsp.buf.code_action()
			end,
			"Code Action",
		},
		d = {
			function()
				require("telescope.builtin").lsp_definitions({ jump_type = "never" })
			end,
			"Find definition",
		},
		D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format",
		},
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			function()
				vim.lsp.diagnostic.goto_next()
			end,
			"Next Diagnostic",
		},
		k = {
			function()
				vim.lsp.diagnostic.goto_prev()
			end,
			"Prev Diagnostic",
		},
		-- l = { function() vim.lsp.codelens.run() end, "CodeLens Action" },
		l = {
			function()
				vim.diagnostic.open_float()
			end,
			"Show Line Diagnostics",
		},
		q = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Quickfix",
		},
		r = {
			function()
				require("telescope.builtin").lsp_references({ jump_type = "never" })
			end,
			"Find references",
		},
		R = {
			function()
				vim.lsp.buf.rename()
			end,
			"Rename",
		},
		s = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
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
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		b = {
			function()
				require("telescope.builtin").live_grep({ grep_open_files = true })
			end,
			"Search in buffers",
		},
		f = {
			function()
				require("spectre").open_file_search()
			end,
			"Search in file",
		},
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		p = { "<cmd>Telescope neoclip<cr>", "Clipboard (aka pastes)" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		s = {
			function()
				require("spectre").open()
			end,
			"Open spectre",
		},
	},
	t = {
		name = "Terminal",
		n = {
			function()
				_NODE_TOGGLE()
			end,
			"Node",
		},
		u = {
			function()
				_NCDU_TOGGLE()
			end,
			"NCDU",
		},
		t = {
			function()
				_HTOP_TOGGLE()
			end,
			"Htop",
		},
		p = {
			function()
				_PYTHON_TOGGLE()
			end,
			"Python",
		},
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	-- custom settings
	-- ["N"] = { "<cmd>:NV<cr>", "Notes" },
  ["N"] = { function() utils.search_files_in_dir("~/Notes") end, "Notes" },
	k = { ":lua require('telescope.builtin').grep_string()<CR>", "Find word under cursor" },
	R = { ":lua require('telescope.builtin').resume()<CR>", "Resume last search" },
	[" "] = {
		function()
			require("legendary").find()
		end,
		"Legendary",
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
