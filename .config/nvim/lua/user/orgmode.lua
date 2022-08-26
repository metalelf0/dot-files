-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/Notes/org/**/*'},
  org_default_notes_file = '~/Dropbox/org/inbox.org',
  org_agenda_skip_scheduled_if_done = true,
  org_agenda_skip_deadline_if_done = true,
  org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'IN PROGRESS(p)', '|', 'DONE(d)', 'ABORTED(x)'},
  org_capture_templates = {
    t = { description = 'Task', template = '* TODO %?\n %u' },
    j = { description = 'Journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?', target = '~/Dropbox/org/journal.org' }
  }
})

require('org-bullets').setup()
