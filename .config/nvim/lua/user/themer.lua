local utils = require("user.utils")
local config = require("user.config")
local M = {
	favourites = { "tokyonight", "catppuccin", "fox" },
}

M.variant = function(context)
	if not utils.contains(context.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. context.default_variant)
	end

	return (config.variant or context.default_variant)
end

M.lazy_load = function(colorscheme)
	return colorscheme ~= config.colorscheme
end

M.priority_for = function(colorscheme)
	if colorscheme ~= config.colorscheme then
		return 1000
	else
		return 500
	end
end

-- using keys to lazy-load packages. Without this setup, telescope pickers wouldn't include lazy-loaded
-- themes
M.keys = function(colorscheme)
	if colorscheme ~= config.colorscheme then
		return {
			{
				"<leader>ut",
				function()
					require("telescope.builtin").colorscheme({ enable_preview = true })
					-- Snacks.picker.colorschemes()
				end,
				desc = "Colorscheme with preview",
			},
			{
				"<leader>uu",
				function()
					require("user.themer").favourite_themes_picker()
				end,
				desc = "Fave themes picker",
			},
		}
	else
		return {}
	end
end

M.favourite_themes_picker = function()
	local target = vim.fn.getcompletion

	vim.fn.getcompletion = function()
		return vim.tbl_filter(function(color)
			return vim.tbl_contains(M.favourites, function(c)
				return string.find(color, c) and not (string.find(color, "base16"))
			end, { predicate = true })
		end, target("", "color"))
	end

	require("telescope.builtin").colorscheme({ enable_preview = true })
	vim.fn.getcompletion = target
end

-- Re-apply the theme in-process, picking up edits to `user.config` (used by `th`).
-- Colorscheme specs capture the `user.config` table at load time, so we update that
-- same table in place from the file and then re-run the active theme's `config()`.
-- Reusing the table keeps every captured reference valid, so no module has to be
-- re-required.
local function spec_module_for(name)
	local dir = vim.fn.stdpath("config") .. "/lua/user/plugins/colorschemes"
	for _, path in ipairs(vim.fn.glob(dir .. "/*.lua", false, true)) do
		local content = table.concat(vim.fn.readfile(path), "\n")
		if content:match('local colorscheme%s*=%s*"' .. vim.pesc(name) .. '"') then
			return (path:match("lua/(.+)$") or ""):gsub("%.lua$", ""):gsub("/", ".")
		end
	end
end

local function reload_config()
	local cached = package.loaded["user.config"]
	local chunk = loadfile(vim.fn.stdpath("config") .. "/lua/user/config.lua")
	if not chunk then
		return nil
	end
	local ok, fresh = pcall(chunk)
	if not ok or type(fresh) ~= "table" then
		return nil
	end
	if cached then
		for key, value in pairs(fresh) do
			cached[key] = value
		end
	else
		cached = fresh
		package.loaded["user.config"] = fresh
	end
	return cached
end

M.reload = function()
	local current = reload_config() or config
	local name = current.colorscheme
	if not name or name == "" or name == "default" then
		return false
	end

	local mod = spec_module_for(name)
	if not mod then
		vim.notify("ThemerReload: no spec for colorscheme " .. name, vim.log.levels.WARN)
		return false
	end

	local ok, spec = pcall(require, mod)
	if not ok or type(spec) ~= "table" or type(spec.config) ~= "function" then
		vim.notify("ThemerReload: cannot load spec " .. mod, vim.log.levels.WARN)
		return false
	end

	local ok2, err = pcall(spec.config)
	if not ok2 then
		vim.notify("ThemerReload: " .. tostring(err), vim.log.levels.WARN)
	end
	return ok2
end

if vim.fn.exists(":ThemerReload") == 0 then
	vim.api.nvim_create_user_command("ThemerReload", function()
		require("user.themer").reload()
	end, { desc = "Re-apply the colorscheme from user.config" })
end

return M
