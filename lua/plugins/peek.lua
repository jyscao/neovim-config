local S = {}

S.init = function()
  vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  require("utils.keymap").n('<leader>xm', "<Cmd>PeekOpen<CR>")
  require("utils.keymap").n('<leader>xM', "<Cmd>PeekClose<CR>")
end

S.config = true
S.build = "deno task --quiet build:fast"
S.ft = "markdown"

return S