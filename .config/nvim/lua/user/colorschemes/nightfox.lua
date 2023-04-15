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
      autocmd ColorScheme dawnfox highlight link @symbol String
      autocmd ColorScheme dawnfox highlight link @boolean @variable.builtin
      autocmd ColorScheme dawnfox highlight clear CursorLineNr
      autocmd ColorScheme dawnfox highlight link CursorLineNr String
      autocmd ColorScheme dawnfox highlight clear VertSplit
      autocmd ColorScheme dawnfox highlight link VertSplit String
    augroup END

    colorscheme dawnfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
