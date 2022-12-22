local M = {
  "ThePrimeagen/harpoon",
  event = "BufReadPost"
}

M.config = function()
  require("harpoon").setup({
    global_settings = {
      mark_branch = true, -- set marks specific to each git branch inside git repository
    },
  })
end

return M
