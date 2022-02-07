local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"tsserver",
	"pyright",
	"clangd",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"eslint",
	"vimls",
	"quick_lint_js",
    "dockerls",
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
				globals = { "vim" },
			},
		},
	},
})

-- require "lspconfig".efm.setup {
--     cmd = {'efm-langserver', '-c', 'C:/Users/HUYNH MINH KHANG/AppData/Local/efm-langserver/config.yaml'},
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {
--                 {formatCommand = "lua-format -i", formatStdin = true}
--             },
--             javascript = {
--                 {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
--             },
--             html = {
--                 {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
--             }
--         }
--     }
-- }


--Diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})
--Icon
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- local library = {}
--
--
-- local function add(lib)
--   for _, p in pairs(vim.fn.expand(lib, false, true)) do
--     p = vim.loop.fs_realpath(p)
--     library[p] = true
--   end
-- end
--
-- -- add runtime
-- add("$VIMRUNTIME")
--
-- -- add your config
-- -- add("~/.config/nvim")
--
--  nvim_lsp.sumneko_lua.setup ({
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" }
--       },
--       workspace = {
--         library = library,
--         maxPreload = 2000,
--         preloadFileSize = 50000
--       },
--     }
--   }
-- })
