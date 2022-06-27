local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local servers = {
	"tsserver",
	"gopls",
	"rust_analyzer",
	"pyright",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"bashls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

capabilities.offsetEncoding = "utf-8"
lspconfig.clangd.setup({
	capabilities = capabilities,
})

local sumneko = require(... .. ".sumneko").setting({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			-- workspace = {
			-- -- Make the server aware of Neovim runtime files
			-- 	library = vim.api.nvim_get_runtime_file('', true),
			-- },
		},
	},
})
lspconfig.sumneko_lua.setup(sumneko)

require(... .. ".diagnostic")