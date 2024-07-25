local M = {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  cmd = { "ObsidianOpen", "ObsidianToday", "ObsidianYesterday", "ObsidianSearch", "ObsidianNew" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Andrea",
        path = "/Users/andreaschiavini/Library/Mobile Documents/iCloud~md~obsidian/Documents/Andrea",
      },
    },
    -- dir = "~/iCloud-Obsidian",
    daily_notes = {
      folder = "work/dailies",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    templates = {
      subdir = "templates",
    },
    -- Optional, key mappings.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
    follow_url_func = function(url)
      vim.fn.jobstart { "open", url } -- Mac OS
    end,
  },
  keys = {
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", "n", desc = "Obsidian - backlinks" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", "n", desc = "Obsidian - follow link" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", "n", desc = "Obsidian - new" },
    { "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", "n", desc = "Obsidian - quick switch" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", "n", desc = "Obsidian - search" },
    { "<leader>ot", "<cmd>ObsidianToday<cr>", "n", desc = "Obsidian - today" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", "n", desc = "Obsidian - yesterday" },
    { "<leader>oL", "<cmd>ObsidianLinkNew<cr>", "v", desc = "Obsidian - new link" },
    { "<leader>ol", "<cmd>ObsidianLink<cr>", "v", desc = "Obsidian - link" },
  },
}

return M

