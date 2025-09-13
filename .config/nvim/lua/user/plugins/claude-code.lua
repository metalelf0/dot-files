return {
	"coder/claudecode.nvim",
	dependencies = {
		"folke/snacks.nvim", -- Required for git operations
	},
	config = true,
	keys = {
		{ "<leader>A", nil, desc = "AI/Claude Code" },
		{ "<leader>Ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>Af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>Ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>AC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>Am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>Ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>As", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>As",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
		},
		-- Diff management
		{ "<leader>Aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>Ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
