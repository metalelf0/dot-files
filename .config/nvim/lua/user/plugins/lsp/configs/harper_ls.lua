-- see https://writewithharper.com/docs/integrations/neovim

return {
	settings = {
		["harper-ls"] = {
			userDictPath = "~/dict.txt",
			linters = {
				UseTitleCase = false,
				SentenceCapitalization = false,
				SpellCheck = false,
			},
		},
	},
}
