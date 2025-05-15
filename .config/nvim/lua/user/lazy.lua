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
		path = "/Users/andrea.schiavini/Documents/codice_elf0/",
		fallback = true, -- Fallback to git when local plugin doesn't exists
	},
	concurrency = 64,
})
