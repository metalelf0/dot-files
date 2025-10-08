-- see https://writewithharper.com/docs/integrations/neovim

return {
	settings = {
		["harper-ls"] = {
			userDictPath = "~/dict.txt",
			linters = {
				SentenceCapitalization = false,
				SpellCheck = false,
			},
		},
	},
}
