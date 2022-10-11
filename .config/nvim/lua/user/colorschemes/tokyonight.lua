require("tokyonight").setup({
  -- allowed values are 'storm', 'moon', day' and 'night'
  style = "moon",
  sidebars = { "qf", "vista_kind", "terminal", "packer", "aerial", "toggleterm" },
  dim_inactive = false,
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  on_highlights = function(hl, cl)
    hl.WinSeparator = {
      fg = "#e0af68", -- this is ok for the "moon" theme
    }
  end,
})

vim.cmd([[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
