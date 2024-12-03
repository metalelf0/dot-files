local cmdline = false
local config = require("user.config")

local M = {
	-- "hrsh7th/nvim-cmp",
	"iguanacucumber/magazine.nvim",
	version = false,
	event = "InsertEnter",
	name = "nvim-cmp",
	enabled = (config.completion_engine == "nvim-cmp"),
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-emoji",
		{ "hrsh7th/cmp-cmdline", enabled = cmdline },
		{ "dmitmel/cmp-cmdline-history", enabled = cmdline },
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"dcampos/cmp-emmet-vim",
		"mattn/emmet-vim",
		"onsails/lspkind.nvim",
	},
}

function M.config()
	if not (config.completion_engine == "nvim-cmp") then
		return
	end

	vim.o.completeopt = "menuone,noselect"

	-- Setup nvim-cmp.
	local cmp = require("cmp")

	local lspkind = require("lspkind")
	lspkind.init({
		symbol_map = {
			Supermaven = "",
		},
	})

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		filetype = {
			eruby = {
				enabled = false,
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete({}),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "supermaven" },
			{
				name = "luasnip",
				group_index = 1,
				max_entries = 5,
				option = { use_show_condition = true },
				entry_filter = function()
					local context = require("cmp.config.context")
					return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
				end,
			},
			{
				name = "emmet_vim",
				max_entries = 5,
				option = {
					filetypes = {
						"html",
						"xml",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"heex",
						"tsx",
						"jsx",
						"eruby",
					},
				},
			},
			{
				name = "nvim_lsp",
				max_entries = 5,
			},
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "path" },
		}),
		-- format = require("user.plugins.lsp.kind").cmp_format(),
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = true, -- show labelDetails in menu. Disabled by default

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				before = function(entry, vim_item)
					return vim_item
				end,
			}),
		},
		experimental = {
			ghost_text = {
				hl_group = "LspCodeLens",
			},
		},
	})
	if cmdline then
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})
	end
end

return M
