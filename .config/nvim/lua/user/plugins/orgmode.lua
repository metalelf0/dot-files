local M = {}

local setup_treesitter = function()
  require('orgmode').setup_ts_grammar()
  require 'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = { 'org' },
      additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' }
  }
end

local setup_orgmode = function(config)
  require('orgmode').setup(config)
end

local setup_org_bullets = function()
  require('org-bullets').setup()
end

local config = function()
  return {
    org_agenda_files = { '~/Dropbox/org/*', '~/Notes/org/**/*' },
    org_default_notes_file = '~/Dropbox/org/inbox.org',
    org_agenda_skip_scheduled_if_done = true,
    org_agenda_skip_deadline_if_done = true,
    org_todo_keywords = { 'TODO(t)', 'NEXT(n)', 'IN PROGRESS(p)', '|', 'DONE(d)', 'ABORTED(x)' },
    org_capture_templates = {
      t = { description = 'Task', template = '* TODO %?\n %u' },
      j = { description = 'Journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
        target = '~/Dropbox/org/journal.org' }
    }
  }
end

M.setup = function()
  setup_treesitter()
  setup_orgmode(config())
  setup_org_bullets()
end

return M
