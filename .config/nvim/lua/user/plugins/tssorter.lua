return {
	"mtrajano/tssorter.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("tssorter").setup({
			sortables = {
				ruby = {
					methods = {
						node = "method",
						order_by = function(node1, node2)
							local line1 = require("tssorter.tshelper").get_text(node1)
							local line2 = require("tssorter.tshelper").get_text(node2)

							return line1 < line2
						end,
					},
				},
			},
			-- leave empty for default
		})
	end,
}
