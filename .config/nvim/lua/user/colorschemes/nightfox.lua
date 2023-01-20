vim.o.termguicolors = true

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
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

    colorscheme dayfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
