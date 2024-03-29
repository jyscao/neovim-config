-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>dx', function()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, { desc = 'Toggle diagnostics' })

-- See: https://neovim.discourse.group/t/how-can-i-disable-completely-diagnostics-for-a-specific-buffer/1757
-- vim.keymap.set('n', '<leader>x', vim.diagnostic.disable, { desc = 'Disable diagnostics' })

---- Diagnostic settings
vim.diagnostic.config {
  virtual_text = true,
  signs = false,
  underline = true,
}
