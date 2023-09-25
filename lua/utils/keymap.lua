local M = {}

function M._map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true, }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.n(lhs, rhs, opts)
  M._map('n', lhs, rhs, opts)
end

function M.nx(lhs, rhs, opts)
  M._map({ 'n', 'x' }, lhs, rhs, opts)
end

function M.nox(lhs, rhs, opts)
  M._map({ 'n', 'o', 'x' }, lhs, rhs, opts)
end

return M
