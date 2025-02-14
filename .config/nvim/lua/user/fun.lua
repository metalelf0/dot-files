local M = {}
local core = require("lib/core")

M.set_keymaps = function() end

M.update_ghostty_theme = function()
	local colorscheme = vim.api.nvim_exec("colorscheme", true)

	local config_path = vim.fn.expand("~/.config/ghostty/config")

	local lines = {}
	for line in io.lines(config_path) do
		if line:match("^theme%s*=%s*") then
			line = "theme = " .. core.get_homedir() .. "/.config/ghostty/themes/" .. colorscheme
		end
		table.insert(lines, line)
	end

	local file = io.open(config_path, "w")
	for _, line in ipairs(lines) do
		file:write(line .. "\n")
	end
	file:close()
end

return M
