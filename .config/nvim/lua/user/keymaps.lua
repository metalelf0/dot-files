local opts = { noremap = true, silent = true }
local utils = require("user.utils")
local buffer_utils = require("user.buffer_utils")
local config = require("user.config")
buffer_utils.setup()

-- Shorten function name
local keymap = vim.keymap.set

local function merge_opts(first, second)
	for k, v in pairs(second) do
		first[k] = v
	end
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

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

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Split utils
keymap("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
keymap("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })

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
	local mc = require("multicursor-nvim")
	if mc.hasCursors() then
		mc.clearCursors()
	end
	vim.cmd("noh")
	require("notify").dismiss()
end

keymap("n", "<Esc><Esc>", clearStuff)

-- change text related mappings
keymap("n", "cg*", "*Ncgn", opts)
vim.cmd([[ nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc> ]])

-- alt + s to sort across commas in visual selection
vim.api.nvim_exec(
	[[
xnoremap ß s<c-r>=join(sort(split(@", '\s*,\s*')), ', ')<cr><esc>
]],
	true
)

local find_files = function()
	require("telescope.builtin").find_files(
		require("telescope.themes").get_dropdown({ path_display = { "filename_first", truncate = 5 } })
	)
end

-- local telescope_colorscheme = function()
-- 	require("telescope.builtin").colorscheme({ enable_preview = true })
-- end

local insert_emoji = function()
	require("telescope.builtin").symbols({ sources = { "emoji" } })
end

local insert_gitmoji = function()
	require("telescope.builtin").symbols({ sources = { "gitmoji" } })
end

-- - to open file browser
keymap("n", "-", function()
	if config.filemanager == "oil" then
		require("oil").open()
	elseif config.filemanager == "mini.files" then
		MiniFiles.open(vim.api.nvim_buf_get_name(0))
	elseif config.filemanager == "neo-tree" then
		vim.cmd([[Neotree toggle reveal_force_cwd]])
	end
end, { desc = "File manager" })

keymap("n", "<leader>.", "<cmd>Neotree toggle reveal_force_cwd<cr>", { desc = "Focus file in tree" })

keymap("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Search text" })

-- keymap("n", "<leader>a", "<cmd>Dashboard<cr>", { desc = "󰕮 Dashboard" })
keymap("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Dashboard" })

keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope enhanced_find_files<cr>")

-- Buffers --
keymap("n", "<leader>bb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buffers" })
keymap("n", "<leader>,", function()
	require("telescope.builtin").buffers({ only_cwd = true })
end, { desc = "Buffers" })

vim.keymap.set("n", "<Leader>bu", function()
	require("user.buffer_utils").clear_unused()
end, { silent = true, desc = "Close unused buffers" })

keymap("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })
keymap("n", "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
keymap("n", "<leader>bca", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all" })
-- keymap("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
-- keymap("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
-- keymap("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
-- keymap("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
-- keymap("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
-- keymap("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
-- keymap("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
-- keymap("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
-- keymap("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })
--
-- Git --
keymap("n", "<leader>ga", "<cmd>AdvancedGitSearch<cr>", { desc = "Advanced git search" })
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
keymap("n", "<leader>gG", function()
	_LAZYGIT_TOGGLE()
end, { desc = "Lazygit" })
-- keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
keymap("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- harpoon --
keymap("n", "<leader>`", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon menu" })

keymap("n", "<leader>~", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file" })

keymap("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Goto file 1" })
keymap("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Goto file 2" })
keymap("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Goto file 3" })
keymap("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Goto file 4" })

-- Helpers --
keymap("n", "<leader>hl", function()
	require("lazy").show()
end, { desc = "Lazy" })
keymap("n", "<leader>hm", "<cmd>Mason<CR>", { desc = "Mason" })
keymap("n", "<leader>hL", function()
	require("user.quick-menu").run()
end, { desc = "Quick menu" })

-- Ui --
keymap("n", "<leader>ub", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
keymap("n", "<leader>ue", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
keymap("n", "<leader>ug", "<cmd>Neotree git_status<cr>", { desc = "Git status explorer" })
-- keymap("n", "<leader>udd", "<cmd>ToggleDiag<CR>", { desc = "Toggle diagnostics" })

keymap("n", "<leader>udu", "<Plug>(toggle-lsp-diag-underline)", { desc = "Diagnostic - toggle underline" })
keymap("n", "<leader>uds", "<Plug>(toggle-lsp-diag-signs)", { desc = "Diagnostic - toggle signs" })
keymap("n", "<leader>udv", "<Plug>(toggle-lsp-diag-vtext)", { desc = "Diagnostic - toggle vtext" })
keymap(
	"n",
	"<leader>udp",
	"<Plug>(toggle-lsp-diag-update_in_insert)",
	{ desc = "Diagnostic - toggle update in insert" }
)
keymap("n", "<leader>udd", "<Plug>(toggle-lsp-diag)", { desc = "Diagnostic - toggle all" })
keymap("n", "<leader>uddd", "<Plug>(toggle-lsp-diag-default)", { desc = "Diagnostic - toggle default" })
keymap("n", "<leader>uddo", "<Plug>(toggle-lsp-diag-off)", { desc = "Diagnostic - toggle default off" })
keymap("n", "<leader>uddf", "<Plug>(toggle-lsp-diag-on)", { desc = "Diagnostic - toggle default on" })

keymap("n", "<leader>ui", "<cmd>IndentBlanklineToggle<CR>", { desc = "Indent lines (toggle)" })
keymap("n", "<leader>uk", function()
	require("user.colorscheme_utils").export_colors_to_kitty()
end, { desc = "Export colors to Kitty" })
keymap("n", "<leader>uw", function()
	require("user.colorscheme_utils").export_colors_to_wezterm()
end, { desc = "Export colors to Wezterm" })

-- Git and friends --
keymap("n", "<leader>goo", "<cmd>Octo pr create<CR>", { desc = "Open PR" })
keymap("n", "<leader>gol", "<cmd>Octo pr list<CR>", { desc = "List PRs" })
keymap("n", "<leader>gou", "<cmd>Octo pr url<CR>", { desc = "Copy PR url" })
keymap("n", "<leader>gop", "<cmd>Octo pr<CR>", { desc = "Open current branch PR" })

-- Insert --
keymap("n", "<leader>ie", insert_emoji, { desc = "Emoji" })
keymap("n", "<leader>ig", insert_gitmoji, { desc = "Gitmoji" })

-- Test --
keymap("n", "<leader>jj", function()
	require("treesj").toggle()
end, { desc = "Join (toggle)" })
keymap("n", "<leader>jl", "<cmd>TestLast<CR>", { desc = "Last" })
keymap("n", "<leader>jn", "<cmd>TestNearest<CR>", { desc = "Nearest" })
keymap("n", "<leader>jf", "<cmd>TestFile<CR>", { desc = "File" })
keymap("n", "<leader>js", "<cmd>TestSuite<CR>", { desc = "Suite" })

-- LSP --
keymap("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer info" })
keymap("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
keymap("n", "<leader>ld", function()
	require("telescope.builtin").lsp_definitions({ jump_type = "never" })
end, { desc = "Show definition" })

keymap("n", "<leader>lf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

keymap("n", "<leader>lF", function()
	require("user.plugins.lsp.formatting").toggle()
end, { desc = "Toggle on-save formatting" })

keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
keymap("n", "<leader>lj", function()
	vim.lsp.diagnostic.goto_next()
end, { desc = "Next diagnostic" })
keymap("n", "<leader>lk", function()
	vim.lsp.diagnostic.goto_prev()
end, { desc = "Prev diagnostic" })
keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Line diagnostic" })
keymap("n", "<leader>lr", function()
	require("telescope.builtin").lsp_references({ jump_type = "never" })
end, { desc = "Show references" })
keymap("n", "<leader>ls", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })
keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
keymap("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { desc = "Trouble toggle" })

keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Definition", noremap = true, silent = true })
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References", noremap = true, silent = true })

keymap("n", "gr", function()
	require("telescope.builtin").lsp_references({ jump_type = "never" })
end, { desc = "References" })

-- Org, obsidian and friends --
-- see lua/user/plugins/obsidian.nvim

-- Projects --
keymap("n", "<leader>Pp", function()
	require("telescope").extensions.projects.projects()
end, { desc = "Projects" })

-- Refactorings --
keymap("n", "<leader>ra", function()
	require("ts-node-action").node_action()
end, { desc = "Action" })

-- Search --
keymap("n", "<leader>s<CR>", function()
	require("telescope.builtin").resume()
end, { desc = "Resume previous search" })
keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap("n", "<leader>sb", function()
	require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Search in buffers" })
keymap("n", "<leader>sg", "<cmd>AdvancedGitSearch<cr>", { desc = "Search inside git" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap("n", "<leader>sp", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard (aka pastes)" })
keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open recent File" })
keymap("n", "<leader>st", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Search text" })

keymap("n", "<leader>sT", "<cmd>TodoTelescope<cr>", { desc = "Search todo" })

keymap("n", "<leader>sw", function()
	require("telescope.builtin").grep_string()
end, { desc = "Search word under cursor" })

-- Terminal --
keymap("n", "<leader>tn", function()
	_NODE_TOGGLE()
end, { desc = "Node" })
keymap("n", "<leader>tu", function()
	_NCDU_TOGGLE()
end, { desc = "NCDU" })
keymap("n", "<leader>tt", function()
	_HTOP_TOGGLE()
end, { desc = "Htop" })
keymap("n", "<leader>tp", function()
	_PYTHON_TOGGLE()
end, { desc = "Python" })

keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })

keymap("v", "<leader>uj", function()
	require("user.utils").open_jira_task_visual()
end, { desc = "Open visual selected jira task" })

local status_ok, fun = pcall(require, "user.fun")
if status_ok then
	fun.set_keymaps()
end

local status_ok, event_logger = pcall(require, "user.event_logger")
if status_ok then
	event_logger.set_keymaps()
end
