vim.cmd([[
  augroup _alpha
  autocmd!
  autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  function MarkdownHighlights()
    syntax region Label start=+==+ end=+==+ oneline
    syntax match Hashtag /#\(\w\|\-\)\+/
    hi link Hashtag Type
  endfunction
]])

local general_group = vim.api.nvim_create_augroup("general", { clear = true })
vim.api.nvim_create_autocmd(
	"FileType",
	{ command = "nnoremap <silent> <buffer> q :close<CR> ", group = general_group, pattern = "qf,jelp,man,lspinfo" }
)
vim.api.nvim_create_autocmd("BufWinEnter", { command = ":set formatoptions-=cro", group = general_group })
vim.api.nvim_create_autocmd("FileType", { command = "set nobuflisted", group = general_group, pattern = "qf" })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ timeout = 200 })
	end,
})

local git_group = vim.api.nvim_create_augroup("git", { clear = true })
vim.api.nvim_create_autocmd("FileType", { command = "setlocal wrap", group = git_group, pattern = "gitcommit" })
vim.api.nvim_create_autocmd("FileType", { command = "setlocal spell", group = git_group, pattern = "gitcommit" })

local markdown_group = vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", { command = "setlocal wrap", group = markdown_group, pattern = "markdown" })
vim.api.nvim_create_autocmd("FileType", { command = "setlocal nospell", group = markdown_group, pattern = "markdown" })
vim.api.nvim_create_autocmd(
	"FileType",
	{ command = "setlocal shiftwidth=2", group = markdown_group, pattern = "markdown" }
)
vim.api.nvim_create_autocmd(
	{ "BufEnter", "BufWinEnter" },
	{ command = "call MarkdownHighlights()", group = markdown_group, pattern = "*.md" }
)

local auto_resize_group = vim.api.nvim_create_augroup("auto_resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", { command = "tabdo wincmd = ", group = auto_resize_group })

local ruby_group = vim.api.nvim_create_augroup("ruby", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = [[ :%s/\s\+$//e ]], group = ruby_group, pattern = "*.rb" })

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		local recording_register = vim.fn.reg_recording()
		require("notify")("Recording @" .. recording_register, vim.log.levels.INFO, { title = "Macro" })
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		local recording_register = vim.fn.reg_recording()
		require("notify")("Recording @" .. recording_register .. " done!", vim.log.levels.INFO, { title = "Macro" })
	end,
})
