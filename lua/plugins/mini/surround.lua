local S = {}

-- function S.init()
-- end

-- function S.config()
--   -- set keymaps
--   -- vim.keymap.set('x', 'xa', "<Plug>(EasyAlign)", { noremap = false, silent = true })
--   -- vim.keymap.set('n', 'xa', "<Plug>(EasyAlign)", { noremap = false, silent = true })
-- end
S.config = true

S.version = false

-- S.cmd = "EasyAlign"
-- S.event = { "BufWinEnter", }
S.event = "VeryLazy"
-- S.keys = "<leader>g"

return S
