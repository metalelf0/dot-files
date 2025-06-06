local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- enabled = false,
}

local only_if_wide_enough = function()
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
	cond = only_if_wide_enough,
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

local function abbreviate(name)
	local s = name:gsub("[-_]", " ")
	s = s:gsub("(%l)(%u)", "%1 %2")

	local parts = {}
	for word in s:gmatch("%S+") do
		parts[#parts + 1] = word
	end
	local letters = {}
	for _, w in ipairs(parts) do
		letters[#letters + 1] = w:sub(1, 2):lower()
	end
	return table.concat(letters, ".")
end

local function shorten_branch(branch)
	if branch:len() < 15 then
		return branch
	end

	local prefix, rest = branch:match("^([^/]+)/(.+)$")
	if prefix then
		return prefix .. "/" .. abbreviate(rest)
	end

	return abbreviate(branch)
end

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
			-- lualine_a = { branch, fmt = shorten_branch },
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
			lualine_z = { root_dir, { "datetime", style = "%H:%M" } },
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
			"aerial",
			"fugitive",
			"lazy",
			"mason",
			"neo-tree",
			"quickfix",
			"toggleterm",
			"trouble",
		},
	})
end

return M
