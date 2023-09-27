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


local focused_win_excluded_ft = {'help', 'lspinfo', 'man',}
local focused_window_group = vim.api.nvim_create_augroup('FocusedWindow', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  callback = function()
    if not require("utils.itertools").list_contains(focused_win_excluded_ft, vim.bo.filetype) then
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


local formatprg_group = vim.api.nvim_create_augroup('SetFormatprg', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.filetype == 'markdown' then
      vim.bo.formatprg = 'par w99 s0'     -- TODO: understand then tweak par options
    end
  end,
  group = formatprg_group,
  pattern = '*',
})


-- -- TODO: use below autocmd to clear register on VimEnter?
-- See: https://vi.stackexchange.com/questions/467/how-can-i-clear-a-register-multiple-registers-completely & https://stackoverflow.com/questions/19430200/how-to-clear-vim-registers-effectively
-- local vim_init_group = vim.api.nvim_create_augroup('VimInit', { clear = true })
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     vim.fn.PeekupEmptyRegisters()
--     vim.cmd.quit()
--   end,
--   group = vim_init_group,
-- })
