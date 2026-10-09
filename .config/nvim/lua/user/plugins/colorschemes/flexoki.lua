local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")
local color_utils = require("user.utils.colors")

local colorscheme = "flexoki"

local M = {
	"nuvic/flexoki-nvim",
	name = "flexoki",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "moon", "dawn" }
M.default_variant = "moon"

function M.config()
	if config.colorscheme ~= "flexoki" then
		return false
	end

	local palette = require("flexoki.palette")
	local link_bg = palette.green_zero
	local tag_bg = palette.overlay
	local text_fg = palette.text
	local function set_hl(g, s)
		vim.api.nvim_set_hl(0, g, s)
	end

	require("flexoki").setup({
		variant = themer.variant(M),
		styles = {
			bold = true,
			italic = true,
			transparency = config.transparent,
		},
	})

	vim.cmd("colorscheme flexoki")

	if themer.variant(M) == "dawn" then
		set_hl("@markup.link.label.markdown_inline", { bg = link_bg, fg = text_fg })
		set_hl("@lsp.type.decorator.markdown", { bg = link_bg, fg = text_fg })
		set_hl("@markup.raw.markdown_inline", { bg = tag_bg })
		set_hl("RenderMarkdownCode", { bg = tag_bg })
		set_hl("RenderMarkdownCodeInline", { bg = tag_bg })
	end
end

return M
