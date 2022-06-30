local M = {}

local lsp_names = {
	["null-ls"] = "Null",
	["diagnostics_on_open"] = "Diagnostics",
	["diagnostics_on_save"] = "Diagnostics",
	bashls = "Bash",
	clangd = "C++",
	dockerls = "Docker",
	gopls = "Go",
	golangci_lint_ls = "GolangCI",
	html = "HTML",
	jedi_language_server = "Python",
	jsonls = "JSON",
	sqls = "SQL",
	sumneko_lua = "Lua",
	vimls = "Vim",
	yamlls = "YAML",
}

M.lsp_client_names = function()
	local clients = {}

	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		local name = lsp_names[client.name] or client.name
		clients[#clients + 1] = name
	end

	return table.concat(clients, "   "), " "
end

return M