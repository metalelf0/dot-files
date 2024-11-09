local json = vim.fn.json_encode -- Use json_encode for request body formatting
local curl = vim.fn.system -- Use system to execute curl commands

-- Function to create GitHub link with the current line
function create_github_link()
	-- Get the GitHub remote URL
	local handle = io.popen("git config --get remote.origin.url")
	local git_url = handle:read("*a"):gsub("%s+", "")
	handle:close()

	-- Convert 'git@github.com:username/repo.git' to 'https://github.com/username/repo'
	git_url = git_url:gsub("git@github.com:", "https://github.com/"):gsub("%.git$", "")

	-- Get the current branch
	local branch_handle = io.popen("git rev-parse --abbrev-ref HEAD")
	local branch = branch_handle:read("*a"):gsub("%s+", "")
	branch_handle:close()

	-- Get the relative path to the current file in the repository
	local file_path_handle = io.popen("git rev-parse --show-prefix")
	local relative_path = file_path_handle:read("*a"):gsub("%s+", "")
	file_path_handle:close()

	-- Get the filename inside the current buffer
	local filename = vim.fn.expand("%")

	-- Get the current line number where the cursor is
	local line_number = vim.fn.line(".")

	-- Construct the GitHub URL
	local github_url = git_url .. "/blob/" .. branch .. "/" .. relative_path .. filename .. "#L" .. line_number

	-- Output the URL (this can also copy it to the clipboard)
	print(github_url)
	vim.fn.setreg("+", github_url) -- Copy to clipboard
end

function post_to_gist()
	-- Get GitHub Token from environment variable
	local token = vim.fn.getenv("GIST_TOKEN")
	if token == nil or token == "" then
		print("GitHub token not found. Please set the GIST_TOKEN environment variable.")
		return
	end

	-- Get the current visual selection
	local _, ls, cs, _ = unpack(vim.fn.getpos("'<"))
	local _, le, ce, _ = unpack(vim.fn.getpos("'>"))
	local lines = vim.fn.getline(ls, le)

	-- Trim the lines based on the columns of the selection
	lines[1] = string.sub(lines[1], cs)
	lines[#lines] = string.sub(lines[#lines], 1, ce)

	-- Convert selection to a single string
	local content = table.concat(lines, "\n")

	-- Get the current filetype for Gist syntax highlighting
	local filetype = vim.bo.filetype or "txt"

	-- Prepare Gist request body
	local gist_body = {
		description = "Created from Neovim",
		public = false, -- Make the Gist private
		files = {
			["gistfile." .. filetype] = {
				content = content,
			},
		},
	}

	-- Convert the body to JSON
	local json_body = json(gist_body)

	-- Execute curl command to create the Gist
	local result = vim.fn.system({
		"curl",
		"-s",
		"-X",
		"POST",
		"-H",
		"Authorization: token " .. token,
		"-H",
		"Content-Type: application/json",
		"-d",
		json_body,
		"https://api.github.com/gists",
	})

	-- Parse the JSON response to extract the URL
	local gist_data = vim.fn.json_decode(result)

	if gist_data and gist_data.html_url then
		-- Copy the Gist URL to the clipboard and print it
		vim.fn.setreg("+", gist_data.html_url)
		print("Gist created: " .. gist_data.html_url)
	else
		print("Failed to create Gist: " .. vim.inspect(gist_data))
	end
end
-- Map the function to a keybinding for visual mode
vim.api.nvim_set_keymap("n", "<leader>gL", ":lua create_github_link()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>gP", ":lua post_to_gist()<CR>", { noremap = true, silent = true })
