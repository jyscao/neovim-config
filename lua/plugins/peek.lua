local S = {}

S.init = function()
  vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n('<leader>xm', "<Cmd>PeekOpen<CR>",  { desc = "open Markdown preview"  })
  keymap.n('<leader>xM', "<Cmd>PeekClose<CR>", { desc = "close Markdown preview" })
end

S.config = true
S.build = "deno task --quiet build:fast"
S.ft = "markdown"

return S
