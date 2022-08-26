local M = {}

M.rootdir = function()
  local root_dir
  for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      root_dir = dir
      break
    end
  end

  if root_dir then
    return vim.fs.basename(root_dir)
  else
    return ""
  end
end

M.find_files_in_dir = function(directory)
  require('telescope.builtin').find_files({cwd= directory, search_dirs={ directory }})
end

M.search_files_in_dir = function(directory)
  require('telescope.builtin').live_grep({cwd= directory, search_dirs={ directory }})
end

return M
