local M = {}

M.rename_current_file = function(newName)
	local command = string.format("file %s", newName)
	vim.api.nvim_command(command)
	vim.api.nvim_buf_set_name(0, newName)
end

M.is_h1 = function(node)
	return node and node:type() == "atx_heading" and node:named_child(0):type() == "atx_h1_marker"
end

M.search_header_into = function(node, heading_level)
	-- print("Traversing node " .. vim.inspect(node) .. " " .. node:type())
	if M.is_h1(node) then
		return node:named_child(1)
	end
	for i = 0, (node:named_child_count() - 1) do
		local result = M.search_header_into(node:named_child(i), heading_level)
		if result then
			return result
		end
	end
end

M.text_within_node = function(node)
	return vim.treesitter.get_node_text(node, 0)
end

M.first_h1_text = function()
	local syntax_tree = vim.treesitter.get_parser(0):parse()[1]:root()

	if not syntax_tree then
		return "No syntax tree available"
	end

	local h1_node = M.search_header_into(syntax_tree, 1)
	local h1_text = ""
	if h1_node then
		h1_text = M.text_within_node(h1_node):gsub("^%s+", "")
	end

	print(h1_text)

	return h1_text
end

vim.keymap.set("n", "<leader>mh", M.first_h1_text, { desc = "Print first h1 text" })

return M
