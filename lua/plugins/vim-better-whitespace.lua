local S = {}

function S.init()
  vim.g.current_line_whitespace_disabled_soft = true
  vim.g.better_whitespace_guicolor            = 'cyan'
  -- vim.g.better_whitespace_ctermcolor       = 'white'
end

function S.config()
  -- set keymaps
  require("utils.keymap").nx('<leader>xd', "<Cmd>StripWhitespace<CR>")
end

S.event = "VeryLazy"

return S
