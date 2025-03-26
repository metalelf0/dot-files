local ls = require("luasnip")

return {
	s(
		"curtime",
		f(function()
			return os.date("%d/%m/%Y - %H:%M")
		end)
	),
	ls.parser.parse_snippet("foo", [[¯\_(ツ)_/¯]]),
}
