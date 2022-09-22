return {
	s("rspec", fmt('require "rails_helper"\n\nRSpec.describe {} do\n\nend', { i(1, "something") })),
	s("test", fmt('require "test_helper"\n\nclass {}Test < ActiveSupport::TestCase\n\nend', { i(1, "") })),
	s(
		"fname",
		f(function(_, snip)
			return snip.env.TM_FILENAME or {}
		end, {})
	),
}
