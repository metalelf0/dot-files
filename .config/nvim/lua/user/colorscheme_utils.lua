local M = {}

M.config = {
	kitty_export_path = os.getenv("HOME") .. "/.config/kitty/",
	wezterm_export_path = os.getenv("HOME") .. "/.config/wezterm/colors/",
}

M.export_colors_to_kitty = function()
	local fn = vim.fn
	local filename = M.config.kitty_export_path .. "nvim_export.conf"
	local file = io.open(filename, "w")
	io.output(file)
	io.write("# vim:ft=kitty" .. "\n\n")
	io.write("# exported from " .. vim.g.colors_name .. "\n\n")
	local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
	local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
	io.write("foreground " .. fg .. "\n")
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
			if (i % 2) == 0 then
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

return M
