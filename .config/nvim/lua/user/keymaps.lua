local opts = { noremap = true, silent = true }
local utils = require("user.utils")

-- Shorten function name
local keymap = vim.keymap.set

local function merge_opts(first, second)
  for k,v in pairs(second) do first[k] = v end
end


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

--[[ vim.cmd 'nnoremap <Esc><Esc> :nohlsearch<CR>' ]]

local clearStuff = function()
  vim.cmd("noh")
  require('notify').dismiss()
end

keymap("n", "<Esc><Esc>", clearStuff)

-- change text related mappings
keymap("n", "cg*", "*Ncgn", opts)
vim.cmd [[ nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc> ]]

-- alt + s to sort across commas in visual selection
vim.api.nvim_exec(
[[
xnoremap ß s<c-r>=join(sort(split(@", '\s*,\s*')), ', ')<cr><esc>
]],
true)

local find_files = function()
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

-- - to open file browser
keymap("n", "-", function() require"telescope".extensions.file_browser.file_browser({path = "%:p:h"}) end, opts)
keymap("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Alpha dashboard" })
keymap("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "Close buffer" })

print("Setting up tree mappings...")
require("user.tree").setupMappings()

keymap("n", "<leader>f", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Find text" })
keymap("n", "<leader>p", find_files, { desc = "Find files" })
keymap("n", "<leader>k", require("telescope.builtin").grep_string, { desc = "Find word under cursor" })
keymap("n", "<leader>R", require("telescope.builtin").resume, { desc = "Resume last search" })
keymap("n", "<leader><leader>", require("legendary").find, { desc = "Legendary" })
keymap("n", "<leader>N", function() utils.search_files_in_dir("~/iCloud-Obsidian") end, { desc = "Notes" })

-- Buffers --
keymap("n", "<leader>bb", require("telescope.builtin").buffers, { desc = "Buffers" })
keymap("n", "<leader>bl", function() require("telescope.builtin").buffers({ cwd_only = true }) end, { desc = "Buffers (cwd)" })
keymap("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })
keymap("n", "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
keymap("n", "<leader>bca", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all" })
keymap("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
keymap("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
keymap("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
keymap("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
keymap("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
keymap("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
keymap("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
keymap("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
keymap("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })

-- Git --
keymap("n", "<leader>gR", require("gitsigns").reset_buffer, { desc = "Reset buffer" })
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Diff" })
keymap("n", "<leader>gg", function()
  _LAZYGIT_TOGGLE()
end, { desc = "Lazygit" })
keymap("n", "<leader>gj", require("gitsigns").next_hunk, { desc = "Next hunk" })
keymap("n", "<leader>gk", require("gitsigns").prev_hunk, { desc = "Prev hunk" })
keymap("n", "<leader>gl", require("gitsigns").blame_line, { desc = "Blame line" })
keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
keymap("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
keymap("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
keymap("n", "<leader>gs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
keymap("n", "<leader>gu", require("gitsigns").undo_stage_hunk, { desc = "Undo stage hunk" })

-- Helpers --
keymap("n", "<leader>Ht", telescope_colorscheme, { desc = "Colorschemes" })

-- harpoon
keymap("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Add file" })
keymap("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Menu" })
keymap("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "Nav next" })
keymap("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "Nav prev" })

-- Insert --
keymap("n", "<leader>ie", insert_emoji, { desc = "Emoji" })
keymap("n", "<leader>ig", insert_gitmoji, { desc = "Gitmoji" })

-- Test --
keymap("n", "<leader>jl", "<cmd>TestLast<CR>", { desc = "Last" })
keymap("n", "<leader>jn", "<cmd>TestNearest<CR>", { desc = "Nearest" })
keymap("n", "<leader>jf", "<cmd>TestFile<CR>", { desc = "File" })
keymap("n", "<leader>js", "<cmd>TestSuite<CR>", { desc = "Suite" })

-- LSP --
keymap("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer info" })
keymap("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
keymap("n", "<leader>ld", function() require("telescope.builtin").lsp_definitions({ jump_type = "never" }) end, { desc = "Show definition" })
keymap("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
keymap("n", "<leader>lj", function() vim.lsp.diagnostic.goto_next() end, { desc = "Next diagnostic" })
keymap("n", "<leader>lk", function() vim.lsp.diagnostic.goto_prev() end, { desc = "Prev diagnostic" })
keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Line diagnostic" })
keymap("n", "<leader>lr", function() require("telescope.builtin").lsp_references({ jump_type = "never" }) end, { desc = "Show references" })
keymap("n", "<leader>ls", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })
keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
keymap("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { desc = "Trouble toggle" })

-- Org, obsidian and friends --
keymap("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian - today" })
keymap("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian - search" })
keymap("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian - new" })

-- Packer and projects --
keymap("n", "<leader>Pc", "<cmd>PackerCompile<cr>", { desc = "Packer - compile" })
keymap("n", "<leader>Pi", "<cmd>PackerInstall<cr>", { desc = "Packer - install" })
keymap("n", "<leader>Ps", "<cmd>PackerSync<cr>", { desc = "Packer - sync" })
keymap("n", "<leader>PS", "<cmd>PackerStatus<cr>", { desc = "Packer - status" })
keymap("n", "<leader>Pu", "<cmd>PackerUpdate<cr>", { desc = "Packer - update" })
keymap("n", "<leader>Pp", require("telescope").extensions.projects.projects, { desc = "Projects" })

-- Search --
keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap("n", "<leader>sb", function() require("telescope.builtin").live_grep({ grep_open_files = true }) end, { desc = "Search in buffers" })
keymap("n", "<leader>sf", function() require("spectre").open_file_search() end, { desc = "Search in file" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap("n", "<leader>sp", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard (aka pastes)" })
keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open recent File" })
keymap("n", "<leader>ss", function() require("spectre").open() end, { desc = "Spectre" })

-- Terminal --
keymap("n", "<leader>tn", function() _NODE_TOGGLE() end, { desc = "Node" })
keymap("n", "<leader>tu", function() _NCDU_TOGGLE() end, { desc = "NCDU" })
keymap("n", "<leader>tt", function() _HTOP_TOGGLE() end, { desc = "Htop" })
keymap("n", "<leader>tp", function() _PYTHON_TOGGLE() end, { desc = "Python" })

keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })
