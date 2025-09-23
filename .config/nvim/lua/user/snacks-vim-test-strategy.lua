-- lua/user/snacks-vim-test-strategy.lua
local M = {}

function M.run(cmd)
	local open_floating_terminal = function(cmd)
		require("snacks").terminal(cmd, {
			auto_insert = true,
			interactive = true,
			auto_close = false,
			win = { height = 0.6, focusable = true, enter = true, show = true },
		})
	end

	open_floating_terminal(cmd)
end

return M
