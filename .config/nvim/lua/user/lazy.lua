local config = require("user.config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("user.plugins", {
	dev = {
		path = config.lazy_dev_plugins_path,
		fallback = true, -- Fallback to git when local plugin doesn't exists
	},
	concurrency = 64,
})
