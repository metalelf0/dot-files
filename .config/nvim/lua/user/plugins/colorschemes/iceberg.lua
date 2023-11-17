local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "iceberg"

local M = {
	"cocopon/iceberg.vim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "iceberg" then
		return false
	end

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	local function set_fg(fg)
		return "guifg=" .. fg
	end

	vim.cmd([[
    try
      augroup CustomHighlight
        autocmd!
        autocmd ColorScheme iceberg highlight clear CursorLineNr
        autocmd ColorScheme iceberg highlight link CursorLineNr String
      augroup END

      colorscheme iceberg
    catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
      set background=dark
    endtry
  ]])

	local bg = vim.api.nvim_get_option("background")
	local light_foreground = "#33374c"

	if bg == "light" then
		vim.api.nvim_command("hi NotifyERRORBorder " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyERRORIcon " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyERRORTitle " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyINFOBorder " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyINFOIcon " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyINFOTitle " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyWARNBorder " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyWARNIcon " .. set_fg(light_foreground))
		vim.api.nvim_command("hi NotifyWARNTitle " .. set_fg(light_foreground))
	end
end

return M
