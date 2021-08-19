local M = {}

function M.is_buffer_empty()
  -- Check whether the current buffer is empty
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function M.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

function M.file_exists(name)
   local f=io.open(name, "r")
   if f~=nil then io.close(f) return true else return false end
end

function M.loadPluginConfig(plugin)
  if (type(plugin) == "table") then
    plugin = plugin[1]
  end
  local slashPosition = string.find(plugin, "/")
  local pluginName = plugin:sub(slashPosition + 1)

  local dotPosition = string.find(pluginName, "%.")

  if dotPosition then
    pluginName = pluginName:sub(0, dotPosition - 1)
  end

  if M.file_exists(CONFIG.nvim_plugin_config_path .. pluginName .. ".lua") then
    require ("plugins/" .. pluginName)
  end
end

return M
