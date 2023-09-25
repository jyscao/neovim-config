local S = {}

-- function S.init()
-- end

function S.config()
  -- set keymaps
  require("utils.keymap").nx('<leader>xa', "<Plug>(EasyAlign)")
  -- TODO: use helpers from keymaps.lua
end

-- S.cmd = "EasyAlign"
S.event = "VeryLazy"
-- S.keys = "<leader>g"

return S
