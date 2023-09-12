local S = {}

function S.init()
  -- set CtrlSpace globals
  vim.g.CtrlSpaceDefaultMappingKey = "<C-Space> "
  vim.g.CtrlSpaceGlobCommand = "rg --color=never --files"
  vim.g.CtrlSpaceEnableFilesCache = 0
end

function S.config()
  -- set CtrlSpace keymaps
  vim.keymap.set("n", "<C-Space>", "<cmd>CtrlSpace<CR>", { silent = true })
end

return S
