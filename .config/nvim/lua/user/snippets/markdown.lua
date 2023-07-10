return {
	s(
		"tototo",
		fmt(
			"# {}\n\n## Today\n\n### Calls\n\n### Tasks\n\n### Events\n\n### Notes\n\n## Tomorrow\n\n## Todo\n\n---\n\n## Notes\n",
			{ f(function()
				return os.date("%Y %B %d, %A")
			end) }
		)
	),
}
