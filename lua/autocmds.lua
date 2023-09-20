-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


local focused_window_group = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  callback = function()
    vim.wo.cursorline     = true
    vim.wo.colorcolumn    = '100'
    vim.wo.relativenumber = true
  end,
  group = focused_window_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  callback = function()
    vim.wo.cursorline     = false
    vim.wo.colorcolumn    = ''
    vim.wo.relativenumber = false
  end,
  group = focused_window_group,
  pattern = '*',
})
