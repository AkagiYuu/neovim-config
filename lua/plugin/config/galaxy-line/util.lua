local M = {}

function M.split(str, sep)
  local res = {}
  for w in str:gmatch('([^' .. sep .. ']*)') do
    if w ~= '' then
      table.insert(res, w)
    end
  end
  return res
end

function M.get_active_lsp_client_names()
  local active_clients = vim.lsp.get_active_clients()
  local client_names = {}
  for _, client in pairs(active_clients or {}) do
    local buf = vim.api.nvim_get_current_buf()
    -- only return attached buffers
    if vim.lsp.buf_is_attached(buf, client.id) then
      table.insert(client_names, client.name)
    end
  end

  if not vim.tbl_isempty(client_names) then
    table.sort(client_names)
  end
  return client_names
end

return M