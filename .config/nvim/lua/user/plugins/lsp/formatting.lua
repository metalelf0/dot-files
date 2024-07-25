local config = require("user.config")
local utils = require("user.utils")

local M = {}

M.setup = function()
	vim.g.disable_autoformat = not config.autoformat_enabled

	vim.api.nvim_create_user_command("FormatDisable", function(args)
		if args.bang then
			-- FormatDisable! will disable formatting just for this buffer
			vim.b.disable_autoformat = true
		else
			vim.g.disable_autoformat = true
		end
	end, {
		desc = "Disable autoformat-on-save",
		bang = true,
	})

	vim.api.nvim_create_user_command("FormatEnable", function()
		vim.b.disable_autoformat = false
		vim.g.disable_autoformat = false
	end, {
		desc = "Re-enable autoformat-on-save",
	})
end

M.toggle = function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
  local status = vim.g.disable_autoformat and "disabled" or "enabled"
	utils.info("Formatting on save is now " .. status)
end

return M
