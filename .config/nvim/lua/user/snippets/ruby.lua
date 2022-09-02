return {
	s("rspec", fmt('require "rails_helper"\n\nRSpec.describe {} do\n\nend', { i(1, "something") })),
	s(
		"fname",
		f(function(_, snip)
			return snip.env.TM_FILENAME or {}
		end, {})
	),
}
