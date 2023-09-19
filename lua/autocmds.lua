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


local cursorline_group = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  callback = function()
    vim.wo.cursorline = true
  end,
  group = cursorline_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  callback = function()
    vim.wo.cursorline = false
  end,
  group = cursorline_group,
  pattern = '*',
})
