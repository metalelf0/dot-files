local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

local function loadSession()
  vim.cmd "silent! RestoreSession"
end

project.setup({
	active = true,
	on_config_done = nil,
	manual_mode = false,
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project_root" },
	show_hidden = false,
	silent_chdir = true,
	ignore_lsp = {},
  custom_callback = loadSession
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension("projects")
