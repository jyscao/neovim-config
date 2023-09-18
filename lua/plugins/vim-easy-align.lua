local S = {}

-- function S.init()
-- end

function S.config()
  -- set keymaps
  vim.keymap.set({ 'n', 'x' }, '<leader>xa', "<Plug>(EasyAlign)", { noremap = true, silent = true })
  -- TODO: use helpers from keymaps.lua
end

-- S.cmd = "EasyAlign"
S.event = "VeryLazy"
-- S.keys = "<leader>g"

return S
