if vim.fn.executable("recol") == 1 then
	local launch_interactive_mode = function()
		local width = math.floor(vim.o.columns * 0.75)
		local height = math.floor(vim.o.lines * 0.75)
		local buf = vim.api.nvim_create_buf(false, true)
		local win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = math.floor((vim.o.lines - height - 3) / 2),
			col = math.floor((vim.o.columns - width) / 2),
			border = "rounded",
			title = " Recol ",
			title_pos = "center",
		})
		vim.bo[buf].bufhidden = "wipe"
		vim.fn.termopen({ "recol", "-i", "--quit-on-select" }, {
			on_exit = function()
				vim.schedule(function()
					if vim.api.nvim_win_is_valid(win) then
						vim.api.nvim_win_close(win, true)
					end
					vim.cmd.source("~/.config/nvim/init.lua")
				end)
			end,
		})
		vim.cmd.startinsert()
	end
	vim.api.nvim_create_user_command("Recol", function(opts)
		local args = vim.split(opts.args, "%s+", { trimempty = true })
		local is_interactive_mode = vim.tbl_contains(args, "-i") or vim.tbl_contains(args, "--interactive")
		if is_interactive_mode then
			return launch_interactive_mode()
		end
		vim.cmd("!recol " .. opts.args)
		vim.cmd.source("~/.config/nvim/init.lua")
	end, { nargs = "*" })
	vim.api.nvim_create_user_command("RecolOpen", function()
		launch_interactive_mode()
	end, { nargs = 0 })
end
