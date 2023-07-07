return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	opts = {
		kind = "split",
		signs = {
			-- { CLOSED, OPENED }
			section = { "", "" },
			item = { "", "" },
			hunk = { "", "" },
		},
		integrations = { diffview = true },
		disable_commit_confirmation = true,
	},
}
