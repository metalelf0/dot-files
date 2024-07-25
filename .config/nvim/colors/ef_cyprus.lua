-- ef-cyprus.nvim
-- Legible light theme with green, yellow, teal, red colors

local ef_cyprus = {
    -- Basic values
    bg_main     = "#fcf7ef",
    fg_main     = "#242521",
    bg_dim      = "#f0ece0",
    fg_dim      = "#59786f",
    bg_alt      = "#e5e3d8",
    fg_alt      = "#7f475a",
    bg_active   = "#c5c3b8",
    bg_inactive = "#f8f3ea",

    -- Basic hues for foreground values
    red             = "#9f0d0f",
    red_warmer      = "#dd0020",
    red_cooler      = "#ca3400",
    red_faint       = "#b05350",
    green           = "#006f00",
    green_warmer    = "#557400",
    green_cooler    = "#00824f",
    green_faint     = "#3a6f48",
    yellow          = "#a7601f",
    yellow_warmer   = "#bf4400",
    yellow_cooler   = "#a2604f",
    yellow_faint    = "#8f6f4a",
    blue            = "#375cc6",
    blue_warmer     = "#444fcf",
    blue_cooler     = "#065fbf",
    blue_faint      = "#4a659f",
    magenta         = "#9a456f",
    magenta_warmer  = "#bf456a",
    magenta_cooler  = "#8448aa",
    magenta_faint   = "#804f60",
    cyan            = "#1f70af",
    cyan_warmer     = "#3f6faf",
    cyan_cooler     = "#007a9f",
    cyan_faint      = "#4f677f",

    -- Additional mappings
    bg_region       = "#e0e7e5",
    bg_search_current = "#efbf00",
    bg_search_lazy  = "#cfceff",
    bg_search_replace = "#ff8f88",
    bg_hover        = "#efc26f",
    fg_intense      = "#000000",

    -- Treesitter specific highlights
    ts_comment       = "#8f6f4a", -- yellow-faint
    ts_keyword       = "#006f00", -- green
    ts_builtin       = "#557400", -- green-warmer
    ts_constant      = "#00824f", -- green-cooler
    ts_string        = "#ca3400", -- red-cooler
    ts_function      = "#a7601f", -- yellow
    ts_variable      = "#007a9f", -- cyan-cooler
    ts_type          = "#444fcf", -- blue-warmer
    ts_docstring     = "#4f677f", -- cyan-faint
    ts_preproc       = "#dd0020", -- red
}

local function highlight(group, fg, bg, style)
    local cmd = string.format('highlight %s guifg=%s guibg=%s gui=%s', group, fg or 'NONE', bg or 'NONE', style or 'NONE')
    vim.cmd(cmd)
end

local function apply_highlights()
    -- Editor highlights
    highlight('Normal', ef_cyprus.fg_main, ef_cyprus.bg_main)
    highlight('CursorLine', nil, ef_cyprus.bg_dim)
    highlight('Visual', nil, ef_cyprus.bg_region)
    highlight('Search', nil, ef_cyprus.bg_search_current)
    highlight('IncSearch', nil, ef_cyprus.bg_search_lazy)
    highlight('ColorColumn', nil, ef_cyprus.bg_alt)
    highlight('LineNr', ef_cyprus.fg_dim, ef_cyprus.bg_main)
    highlight('CursorLineNr', ef_cyprus.fg_main, ef_cyprus.bg_main)
    highlight('Comment', ef_cyprus.ts_comment)
    highlight('Keyword', ef_cyprus.ts_keyword)
    highlight('Function', ef_cyprus.ts_function)
    highlight('Constant', ef_cyprus.ts_constant)
    highlight('String', ef_cyprus.ts_string)
    highlight('Variable', ef_cyprus.ts_variable)
    highlight('Type', ef_cyprus.ts_type)
    highlight('PreProc', ef_cyprus.ts_preproc)
    highlight('TSDocString', ef_cyprus.ts_docstring)

    -- Additional Plugin highlights

    -- Telescope
    highlight('TelescopeBorder', ef_cyprus.fg_dim, ef_cyprus.bg_main)
    highlight('TelescopePromptBorder', ef_cyprus.fg_dim, ef_cyprus.bg_main)
    highlight('TelescopeResultsBorder', ef_cyprus.fg_dim, ef_cyprus.bg_main)
    highlight('TelescopePreviewBorder', ef_cyprus.fg_dim, ef_cyprus.bg_main)
    highlight('TelescopeSelection', nil, ef_cyprus.bg_hover)
    highlight('TelescopeMatching', ef_cyprus.yellow, nil)
    highlight('TelescopePromptPrefix', ef_cyprus.green, nil)

    -- WhichKey
    highlight('WhichKey', ef_cyprus.green, nil)
    highlight('WhichKeyGroup', ef_cyprus.blue, nil)
    highlight('WhichKeySeparator', ef_cyprus.fg_dim, nil)
    highlight('WhichKeyDesc', ef_cyprus.yellow, nil)
    highlight('WhichKeyFloat', nil, ef_cyprus.bg_alt)
    highlight('WhichKeyValue', ef_cyprus.fg_alt, nil)

    -- NeoTree
    highlight('NeoTreeNormal', ef_cyprus.fg_main, ef_cyprus.bg_main)
    highlight('NeoTreeCursorLine', nil, ef_cyprus.bg_dim)
    highlight('NeoTreeDirectoryIcon', ef_cyprus.blue, nil)
    highlight('NeoTreeDirectoryName', ef_cyprus.blue, nil)
    highlight('NeoTreeRootName', ef_cyprus.green, nil, 'bold')
    highlight('NeoTreeFileName', ef_cyprus.fg_main, nil)
    highlight('NeoTreeFileNameOpened', ef_cyprus.yellow, nil)
    highlight('NeoTreeIndentMarker', ef_cyprus.fg_dim, nil)
    highlight('NeoTreeGitAdded', ef_cyprus.green, nil)
    highlight('NeoTreeGitDeleted', ef_cyprus.red, nil)
    highlight('NeoTreeGitModified', ef_cyprus.yellow, nil)
    highlight('NeoTreeGitUnstaged', ef_cyprus.red, nil)
    highlight('NeoTreeGitUntracked', ef_cyprus.yellow, nil)
    highlight('NeoTreeGitStaged', ef_cyprus.green, nil)
    highlight('NeoTreeGitConflict', ef_cyprus.red, nil)
    highlight('NeoTreeSymbolicLinkTarget', ef_cyprus.cyan, nil)

    -- LSP
    highlight('LspDiagnosticsDefaultError', ef_cyprus.red_warmer, nil)
    highlight('LspDiagnosticsDefaultWarning', ef_cyprus.yellow_warmer, nil)
    highlight('LspDiagnosticsDefaultInformation', ef_cyprus.blue, nil)
    highlight('LspDiagnosticsDefaultHint', ef_cyprus.cyan, nil)
    highlight('LspReferenceText', nil, ef_cyprus.bg_region)
    highlight('LspReferenceRead', nil, ef_cyprus.bg_region)
    highlight('LspReferenceWrite', nil, ef_cyprus.bg_region)

    -- Git
    highlight('DiffAdd', ef_cyprus.green, nil)
    highlight('DiffChange', ef_cyprus.yellow, nil)
    highlight('DiffDelete', ef_cyprus.red, nil)
    highlight('DiffText', ef_cyprus.blue, nil)
end

local function setup()
    vim.cmd('syntax on')
    vim.cmd('set background=light')
    apply_highlights()
end

vim.cmd.hi("clear")
vim.g.colors_name = "ef_cyprus"
setup()
