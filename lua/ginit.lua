if vim.g.nvui then
	vim.opt.guifont = "CaskaydiaCove Nerd Font:h12"
	vim.cmd([[
      packadd nvui
      NvuiOpacity 0.9
      NvuiFrameless v:true
   ]])
end