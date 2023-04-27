vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
		},
		-- transparent = true,
		colorblind = {
			enable = true,
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
      autocmd ColorScheme terafox highlight clear CursorLineNr
      autocmd ColorScheme terafox highlight link CursorLineNr String
      autocmd ColorScheme terafox highlight clear VertSplit
      autocmd ColorScheme terafox highlight link VertSplit String
    augroup END

    colorscheme terafox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
