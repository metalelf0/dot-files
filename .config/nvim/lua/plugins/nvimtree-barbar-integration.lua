local view = require'nvim-tree.view'

local _M = {}
_M.toggle_tree = function()
  if view.win_open() then
    require'nvim-tree'.close()
    require'bufferline.state'.set_offset(0)
  else
    require'bufferline.state'.set_offset(31, 'File Explorer')
    require'nvim-tree'.find_file(true)
  end
end

return _M

