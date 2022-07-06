local lsp = {}

local lsp_client_names = require('plugins.config.heirline.utils.lsp').lsp_client_names

lsp.name = function(utils, conditions)
    return {
        static = {
            icon = '  ',
        },
        condition = conditions.lsp_attached,
        utils.make_flexible_component(2, {
            provider = function(self)
                return self.icon .. lsp_client_names()
            end,
        }, {
            provider = function(self)
                return self.icon .. lsp_client_names()
            end,
        }),
        update = { 'LspAttach', 'LspDetach' },
    }
end

lsp.diagnostic = function(conditions, colors)
    return {
        condition = conditions.has_diagnostics,

        static = {
            error_icon = '  ',
            warn_icon = '  ',
            info_icon = '  ',
            hint_icon = '  ',
        },

        init = function(self)
            self.errors = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.ERROR,
            })
            self.warnings = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.WARN,
            })
            self.hints = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.HINT,
            })
            self.info = #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity.INFO,
            })
        end,

        {
            provider = function(self)
                return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
            end,
            hl = {
                fg = colors.diag.error,
            },
        },
        {
            provider = function(self)
                return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
            end,
            hl = {
                fg = colors.diag.warn,
            },
        },
        {
            provider = function(self)
                return self.info > 0 and (self.info_icon .. self.info .. ' ')
            end,
            hl = {
                fg = colors.diag.info,
            },
        },
        {
            provider = function(self)
                return self.hints > 0 and (self.hint_icon .. self.hints)
            end,
            hl = {
                fg = colors.diag.hint,
            },
        },
    }
end

return lsp
