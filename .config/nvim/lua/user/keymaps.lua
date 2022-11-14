local opts = { noremap = true, silent = true }

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

-- - to open file browser
keymap("n", "-", function() require"telescope".extensions.file_browser.file_browser({path = "%:p:h"}) end, opts)
