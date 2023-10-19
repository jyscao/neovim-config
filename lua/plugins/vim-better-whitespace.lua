local S = {}

function S.init()
  vim.g.better_whitespace_enabled  = 0
  vim.g.better_whitespace_guicolor = 'cyan'
  -- vim.g.better_whitespace_ctermcolor = 'white'
  -- vim.g.current_line_whitespace_disabled_soft = 1
  -- vim.g.current_line_whitespace_disabled_hard = 1
end

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n('<leader>xw', "<Cmd>StripWhitespace<CR>")
  keymap.n('<leader>xW', "<Cmd>ToggleWhitespace<CR>")
  -- NOTE: this plugin is sometimes buggy, in that it'll highlight whitespaces even
  -- while in insert mode, toggling whitespace higlighting off/on seems to fixes it
end

S.event = "VeryLazy"

return S
