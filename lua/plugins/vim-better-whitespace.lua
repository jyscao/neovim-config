local S = {}

function S.init()
  vim.g.better_whitespace_guicolor = 'cyan'
  -- vim.g.better_whitespace_ctermcolor = 'white'
  -- vim.g.current_line_whitespace_disabled_soft = 1
  -- vim.g.current_line_whitespace_disabled_hard = 1
end

function S.config()
  -- set keymaps
  require("utils.keymap").nx('<leader>xw', "<Cmd>ToggleWhitespace<CR>")
  -- NOTE: this plugin is sometimes buggy, in that it'll highlight whitespaces even
  -- while in insert mode toggling whitespace higlighting off/on seems to fixes it
  require("utils.keymap").nx('<leader>xW', "<Cmd>StripWhitespace<CR>")
end

S.event = "VeryLazy"

return S
