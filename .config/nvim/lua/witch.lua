local Witch = {}

function Witch.mappings()
  return {
    ayu = {
      name = "ayu",
      variants = { "mirage", "dark", "light" },
      mode = "global_variable",
      global_variable = "ayucolor"
    }
  }
end

function Witch.setColorschemeNew(theme, variant)
  local colorDefinition = Witch.mappings()[theme]
  for i, themeVariant in ipairs(colorDefinition['variants']) do
    if (variant == themeVariant) then
      print("Found!")
    end
  end
end

function Witch.setColorscheme(colorscheme)
  if colorscheme == "ayu-mirage" then
    vim.cmd('let ayucolor="mirage"')
    vim.cmd('colorscheme ayu')
  elseif colorscheme == "ayu-dark" then
    vim.cmd('let ayucolor="dark"')
    vim.cmd('colorscheme ayu')
  elseif colorscheme == "ayu-light" then
    vim.cmd('let ayucolor="light"')
    vim.cmd('colorscheme ayu')
  elseif colorscheme == "nightfox" then
    require('nightfox').load()
  elseif colorscheme == "nordfox" then
    local nightfox = require('nightfox')
    nightfox.setup({ fox = "nordfox"})
    nightfox.load()
  elseif colorscheme == "catppuccino" then
    local catppuccino = require('catppuccino')
    local config = Witch.catppuccino_config()
    config['colorscheme'] = 'dark_catppuccino'
    catppuccino.setup(config)
    catppuccino.load()
    require('catppuccino').load()
  elseif colorscheme == "github-dark" then
    require('github-theme').setup({ themeStyle = "dark" })
  elseif colorscheme == "github-dimmed" then
    require('github-theme').setup({ themeStyle = "dimmed" })
  elseif colorscheme == "github-light" then
    require('github-theme').setup({ themeStyle = "light" })
  elseif colorscheme == "tokyonight-night" then
    vim.g.tokyonight_style = "night"
    vim.cmd[[colorscheme tokyonight]]
  elseif colorscheme == "tokyonight-storm" then
    vim.g.tokyonight_style = "storm"
    vim.cmd[[colorscheme tokyonight]]
  elseif colorscheme == "tokyonight-day" then
    vim.g.tokyonight_style = "day"
    vim.cmd[[colorscheme tokyonight]]
  else
    vim.cmd('colorscheme ' .. colorscheme)
  end

  -- note: this requires the 'shadmansaleh/lualine' repo to be installed instead
  -- of hoob3rt's
  require('lualine').setup { options = { theme = Witch.LualineTheme(colorscheme) }}
end

function Witch.LualineTheme(colorscheme)
  local mappings = {
    ["ayu-dark"]         = "ayu_dark",
    ["ayu-light"]        = "ayu_light",
    ["ayu-mirage"]       = "ayu_mirage",
    ["catppuccino"]      = "catppuccino",
    ["catppuccino-dark"] = "catppuccino",
    ["github-dark"]      = "github",
    ["github-dimmed"]    = "github",
    ["github-light"]     = "github",
    ["nightfox"]         = "nightfox",
    ["nordfox"]          = "nightfox",
    ["tokyonight-day"]   = "tokyonight",
    ["tokyonight-night"] = "tokyonight",
    ["tokyonight-storm"] = "tokyonight",
  }

  return (mappings[colorscheme])
end

function Witch.catppuccino_config()
  return {
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
      },
      nvimtree = {
        enabled = true,
        show_root = true
      },
      lsp_trouble = true,
      gitsigns = true,
      telescope = true,
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      neogit = true,
      barbar = true,
      hop = true
    }
  }
end

return Witch
