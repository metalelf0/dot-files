-- Edgee setup for CodeCompanion
-- Reads credentials from ~/.config/edgee/credentials.toml

local function parse_toml_value(line)
	-- Extract value from TOML key = "value" format
	local value = line:match('^[%w_]+ = "(.+)"$')
	return value
end

local function setup_edgee()
	local config_path = os.getenv("HOME") .. "/.config/edgee/credentials.toml"
	local config_file = io.open(config_path, "r")

	if not config_file then
		vim.notify("Edgee credentials.toml not found at " .. config_path, vim.log.levels.WARN)
		return
	end

	local content = config_file:read("*a")
	config_file:close()

	-- Extract from [profiles.default.claude] section
	local api_key = content:match('%[profiles%.default%.claude%].-api_key = "([^"]+)"')
	local api_url = "https://api.edgee.ai/v1" -- Standard Edgee endpoint

	if api_key then
		vim.env.EDGEE_API_KEY = api_key
		vim.env.EDGEE_API_URL = api_url
	else
		vim.notify("Edgee API key not found in credentials.toml", vim.log.levels.WARN)
	end
end

setup_edgee()

