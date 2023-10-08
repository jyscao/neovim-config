local S = {}

-- function S.init()
-- end

function S.config()
  require('nvim-peekup.config').on_keystroke["delay"] = ""

  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n('<leader>""', "<Plug>PeekupOpen")
  keymap.n('<leader>"p', "<Plug>PeekupPasteAfter")
  keymap.n('<leader>"P', "<Plug>PeekupPasteBefore")
  keymap.n('<leader>"X', "<Plug>PeekupEmptyRegisters")
end

S.event = "VeryLazy"

return S
