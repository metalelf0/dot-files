local indent = 2
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.shiftwidth = indent                        -- Size of an indent
vim.opt.smartindent = true                         -- Insert indents automatically
vim.opt.tabstop = indent                           -- Number of spaces tabs count for
vim.opt.completeopt = 'menuone,noselect'           -- Completion options (for nvim-compe
vim.opt.hidden = true                              -- Enable modified buffers in background
vim.opt.ignorecase = true                          -- Ignore case
vim.opt.joinspaces = false                         -- No double spaces with join after a dot
vim.opt.scrolloff = 4                              -- Lines of context
vim.opt.shiftround = true                          -- Round indent
vim.opt.sidescrolloff = 8                          -- Columns of context
vim.opt.smartcase = true                           -- Don't ignore case with capitals
vim.opt.splitbelow = true                          -- Put new windows below current
vim.opt.splitright = true                          -- Put new windows right of current
vim.opt.termguicolors = true                       -- True color support
vim.opt.wildmode = 'list:longest'                  -- Command-line completion mode
vim.opt.clipboard = 'unnamedplus'                  -- System clipboard
vim.opt.inccommand = 'split'                       -- Live search & replace
vim.opt.list = true                                -- Show some invisible characters (tabs...
vim.opt.number = true                              -- Print line number
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.wrap = false
vim.opt.grepprg = 'rg --vimgrep --no-heading'      -- Ripgrep for searching
vim.opt.gdefault = true                            -- Default 'g' flag for substitution
vim.opt.updatetime = 100
vim.opt.swapfile = false
vim.opt.timeoutlen = 0
vim.opt.diffopt:append { ",vertical" }
vim.opt.wrap = true
vim.opt.cul = true
