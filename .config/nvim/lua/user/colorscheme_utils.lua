---@diagnostic disable: param-type-mismatch, no-unknown
local M = {}
local config = require("user.config")
local core = require("lib/core")

M.config = {
	kitty_export_path = os.getenv("HOME") .. "/.config/kitty/",
	wezterm_export_path = os.getenv("HOME") .. "/.config/wezterm/colors/",
	ghostty_themes_path = os.getenv("HOME") .. "/.config/ghostty/themes/",
	ghostty_config_file = os.getenv("HOME") .. "/.config/ghostty/config",
	tmux_config_file = os.getenv("HOME") .. "/.config/tmux/tmux.conf",
	tmux_themes_path = os.getenv("HOME") .. "/.config/tmux/themes/",
}

M.export_colors_to_ghostty = function()
	local colorscheme = vim.api.nvim_exec("colorscheme", true)
	local config_path = vim.fn.expand(M.config.ghostty_config_file)

	local theme_file_path = vim.fn.expand(M.config.ghostty_themes_path .. "/" .. colorscheme)
	if vim.fn.filereadable(vim.fn.expand(theme_file_path)) == 0 then
		print("Ghostty theme file not found, creating it...")
		M.write_ghostty_theme(theme_file_path)
	else
		print("Ghostty theme file found...")
	end

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

M.write_ghostty_theme = function(target_file)
	local file = io.open(target_file, "w")
	-- Terminal color indices and their traditional names
	local color_mappings = {
		[0] = "black",
		[1] = "red",
		[2] = "green",
		[3] = "yellow",
		[4] = "blue",
		[5] = "magenta",
		[6] = "cyan",
		[7] = "white",
		-- Bright colors
		[8] = "bright-black",
		[9] = "bright-red",
		[10] = "bright-green",
		[11] = "bright-yellow",
		[12] = "bright-blue",
		[13] = "bright-magenta",
		[14] = "bright-cyan",
		[15] = "bright-white",
	}

	-- Helper function to convert color to hex
	local function to_hex(color)
		if type(color) == "number" then
			return string.format("#%06x", color)
		elseif type(color) == "string" and color:match("^#%x%x%x%x%x%x$") then
			return color
		end
		return nil
	end

	-- Get foreground and background colors
	local normal_group = vim.api.nvim_get_hl(0, { name = "Normal" })
	local fg = normal_group.fg and string.format("#%06x", normal_group.fg) or "default"
	local bg = normal_group.bg and string.format("#%06x", normal_group.bg) or "default"

	-- Print Ghostty theme header
	file:write("# Ghostty theme generated from Neovim highlights\n")
	file:write(string.format("foreground = %s\n", fg))
	file:write(string.format("background = %s\n", bg))

	-- Get and print terminal colors
	for i = 0, 15 do
		local color_hex

		-- Try Terminal highlight group first
		local success, color = pcall(function()
			return vim.api.nvim_get_hl(0, { name = string.format("Terminal%d", i) })
		end)

		if success and color.fg then
			color_hex = to_hex(color.fg)
		end

		-- Fallback to g:terminal_color_* if Terminal highlight group is empty
		if not color_hex then
			local var_name = string.format("terminal_color_%d", i)
			local term_color = vim.g[var_name]
			if term_color then
				color_hex = term_color
			end
		end

		-- Print the color if we found one
		if color_hex then
			file:write(string.format("palette = %s=%s\n", i, color_hex))
		end
	end
	file:close()
end

M.export_colors_to_kitty = function()
	local fn = vim.fn
	local filename = M.config.kitty_export_path .. "nvim_export.conf"
	local file = io.open(filename, "w")
	io.output(file)
	io.write("# vim:ft=kitty" .. "\n\n")
	io.write("# exported from " .. config.colorscheme .. " (" .. config.variant .. ") \n\n")
	local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
	local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
	io.write("foreground " .. fg .. "\n")
	io.write("inactive_tab_foreground " .. fg .. "\n")
	io.write("background " .. bg .. "\n")
	io.write("selection_foreground " .. bg .. "\n")
	io.write("selection_background " .. fg .. "\n")
	for i = 0, 15 do
		local var = "g:terminal_color_" .. tostring(i)
		if fn.exists(var) == 1 then
			local tc = fn.eval(var)
			io.write("color" .. tostring(i) .. " " .. tc .. "\n")
			if i == 2 then
				io.write("cursor " .. tc .. "\n")
				io.write("active_tab_background " .. tc .. "\n")
			end
			if i == 15 then
				io.write("inactive_tab_background " .. tc .. "\n")
			end
		end
	end
	io.close(file)
	print("Colors exported to " .. filename)
end

M.export_colors_to_wezterm = function()
	local fn = vim.fn
	local filename = M.config.wezterm_export_path .. "nvim_export.lua"
	local file = io.open(filename, "w+")
	io.output(file)
	local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
	local bg = fn.synIDattr(fn.hlID("Normal"), "bg")

	local colors = {}
	colors.foreground = fg
	colors.background = bg
	colors.cursor_fg = fg
	colors.selection_fg = bg
	colors.selection_bg = fg
	colors.ansi = {}
	colors.brights = {}

	for i = 0, 15 do
		local var = "g:terminal_color_" .. tostring(i)
		if fn.exists(var) == 1 then
			local tc = fn.eval(var)
			-- if (i % 2) == 0 then
			if i < 8 then
				table.insert(colors.ansi, tc)
			else
				table.insert(colors.brights, tc)
			end
			if i == 2 then
				colors.cursor_bg = fn.eval(var)
			end
		end
	end

	io.write("-- vim:ft=lua" .. "\n")
	io.write("-- exported from " .. vim.g.colors_name .. "\n")
	io.write("-- usage:\n")
	io.write("--   - add the following line on top of wezterm.lua\n")
	io.write("--     local theme = require('nvim_export').colors\n")
	io.write("--   - then in the config block set colors to theme:\n")
	io.write("--     colors = theme\n\n")
	io.write("return {\n  colors = { \n")
	M.dump_table(io, colors, 1, {})
	io.write("  }\n}")

	io.close(file)
	print("Colors exported to " .. filename)
end

M.dump_table = function(io, t, indent, done)
	done = done or {}
	indent = indent or 0

	done[t] = true

	for key, value in pairs(t) do
		io.write(string.rep("\t", indent))

		if type(value) == "table" and not done[value] then
			done[value] = true
			io.write(key, " = {\n")
			M.dump_table(io, value, indent + 2, done)
			io.write("},\n")

			done[value] = false
		else
			if type(key) == "number" then
				io.write('"', value, '",\n')
			else
				io.write(key, '\t=\t"', value, '",\n')
			end
		end
	end
end

M.export_colors_to_tmux = function()
	local colorscheme = vim.api.nvim_exec("colorscheme", true)
	local config_path = vim.fn.expand(M.config.tmux_config_file)

	local lines = {}
	for line in io.lines(config_path) do
		if line:find(".palette.tmux") then
			local theme_path = vim.fn.expand(M.config.tmux_themes_path .. colorscheme .. ".palette.tmux")
			if vim.fn.filereadable(vim.fn.expand(theme_path)) == 1 then
				line = "source-file " .. theme_path
				vim.notify("Tmux palette is now " .. theme_path)
			else
				vim.notify("No palette file found for colorscheme " .. colorscheme .. ", writing one at " .. theme_path)
				M.write_tmux_theme(theme_path)
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

M.write_tmux_theme = function(target_file)
	local file = io.open(target_file, "w")

	local lualine_a_visual_group = vim.api.nvim_get_hl(0, { name = "lualine_a_visual" })
	local dark_fg = lualine_a_visual_group.fg and string.format("#%06x", lualine_a_visual_group.fg) or "default"
	local color_fg = lualine_a_visual_group.bg and string.format("#%06x", lualine_a_visual_group.bg) or "default"

	local lualine_a_insert_group = vim.api.nvim_get_hl(0, { name = "lualine_a_insert" })
	local accent = lualine_a_insert_group.bg and string.format("#%06x", lualine_a_insert_group.bg) or "default"

	local lualine_b_normal_group = vim.api.nvim_get_hl(0, { name = "lualine_b_normal" })
	local color_bg = lualine_b_normal_group.bg and string.format("#%06x", lualine_b_normal_group.bg) or "default"

	local lualine_c_normal_group = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })
	local darker_bg = lualine_c_normal_group.bg and string.format("#%06x", lualine_c_normal_group.bg) or "default"

	file:write("# Tmux palette theme generated from Neovim lualine highlights\n")
	file:write(string.format('color_fg="%s"\n', color_fg))
	file:write(string.format('color_bg="%s"\n', color_bg))
	file:write(string.format('color_dark_fg="%s"\n', dark_fg))
	file:write(string.format('color_darker_bg="%s"\n', darker_bg))
	file:write(string.format('color_alt_accent="%s"\n', accent))
	file:close()
end

return M
