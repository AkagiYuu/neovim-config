local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completionItem = capabilities.textDocument.completion.completionItem

  completionItem.snippetSupport = true
  completionItem.preselectSupport = true
  completionItem.insertReplaceSupport = true
  completionItem.labelDetailsSupport = true
  completionItem.deprecatedSupport = true
  completionItem.commitCharactersSupport = true
  completionItem.tagSupport = { valueSet = { 1 } }
  completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local servers = {
    'tsserver',
    'gopls',
    'rust_analyzer',
    'pyright',
    'cssls',
    'emmet_ls',
    'html',
    'jsonls',
    'bashls',
    'asm_lsp',
    'vimls'
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/yuu/Applications/omnisharp/OmniSharp"
require 'lspconfig'.omnisharp.setup {
    cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) };
}

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
                neededFileStatus = {
                    ['codestyle-check'] = 'Any',
                },
            },
            -- workspace = {
            -- -- Make the server aware of Neovim runtime files
            -- 	library = vim.api.nvim_get_runtime_file('', true),
            -- },
        },
    },
}

capabilities.offsetEncoding = 'utf-8'
lspconfig.clangd.setup {
    capabilities = capabilities,
}
