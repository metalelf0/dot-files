-- clickup.lua - Neovim compatible version

-- Check if we're in Neovim
local in_nvim = (vim ~= nil)

-- Use plenary.nvim's curl module if available (recommended for Neovim)
local has_plenary, curl = pcall(require, "plenary.curl")

local Clickup = {}
Clickup.__index = Clickup

-- Task class
local Task = {}
Task.__index = Task

function Task.new(id)
	local self = setmetatable({}, Task)
	self.id = id
	self.token = vim.env.CLICKUP_TOKEN or os.getenv("CLICKUP_TOKEN")
	return self
end

function Task:title()
	self:validate_token()
	local data = self:read_data()
	return data.name
end

function Task:validate_token()
	if not self.token or self.token == "" then
		error("CLICKUP_TOKEN environment variable is not set")
	end
end

function Task:url()
	return "https://api.clickup.com/api/v2/task/" .. self.id
end

function Task:read_data()
	if has_plenary then
		-- Use plenary.curl if available (better for Neovim)
		local response = curl.get(self:url(), {
			headers = {
				accept = "application/json",
				Authorization = self.token,
			},
		})

		if response.status ~= 200 then
			error("HTTP request failed with status code: " .. tostring(response.status))
		end

		local parsed = vim.json.decode(response.body)

		return parsed
	else
		-- Fallback to socket.http if plenary isn't available
		error("plenary.nvim not found. Please install plenary.nvim for HTTP requests in Neovim")
	end
end

-- Add Task to Clickup namespace
Clickup.Task = Task

return Clickup
