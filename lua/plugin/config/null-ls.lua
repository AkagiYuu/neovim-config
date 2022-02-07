local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting

local sources = {
  formatting.prettierd.with({
    command = 'prettierd',
    extra_args = { "--config", vim.fn.expand("~/.prettierrc.json") },
  })
}

null_ls.setup({sources = sources , debug = true})
