local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
	"tsserver",
	"pyright",
	"clangd",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"vimls"
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup({
	cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
        },
    },
})


