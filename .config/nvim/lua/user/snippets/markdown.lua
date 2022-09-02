return {
	s(
		"tototo",
		fmt("# {}\n\n## Today\n\n## Tomorrow\n\n## Todo\n", { f(function()
			return os.date("%d/%m/%Y")
		end) })
	),
}
