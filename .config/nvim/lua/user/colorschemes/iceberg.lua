vim.cmd([[
  try
    colorscheme iceberg
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- @metalelf0 customizations
local function set_fg(fg)
	return "guifg=" .. fg
end

local bg = vim.api.nvim_get_option("background")
local light_foreground = "#33374c"

if bg == "dark" then
elseif bg == "light" then
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
