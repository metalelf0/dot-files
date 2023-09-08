local cmdline = false
local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
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
	},
}

function M.config()
	vim.o.completeopt = "menuone,noselect"

	-- Setup nvim-cmp.
	local cmp = require("cmp")

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
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete({}),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{
				name = "luasnip",
				group_index = 1,
				option = { use_show_condition = true },
				entry_filter = function()
					local context = require("cmp.config.context")
					return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
				end,
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
			{ name = "emoji" },
			{ name = "neorg" },
			{ name = "orgmode" },
			{
				name = "emmet_vim",
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
		}),
		formatting = {
			format = require("user.plugins.lsp.kind").cmp_format(),
		},
		-- documentation = {
		--   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		--   winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
		-- },
		experimental = {
			ghost_text = {
				hl_group = "LspCodeLens",
			},
		},
		-- sorting = {
		--   comparators = {
		--     cmp.config.compare.sort_text,
		--     cmp.config.compare.offset,
		--     -- cmp.config.compare.exact,
		--     cmp.config.compare.score,
		--     -- cmp.config.compare.kind,
		--     -- cmp.config.compare.length,
		--     cmp.config.compare.order,
		--   },
		-- },
	})
	if cmdline then
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				-- { name = "noice_popupmenu" },
				{ name = "path" },
				{ name = "cmdline" },
				-- { name = "cmdline_history" },
			}),
		})
	end
end

return M
