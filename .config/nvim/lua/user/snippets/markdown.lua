
return {
	s(
		"tototo",
		fmt("# {}\n\n## Today\n\n## Tomorrow\n\n## Todo\n\n---\n\n## Notes\n", { f(function()
			return os.date("%Y %B %d, %A")
		end) })
	),
}
