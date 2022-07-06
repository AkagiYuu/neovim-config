require('sidebar-nvim').setup {
    sections = { 'git', 'diagnostics', 'symbols', 'containers', 'todos' },
    todos = {
        icon = '',
        ignored_paths = { '~' }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    },
}
