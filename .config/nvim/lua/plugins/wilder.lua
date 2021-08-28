vim.cmd([[

call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [ wilder#branch( wilder#python_file_finder_pipeline({ 'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']}, 'dir_command': ['fd', '-td'], 'filters': ['cpsm_filter'], }), wilder#substitute_pipeline({ 'pipeline': wilder#python_search_pipeline({ 'skip_cmdtype_check': 1, 'pattern': wilder#python_fuzzy_pattern({ 'start_at_boundary': 0, }), }), }), wilder#cmdline_pipeline({ 'fuzzy': 1, 'fuzzy_filter': has('nvim') ? wilder#lua_fzy_filter() : wilder#vim_fuzzy_filter(), }), wilder#python_search_pipeline({ 'pattern': wilder#python_fuzzy_pattern({ 'start_at_boundary': 0, }), }), ), ])

let g:highlighters = [ wilder#pcre2_highlighter(), has('nvim') ? wilder#lua_fzy_highlighter() : wilder#cpsm_highlighter(), ]

let g:popupmenu_renderer = wilder#popupmenu_renderer({ 'highlighter': g:highlighters, 'left': [ wilder#popupmenu_devicons(), wilder#popupmenu_buffer_flags(), ], 'right': [ ' ', wilder#popupmenu_scrollbar(), ], })

let g:wildmenu_renderer = wilder#wildmenu_renderer({ 'highlighter': g:highlighters, 'separator': ' · ', 'left': [' ', wilder#wildmenu_spinner(), ' '], 'right': [' ', wilder#wildmenu_index()], })

call wilder#set_option('renderer', wilder#renderer_mux({ ':': g:popupmenu_renderer, '/': g:wildmenu_renderer, 'substitute': g:wildmenu_renderer, }))

]])
