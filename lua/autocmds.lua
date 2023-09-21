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


local focused_window_group = vim.api.nvim_create_augroup('FocusedWindow', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  callback = function()
    if vim.bo.filetype ~= 'help' then
      vim.wo.colorcolumn    = '100'
      vim.wo.relativenumber = true
      -- if relativenumber is applied w/o filtering out help files, then
      -- its texts will shift around when entering & leaving its window
    end
    vim.wo.cursorline     = true
  end,
  group = focused_window_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  callback = function()
    vim.wo.cursorline     = false
    vim.wo.colorcolumn    = ''
    vim.wo.relativenumber = false
    -- TODO: consider toggling signs; see `:h :sign-place` & `:h :sign-unplace`
  end,
  group = focused_window_group,
  pattern = '*',
})
