local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "circadia"

local M = {
	"tanmaymanojgandhi/circadia",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	supported_variants = { "light", "hard" },
	default_variant = "light",
	init = function(plugin)
		vim.print("circadia is initializing")
		local port_path = vim.fs.joinpath(plugin.dir, "ports", "neovim")
		local lua_path = vim.fs.joinpath(port_path, "lua", "?.lua")
		local lua_init = vim.fs.joinpath(port_path, "lua", "?", "init.lua")

		-- Register Lua paths
		package.path = package.path .. ";" .. lua_path .. ";" .. lua_init

		-- Directory to expose colorschemes to Neovim's picker
		local colors_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "circadia_colors", "colors")
		vim.fn.mkdir(colors_dir, "p")

		local variants = {
			["circadia-dark"] = [[
          vim.o.background = "dark"
          require("circadia").setup()
        ]],
			["circadia-light"] = [[
          vim.o.background = "light"
          require("circadia").setup()
        ]],
		}

		for name, code in pairs(variants) do
			local file = vim.fs.joinpath(colors_dir, name .. ".lua")
			local f = io.open(file, "w")
			if f then
				f:write(code)
				f:close()
			end
		end

		-- Add directory to runtime path
		vim.opt.rtp:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "circadia_colors"))
		vim.print("circadia has initialized")
	end,
}

M.config = function()
	if
		config.light_colorscheme ~= "circadia-light"
		or config.dark_colorscheme ~= "circadia-dark"
		or config.colorscheme ~= "circadia"
	then
		return false
	end
	vim.cmd.colorscheme("circadia-" .. themer.variant(M)) -- or "circadia-light"
end

return M
