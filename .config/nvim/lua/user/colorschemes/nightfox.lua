vim.o.termguicolors = true

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
		},
		-- transparent = true,
		colorblind = {
			enable = false,
			simulate_only = false,
			severity = {
				protan = 0.3,
				deutan = 0.4,
				tritan = 0.3,
			},
		},
	},
})

vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme terafox highlight link @symbol String
      autocmd ColorScheme terafox highlight link @boolean @variable.builtin
    augroup END

    colorscheme dawnfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
