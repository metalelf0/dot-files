return {
	"luukvbaal/statuscol.nvim",
	enabled = false,
	event = "BufReadPost",
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		local builtin = require("statuscol.builtin")

		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		require("statuscol").setup({
			relculright = true,
			bt_ignore = { "nofile" },
			setopt = true,
			segments = {
				{ sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				-- { sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true }, click = "v:lua.ScSa" },
			},
		})
	end,
}
