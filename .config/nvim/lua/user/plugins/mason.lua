local M = {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	cmd = "Mason",
}

M.tools = {
	-- "prettierd",
	"stylua",
	"selene",
	"luacheck",
	"eslint_d",
	"shellcheck",
	"deno",
	"shfmt",
	"black",
	"isort",
	"flake8",
	-- "solargraph",
}

function M.check()
	local mr = require("mason-registry")
	for _, tool in ipairs(M.tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

function M.config()
	require("mason").setup()
	M.check()
	require("mason-lspconfig").setup({
		automatic_installation = false,
	})
end

return M
