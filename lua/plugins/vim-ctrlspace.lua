local S = {}

-- TODO/FIX: first window gets screwed up on workspace restore
-- TODO/FIX: opening then closing the ctrlspace window destroys window sizes
-- TODO: make CtrlSpace colors match rest of colorscheme; change colors by mode & integrate w/ lualine.nvim; see: https://github.com/vim-ctrlspace/vim-ctrlspace#colors

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
