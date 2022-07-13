local map = vim.keymap.set

map({ 'n', 'i', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
map({ 'n', 'i', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
map({ 'n', 'i', 'x' }, '<S-ScrollWheelUp>', "<Cmd>lua Scroll('3zh', 0, 0, 3)<CR>")
map({ 'n', 'i', 'x' }, '<S-ScrollWheelDown>', "<Cmd>lua Scroll('3zl', 0, 0, 3)<CR>")
