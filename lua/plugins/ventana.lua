local S = {}

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n("<C-w><C-t>", "<Cmd>VentanaTranspose<CR>")
  keymap.n("<C-w><C-f>", "<Cmd>VentanaShift<CR>")
  keymap.n("<C-w>f",     "<Cmd>VentanaShiftMaintainLinear<CR>")
end

S.keys = { "<C-w><C-t>", "<C-w><C-f>", "<C-w>f", }

return S
