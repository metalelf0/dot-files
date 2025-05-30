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
-- keymap("i", "jk", "<ESC>", opts)

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

-- local telescope_colorscheme = function()
-- 	require("telescope.builtin").colorscheme({ enable_preview = true })
-- end

local insert_emoji = function()
	require("telescope.builtin").symbols({ sources = { "emoji" } })
end

local insert_gitmoji = function()
	require("telescope.builtin").symbols({ sources = { "gitmoji" } })
end

local open_file_explorer = function()
	if config.filemanager == "oil" then
		require("oil").open()
	elseif config.filemanager == "mini.files" then
		MiniFiles.open(vim.api.nvim_buf_get_name(0))
	elseif config.filemanager == "neo-tree" then
		vim.cmd([[Neotree toggle reveal_force_cwd]])
	elseif config.filemanager == "snacks" then
		Snacks.picker.explorer()
	end
end

-- - to open file browser
keymap("n", "-", function()
	open_file_explorer()
end, { desc = "File manager" })

keymap("n", "<leader>.", function()
	open_file_explorer()
end, { desc = "Focus file in tree" })

keymap("n", "<leader>/", function()
	Snacks.picker.grep({ layout = "ivy_split" })
end, { desc = "Search text" })

keymap("n", "<leader>?", function()
	Snacks.picker.git_grep({ layout = "ivy_split" })
end, { desc = "Search text in git files" })

keymap("n", "<leader>p", function()
	Snacks.picker.files({ layout = "telescope" })
end, { desc = "Find files" })

keymap("n", "<leader>P", function()
	Snacks.picker.git_files({ layout = "telescope" })
end, { desc = "Find (git) files" })

vim.keymap.set("n", "<leader><leader>", function()
	Snacks.picker.smart()
end)

vim.keymap.set("n", "<leader><CR>", function()
	Snacks.picker.resume()
end)

-- Buffers --
keymap("n", "<leader>bb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
keymap("n", "<leader>,", function()
	Snacks.picker.buffers({ filter = { cwd = true } })
end, { desc = "Cwd buffers" })

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
keymap("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Checkout branch" })
keymap("n", "<leader>gc", function()
	Snacks.picker.git_log()
end, { desc = "Checkout commit" })
keymap("n", "<leader>gG", function()
	require("snacks").lazygit()
end, { desc = "Lazygit" })
keymap("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- Helpers --
keymap("n", "<leader>hl", function()
	require("lazy").show()
end, { desc = "Lazy" })
keymap("n", "<leader>hm", "<cmd>Mason<CR>", { desc = "Mason" })
keymap("n", "<leader>hL", function()
	require("user.quick-menu").run()
end, { desc = "Quick menu" })

-- UI --
keymap("n", "<leader>ub", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })

-- keymap("n", "<leader>uE", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })

keymap("n", "<leader>ue", function()
	Snacks.explorer()
end, { desc = "Snacks explorer" })

keymap("n", "<leader>uE", function()
	local max_width = utils.longest_path_perc(100, vim.fn.expand("%.:h"))
	Snacks.explorer({ layout = { layout = { width = max_width } } })
end, { desc = "Snacks explorer" })

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

keymap("n", "<leader>uddv", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

keymap("n", "<leader>ui", function()
	utils.toggle_indent_lines()
end, { desc = "Indent lines (toggle)" })

-- colorscheme utils
keymap("n", "<leader>uck", function()
	require("user.colorscheme_utils").export_colors_to_kitty()
end, { desc = "Export colors to Kitty" })
keymap("n", "<leader>ucw", function()
	require("user.colorscheme_utils").export_colors_to_wezterm()
end, { desc = "Export colors to Wezterm" })
keymap("n", "<leader>ucg", function()
	require("user.colorscheme_utils").export_colors_to_ghostty()
end, { desc = "Export colors to Ghostty" })
keymap("n", "<leader>uct", function()
	require("user.colorscheme_utils").export_colors_to_tmux()
end, { desc = "Export colors to Tmux" })

keymap("n", "<leader>ur", function()
	vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative numbers" })

local copySelectedCommit = function(picker, item)
	vim.fn.setreg("+", item.commit)
	vim.notify("Copied " .. item.commit .. " to + register")
	picker:close()
end

-- Git and friends --
keymap("n", "<leader>gll", function()
	Snacks.picker.git_log({ confirm = copySelectedCommit })
end, { desc = "Git log (cwd)" })
keymap("n", "<leader>glf", function()
	Snacks.picker.git_log_file({ confirm = copySelectedCommit })
end, { desc = "Git log (file)" })
keymap("n", "<leader>glL", function()
	Snacks.picker.git_log_line({ confirm = copySelectedCommit })
end, { desc = "Git log (line)" })

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
keymap("n", "<leader>lD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Document diagnostics" })
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer info" })
keymap("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })
keymap("n", "<leader>ld", function()
	Snacks.picker.lsp_definitions()
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
	Snacks.picker.lsp_references()
end, { desc = "Show references" })
keymap("n", "<leader>ls", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Symbols" })
keymap("n", "<leader>lS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "Workspace symbols" })
keymap("n", "<leader>lw", function()
	Snacks.picker.diagnostics()
end, { desc = "Workspace diagnostics" })
keymap("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { desc = "Trouble toggle" })

keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Definition", noremap = true, silent = true })

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
---@format disable
keymap("n", "<leader>s<CR>", function()
	require("telescope.builtin").resume()
end, { desc = "Resume previous search" })
keymap("n", "<leader>sC", function()
	Snacks.picker.command_history()
end, { desc = "Commands" })
keymap("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
keymap("n", "<leader>sR", function()
	Snacks.picker.registers()
end, { desc = "Registers" })
keymap("n", "<leader>sb", function()
	require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Search in buffers" })
keymap("n", "<leader>sg", "<cmd>AdvancedGitSearch<cr>", { desc = "Search inside git" })
keymap("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Find Help" })
keymap("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
keymap("n", "<leader>sr", function()
	Snacks.picker.recent()
end, { desc = "Open recent File" })
keymap(
	"n",
	"<leader>st",
	":lua require('telescope').extensions.live_grep_args.live_grep_args(theme = 'ivy')<CR>",
	{ desc = "Search text" }
)
---@format enable

keymap("n", "<leader>sT", function()
	Snacks.picker.todo_comments()
end, { desc = "Search todo" })

keymap({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
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

-- Window mappings

keymap("n", "<C-w>f", function()
	require("snacks").zen()
end, { desc = "Zen window" })

keymap("n", "<C-w>z", function()
	require("snacks").zen.zoom()
end, { desc = "Zoom window" })

local status_ok, fun = pcall(require, "user.fun")
if status_ok then
	fun.set_keymaps()
end

local status_ok, event_logger = pcall(require, "user.event_logger")
if status_ok then
	event_logger.set_keymaps()
end
