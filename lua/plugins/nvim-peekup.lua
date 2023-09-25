local S = {}

function S.init()
  -- TODO: set keymaps using require("utils.keymap")
  vim.g.peekup_open = '<leader>""'
  vim.g.peekup_paste_before = '<leader>"P'
  vim.g.peekup_paste_after = '<leader>"p'
  vim.g.peekup_empty_registers = '<leader>"X'
end

function S.config()
  require('nvim-peekup.config').on_keystroke["delay"] = ""
end

S.event = "VeryLazy"

return S
