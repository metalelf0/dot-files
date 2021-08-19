function LspStatus()
  if #vim.lsp.buf_get_clients() < 1 then return "" end
  return require("lsp-status").status()
end

require('lualine').setup{
  options = {
    theme = "nightfox",
    section_separators = {"", ""},
    component_separators = {"", ""},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = { { 'filename', path = 1 }, 'diff', 'LspStatus()'},
    lualine_x = {'encoding', 'fileformat', { 'filetype', color = 'true' }},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}

