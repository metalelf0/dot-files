local wk = require('which-key')

wk.register({
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
    -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
  },
  b = {
    name = "Buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "List buffers" },
    c = { ":BufferClose<CR>", "Close",  noremap = true, silent = true },
    [";"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Current buffer fuzzy find" }
  },
  i = {
    name = "Insert",
    g = { "<cmd>lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>", "Gitmoji" },
    e = { "<cmd>lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>", "Emoji" },
  },
  e = {
    name = "Errors",
    e = {  ":LspTroubleToggle<CR>", "Toggle" },
    [","] = {  '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', "Prev" },
    [";"] = {  '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', "Next" },
  },
  t = {
    name = "Tree",
    t = {  "<cmd>:CHADopen<CR>", "Toggle" },
  },
  g = {
    name = "LSP stuff",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
    s = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Symbols (workspace)" },
    S = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Symbols (document)" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
    R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" }
  },
  p = { "<cmd>Telescope find_files<cr>", "Find File" },
  k = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", "Find word under cursor" },
}, { prefix = "<leader>" })
