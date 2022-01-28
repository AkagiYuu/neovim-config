--Plugin manager
require('plugin')

--Auto save
require('plugin.config.auto-save')
--Theme
require('theme')

--Auto completion
require('plugin.config.lspconfig')

--Diagnostic
require('plugin.config.trouble')

--Debug
--TODO : Check if plugin work correct again
require('plugin.config.dap')

require('plugin.config.bufferline')

--Icon
require('plugin.config.icon')
require('plugin.config.lspkind')

require('plugin.config.treesitter')

--Status bar
require('plugin.config.galaxy-line')

--Notify
require('plugin.config.notify')
