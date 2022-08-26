local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local function swapNodeWithNext()
	local utils = require("nvim-treesitter.ts_utils")
	local currentNode = utils.get_node_at_cursor()
	local nextNode = utils.get_next_node(currentNode, false, false)
	utils.swap_nodes(currentNode, nextNode, 0, true)
end

local function swapNodeWithPrev()
	local utils = require("nvim-treesitter.ts_utils")
	local currentNode = utils.get_node_at_cursor()
	local nextNode = utils.get_previous_node(currentNode, false, false)
	utils.swap_nodes(currentNode, nextNode, 0, true)
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	playground = {
		enable = true,
	},
})
