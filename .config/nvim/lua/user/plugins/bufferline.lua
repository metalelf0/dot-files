local M = {
	"akinsho/bufferline.nvim",
	-- after = "catppuccin",
	event = "BufReadPre",
}

function M.config()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	signs = {
		error = signs.Error,
		warning = signs.Warn,
		info = signs.Info,
		hint = signs.Hint,
	}

	local severities = {
		"error",
		"warning",
	}

	local bufferline = require("bufferline")

	bufferline.setup({
		options = {
			style_preset = bufferline.style_preset.minimal,
			themable = true,
			numbers = "none",
		},
	})

	-- require("bufferline").setup({
	-- 	options = {
	-- 		show_close_icon = false,
	-- 		show_buffer_icons = false,
	-- 		show_buffer_close_icons = false,
	-- 		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	-- 		diagnostics = "nvim_lsp",
	-- 		always_show_bufferline = true,
	-- 		-- separator_style = "thick",
	-- 		diagnostics_indicator = function(_, _, diag)
	-- 			local s = {}
	-- 			for _, severity in ipairs(severities) do
	-- 				if diag[severity] then
	-- 					table.insert(s, signs[severity] .. diag[severity])
	-- 				end
	-- 			end
	-- 			return table.concat(s, " ")
	-- 		end,
	-- 		offsets = {
	-- 			{
	-- 				filetype = "neo-tree",
	-- 				text = "Neo Tree",
	-- 				highlight = "Directory",
	-- 				text_align = "left",
	-- 			},
	-- 		},
	-- 	},
	-- })
end

return M
