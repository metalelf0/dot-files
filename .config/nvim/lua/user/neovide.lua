vim.g.neovide_remember_window_size = true
vim.opt.linespace = 4

vim.g.gui_font_default_size = 15
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "CaskaydiaCove Nerd Font Mono"
-- vim.g.gui_font_face = "PragmataPro Mono Regular"
-- vim.g.neovide_padding_top = 50

local alpha = function()
	local vim_transparency = 255 * vim.g.transparency
	return string.format("%x", math.floor(vim_transparency or 0.8))
end

-- vim.g.neovide_transparency = 0.0
-- vim.g.transparency = 0.9
-- vim.g.neovide_background_color = "#000000" .. alpha()

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({ "n", "i" }, "<C-+>", function()
	ResizeGuiFont(1)
end, opts)
keymap({ "n", "i" }, "<C-->", function()
	ResizeGuiFont(-1)
end, opts)
keymap({ "n", "i" }, "<C-BS>", function()
	ResetGuiFont()
end, opts)

if vim.g.neovide then
	keymap("n", "<D-s>", ":w<CR>") -- Save
	keymap("v", "<D-c>", '"+y') -- Copy
	keymap("n", "<D-v>", '"+P') -- Paste normal mode
	keymap("v", "<D-v>", '"+P') -- Paste visual mode
	keymap("c", "<D-v>", "<C-R>+") -- Paste command mode
	keymap("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
