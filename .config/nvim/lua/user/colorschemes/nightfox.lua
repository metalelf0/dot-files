vim.o.termguicolors = true

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
		},
		colorblind = {
			enable = true,
			simulate_only = false,
			severity = {
				protan = 0.2,
				deutan = 0.2,
				tritan = 0.2,
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

    colorscheme terafox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
