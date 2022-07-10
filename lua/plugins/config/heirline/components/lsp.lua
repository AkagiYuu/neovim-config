local lsp = {}

lsp.name = function(conditions)
    return {
        condition = conditions.lsp_attached,

        provider = require('plugins.config.heirline.utils.lsp').lsp_client_names,
        on_click = {
            callback = function()
                vim.defer_fn(function() vim.cmd('LspInfo') end, 100)
            end,
            name = 'heirline_LSP',
        },
        update = { 'LspAttach', 'LspDetach' },
    }
end

lsp.diagnostic = function(conditions, colors)
    return {
        condition = conditions.has_diagnostics,

        static = {
            icon = {
                error = '  ',
                warn = '  ',
                info = '  ',
                hint = '  ',
            }
        },

        init = function(self)
            self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
            self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,

        {
            provider = function(self) return self.errors > 0 and (self.icon.error .. self.errors .. ' ') end,
            hl = { fg = colors.diag.error }
        },
        {
            provider = function(self) return self.warnings > 0 and (self.icon.warn .. self.warnings .. ' ') end,
            hl = { fg = colors.diag.warn },
        },
        {
            provider = function(self) return self.info > 0 and (self.icon.info .. self.info .. ' ') end,
            hl = { fg = colors.diag.info },
        },
        {
            provider = function(self) return self.hints > 0 and (self.icon.hint .. self.hints) end,
            hl = { fg = colors.diag.hint },
        },
        on_click = {
            callback = function() vim.cmd [[TroubleToggle]] end,
            name = 'heirline_diagnostics',
        },
    }
end

return lsp
