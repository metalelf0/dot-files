local wk = require('which-key')

wk.register({
  f = {
    name = "File",
    f = { ":Telescope find_files<cr>", "Find File" },
    r = { ":Telescope oldfiles<cr>", "Open Recent File", noremap=false },
    p = { ":lua require('telescope').extensions.project.project{}<CR>", "Projects"},
    ["/"] = { ":lua require('telescope.builtin').live_grep()<CR>", "Search" },
    -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
  },
  b = {
    name = "Buffers",
    b = { ":lua require('telescope.builtin').buffers()<CR>", "List buffers" },
    c = { ":BufferClose<CR>", "Close",  noremap = true, silent = true },
    C = { ":BufferCloseAllButCurrent<CR>", "Close other buffers",  noremap = true, silent = true },
    [";"] = { ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Current buffer fuzzy find" }
  },
  i = {
    name = "Insert",
    g = { ":lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>", "Gitmoji" },
    e = { ":lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>", "Emoji" },
  },
  e = {
    name = "Errors",
    e = {  ":LspTroubleToggle<CR>", "Toggle" },
    [","] = {  ':lua vim.lsp.diagnostic.goto_prev()<CR>', "Prev" },
    [";"] = {  ':lua vim.lsp.diagnostic.goto_next()<CR>', "Next" },
  },
  t = {
    name = "Tree",
    t = {  ":NvimTreeToggle<CR>", "Toggle" },
  },
  n = {
    name = "Notes",
    n = { ":lua require('telescope.builtin').live_grep({search_dirs={'/Users/metalelf0/Documents/Notes'}})<CR>", "Notes"},
  },
  g = {
    name = "LSP stuff",
    d = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    r = { ":lua require('telescope.builtin').lsp_references()<CR>", "References" },
    s = { ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Symbols (workspace)" },
    S = { ":lua require('telescope.builtin').lsp_document_symbols()<CR>", "Symbols (document)" },
    f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
    R = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" }
  },
  v = {
    name = "VCS",
    s = {  ":Neogit<CR>", "Status" },
    b = {  ":Gitsigns toggle_current_line_blame<CR>", "Blame" },
    l = {  ":Neogit log -gc<CR>", "Log" },
    d = {  ":Neogit diff<CR>", "Diff" },
    b = { ":Telescope git_branches<cr>", "Checkout branch" },
    f = { ":Telescope git_status<cr>", "Open changed file" },
  },
  V = {
    name = "(Neo)vim",
    c = {  ":e $MYVIMRC<CR>", "Edit (c)onfig file" },
    r = {  ":luafile $MYVIMRC<CR>", "(r)eload config" },
    u = {  ":PackerSync<CR>", "(u)pdate plugins"},
    C = {
      ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme",
    },
  },
  p = { ":Telescope find_files<cr>", "Find File" },
  k = { ":lua require('telescope.builtin').grep_string()<CR>", "Find word under cursor" },
  R = { ":lua require('telescope.builtin').resume()<CR>", "Resume last search" },
}, { prefix = "<leader>" })
