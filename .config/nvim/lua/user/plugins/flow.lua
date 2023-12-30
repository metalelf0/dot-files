return {
	"arjunmahishi/flow.nvim",
	cmd = { "FlowRunFile", "FlowRunSelected" },
	opts = {
		output = {
			buffer = true,
			split_cmd = "100vsplit",
		},
		filetype_cmd_map = {
			sh = "bash <<-EOF\n%s\nEOF",
			csx = "dotnet script eval <<-EOF\n%s\nEOF",
		},
	},
}
