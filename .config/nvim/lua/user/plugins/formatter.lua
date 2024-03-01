local M = {
	"mhartington/formatter.nvim",
}

function M.config()
	-- Utilities for creating configurations
	local util = require("formatter.util")

	-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
	require("formatter").setup({
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,
	})
end

return M
