
require('rose-pine').setup({
	---@usage 'main'|'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
	---@usage string hex value or named color from rosepinetheme.com/palette
  --[[ highlight_groups = { ]]
  --[[     TSConstant = { fg = 'gold' }, ]]
  --[[     rubyConstant = { fg = 'gold' }, ]]
  --[[ }, ]]
	groups = {
		--[[ border = 'highlight_med', ]]
		--[[ comment = 'muted', ]]
		--[[ link = 'iris', ]]
		--[[ punctuation = 'subtle', ]]
  --[[   label = "foam", ]]
		--[[]]
		--[[ error = 'love', ]]
		--[[ hint = 'iris', ]]
		--[[ info = 'foam', ]]
		--[[ warn = 'gold', ]]

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		},
		-- or set all headings at once
		-- headings = 'subtle'
	}
})

vim.o.background = "dark"

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
