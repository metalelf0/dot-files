local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	enabled = true,
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local root_dir = require("user.utils").rootdir

M.config = function()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { branch },
			lualine_b = { {
				"mode",
				fmt = function(str)
					return str:sub(1, 3)
				end,
			} },
			lualine_c = { diagnostics, { "filename", path = 1, shorting_target = 80 } },
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = { diff, "encoding", filetype },
			lualine_y = { location },
			lualine_z = { root_dir },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			-- lualine_c = { "filename" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"lazy",
			"neo-tree",
			"quickfix",
			"aerial",
			"toggleterm",
			"trouble",
		},
	})
end

return M
