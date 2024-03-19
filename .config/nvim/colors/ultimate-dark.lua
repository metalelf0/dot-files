-- Ultimate Dark Neo colorscheme for Neovim, generated from Zed editor theme
local colors = {
  border = "#3d4851",
  border_variant = "#3d485150",
  border_focused = "#3d4851",
  border_selected = "#3d4851",
  border_transparent = "#3d485100",
  border_disabled = "#3d485150",
  elevated_surface_background = "#2d3134",
  surface_background = "#373a3f",
  background = "#373a3f",
  element_background = "#3d4851",
  element_hover = "#3d485150",
  element_active = "#3d485175",
  element_selected = "#7ec2c2",
  element_disabled = "#3d485150",
  drop_target_background = "#88c0d099",
  text = "#f6f7f9",
  text_muted = "#f6f7f985",
  text_placeholder = "#f6f7f950",
  text_disabled = "#f6f7f950",
  text_accent = "#ffffff",
  scrollbar_thumb_background = "#3d485199",
  scrollbar_thumb_hover_background = "#3d4851aa",
  scrollbar_thumb_border = "#3d485100",
  scrollbar_track_background = "#373a3f",
  scrollbar_track_border = "#3d485100",
  editor_foreground = "#f5f6f8",
  editor_background = "#373a3f",
  editor_gutter_background = "#373a3f",
  editor_active_line_background = "#3d485199",
  editor_line_number = "#f5f6f850",
  editor_active_line_number = "#f5f6f8aa",
  terminal_ansi_black = "#3d4851",
  terminal_ansi_bright_black = "#4c566a",
  terminal_ansi_red = "#bf616a",
  terminal_ansi_bright_red = "#bf616a",
  terminal_ansi_green = "#9eca99",
  terminal_ansi_bright_green = "#9eca99",
  terminal_ansi_yellow = "#ecc285",
  terminal_ansi_bright_yellow = "#ecc285",
  terminal_ansi_blue = "#7faad5",
  terminal_ansi_bright_blue = "#7faad5",
  terminal_ansi_magenta = "#b48ead",
  terminal_ansi_bright_magenta = "#b48ead",
  terminal_ansi_cyan = "#7ec2c2",
  terminal_ansi_bright_cyan = "#8fbcbb",
  terminal_ansi_white = "#e5e9f0",
  terminal_ansi_bright_white = "#eceff4",
  error = "#bf616a",
  error_background = "#2d3134",
  error_border = "#bf616a",
  warning = "#ecc285",
  warning_background = "#2d3134",
  warning_border = "#ecc285",
  info = "#7faad5",
  info_background = "#2d3134",
  info_border = "#7faad5",
  hint = "#969696ff",
  hint_background = "#2d3134",
  hint_border = "#969696ff",
  success = "#9eca99",
  success_background = "#2d3134",
  success_border = "#9eca99",
  cursor = "#f5f6f8aa",
  selection = "#6f757f3d",
  syntax_attribute_color = "#c396c3",
  syntax_boolean_color = "#e4797e",
  syntax_comment_color = "#8f97a8",
  syntax_constant_color = "#ffffff",
  syntax_constructor_color = "#e4797e",
  syntax_function_color = "#7ec2c2",
  syntax_keyword_color = "#c396c3",
  syntax_link_text_color = "#7faad5",
  syntax_number_color = "#ecc285",
  syntax_operator_color = "#f19776",
  syntax_property_color = "#ffffff",
  syntax_punctuation_color = "#ffffff",
  syntax_string_color = "#9eca99",
  syntax_string_escape_color = "#c396c3",
  syntax_tag_color = "#e4797e",
  syntax_text_literal_color = "#9eca99",
  syntax_type_color = "#ecc285",
  syntax_variable_color = "#d8dde5",
  syntax_variable_special_color = "#ffffff"
}

local theme = {}

theme.normal = {
  a = { bg = colors.element_selected, fg = colors.background },
  b = { bg = colors.surface_background, fg = colors.text },
  c = { bg = colors.background, fg = colors.text_muted }
}

theme.insert = {
  a = { bg = colors.success, fg = colors.background }
}

theme.visual = {
  a = { bg = colors.info, fg = colors.background }
}

theme.replace = {
  a = { bg = colors.warning, fg = colors.background }
}

theme.command = {
  a = { bg = colors.hint, fg = colors.background }
}

theme.inactive = {
  a = { bg = colors.background, fg = colors.text_muted },
  b = { bg = colors.background, fg = colors.text_muted },
  c = { bg = colors.background, fg = colors.text_muted }
}

theme.syntax = {
  Comment = { fg = colors.syntax_comment_color, style = 'italic' },
  Constant = { fg = colors.syntax_constant_color },
  String = { fg = colors.syntax_string_color },
  Variable = { fg = colors.syntax_variable_color },
  Keyword = { fg = colors.syntax_keyword_color, style = 'italic' },
  Function = { fg = colors.syntax_function_color },
  Operator = { fg = colors.syntax_operator_color },
  Type = { fg = colors.syntax_type_color },
  Number = { fg = colors.syntax_number_color },
  Boolean = { fg = colors.syntax_boolean_color, style = 'italic' },
  Attribute = { fg = colors.syntax_attribute_color, style = 'italic' },
  Tag = { fg = colors.syntax_tag_color },
  Special = { fg = colors.syntax_string_special_color }
}

local function apply_highlight(group, styles)
  local style_str = ''
  for k, v in pairs(styles) do
    if v ~= nil then
      if k == 'style' then
        style_str = string.format('gui=%s', v)
      else
        style_str = string.format('%s%s=%s', style_str, k, v)
        if k ~= 'fg' and k ~= 'bg' then
          style_str = style_str .. ' '
        end
      end
    end
  end
  vim.api.nvim_command(string.format('highlight %s %s', group, style_str))
end

local function load_syntax()
  for group, styles in pairs(theme.syntax) do
    apply_highlight(group, styles)
  end
end

local function load_theme()
  for mode, styles in pairs(theme) do
    for group, style in pairs(styles) do
      local hl_group = 'airline_' .. mode .. '_' .. group
      apply_highlight(hl_group, style)
    end
  end
  load_syntax()
end

load_theme()
