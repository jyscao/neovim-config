local S = {}

function S.init()
  -- set CtrlSpace globals
  vim.g.CtrlSpaceDefaultMappingKey = "<C-Space> "
  vim.g.CtrlSpaceGlobCommand = "rg --color=never --files"
  vim.g.CtrlSpaceEnableFilesCache = 0
end

function S.config()
  -- set CtrlSpace keymap
  require("utils.keymap").n("<C-Space>", "<Cmd>CtrlSpace<CR>")
end

S.event = { "BufWinEnter" }
-- S.event = "VeryLazy"
-- S.cmd = "CtrlSpace"
-- S.keys = "<C-Space>"

return S
