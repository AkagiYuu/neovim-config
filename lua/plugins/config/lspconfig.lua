local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"tsserver",
	"gopls",
	"rust_analyzer",
	"pyright",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
end

capabilities.offsetEncoding = "utf-8"
nvim_lsp.clangd.setup({
	capabilities = capabilities,
})

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup({
	cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
	-- capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			-- workspace = {
			-- Make the server aware of Neovim runtime files
			-- library = vim.api.nvim_get_runtime_file('', true),
			-- },
		},
	},
})

--Diagnostic configuration
vim.diagnostic.config({
	signs = true,
})

--Icon
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
