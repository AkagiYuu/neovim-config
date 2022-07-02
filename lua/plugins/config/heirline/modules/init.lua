local mode = require('plugins.config.heirline.modules.mode')
local file = require('plugins.config.heirline.modules.file')
local git = require('plugins.config.heirline.modules.git')
local misc = require('plugins.config.heirline.modules.misc')
local lsp = require('plugins.config.heirline.modules.lsp')

return {
    icons = require('theme.icon').heirline,
    mode_color = mode.color,
    mode_name = mode.name,
    dir_name = file.dir_name,
    filename = file.filename,
    git_root = git.git_root,
    search_results = misc.search_results,
    locallist_count = misc.locallist_count,
    fold_method = misc.fold_method,
    lsp_client_names = lsp.lsp_client_names,
    git_count = git.git_count,
}
