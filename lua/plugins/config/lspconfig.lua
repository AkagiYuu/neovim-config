local lspconfig = require('lspconfig')
local lsp_path = vim.fn.stdpath('data') .. "/mason/bin/"

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
         'documentation',
         'detail',
         'additionalTextEdits',
      },
    },
}
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
                neededFileStatus = {
                    ['codestyle-check'] = 'Any',
                },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
                maxPreload = 100000,
            }
            -- workspace = {
            --     library = vim.api.nvim_get_runtime_file('', true),
            --     maxPreload = 1000000,
            -- },
        },
    },
    capabilities = capabilities,
}
local servers = {
    -- 'ccls',
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
local omnisharp_bin = lsp_path .. 'omnisharp'
require 'lspconfig'.omnisharp.setup {
    cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
}


-- capabilities.offsetEncoding = 'utf-8'
lspconfig.clangd.setup {
    capabilities = capabilities,
}

-- Borders for LspInfo window
local win = require 'lspconfig.ui.windows'
local _default_opts = win.default_opts

win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = 'single'
    return opts
end
