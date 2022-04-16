local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"tsserver",
	"pyright",
	"clangd",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"vimls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
end

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup({
	cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
	capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
