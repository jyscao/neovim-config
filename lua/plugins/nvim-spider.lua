local S = {}

-- function S.init()
-- end

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.nox("w" , "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = false })<CR>" , { desc = "Spider-w" })
  keymap.nox("e" , "<cmd>lua require('spider').motion('e')<CR>"                                           , { desc = "Spider-e" })
  keymap.nox("b" , "<cmd>lua require('spider').motion('b')<CR>"                                           , { desc = "Spider-b" })
  keymap.nox(":" , "<cmd>lua require('spider').motion('ge')<CR>"                                          , { desc = "Spider-ge"})
end

S.event = "VeryLazy"

return S
