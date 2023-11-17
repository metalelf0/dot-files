local M = {
	"tpope/vim-fugitive",
}

function M.config()
	-- this is required to enable :GBrowse without netrw.
	-- see https://vi.stackexchange.com/questions/38447/vim-fugitive-netrw-not-found-define-your-own-browse-to-use-gbrowse
	vim.cmd([[
    command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)
  ]])
end

return M
