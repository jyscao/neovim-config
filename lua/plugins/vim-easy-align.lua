local S = {}

-- function S.init()
-- end

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.nx('<leader>ai', "<Plug>(EasyAlign)", { desc = 'align interactively'})
  keymap.x('<leader>aa', ':EasyAlign*', { silent = false, desc = 'align on all' })
  keymap.x('<leader>al', ':EasyAlign-', { silent = false, desc = 'align on last' })
end

-- S.cmd = "EasyAlign"
S.event = "VeryLazy"
-- S.keys = "<leader>g"

return S
