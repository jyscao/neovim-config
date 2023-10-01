local S = {}

function S.init()
  -- set keymaps
  require("utils.keymap").n('<leader>t', "<Cmd>Themery<CR>")
end

S.opts = {
  themes = {
    "onedark",
    "tokyonight-night",
    "tokyonight-storm",
    "tokyonight-moon",
    "oxocarbon",
    "kanagawa-wave",
    "kanagawa-dragon",
    "kanagawa-lotus",
    "nightfox",
    "duskfox",
    "nordfox",
    "terafox",
    "carbonfox",
  },
  livePreview = true, -- Apply theme while browsing. Default to true.
}

S.config = true

S.cmd = "Themery"

return S
