local M = {}
local core = require("lib/core")

M.set_keymaps = function() end

M.update_tmux_theme = function()
	local colorscheme = vim.api.nvim_exec("colorscheme", true)
	local config_path = vim.fn.expand("~/.config/tmux/tmux.conf")

	local lines = {}
	for line in io.lines(config_path) do
		if line:find(".palette.tmux") then
			filepath = core.get_homedir() .. "/.config/tmux/themes/" .. colorscheme .. ".palette.tmux"
			if vim.fn.filereadable(vim.fn.expand(filepath)) == 1 then
				line = "source-file " .. filepath
				vim.notify("Tmux palette is now " .. filepath)
			else
				vim.notify(
					"No palette file found for colorscheme " .. colorscheme .. ", would expect one at " .. filepath
				)
			end
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
