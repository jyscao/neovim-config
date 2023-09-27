-- Set custom name to the list
require("themery").setup({
  themes = {
    {
      -- name = "One Dark",
      name = "OneDark",
      colorscheme = "onedark",
    },
    {
      name = "TokyoNight",
      colorscheme = "tokyonight",
    },
    {
      name = "Oxocarbon",
      colorscheme = "oxocarbon",
      -- before = [[
      --   vim.opt.background = "light"
      -- ]],
      -- after = [[
      --   -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      --   -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- ]],
    },
  },
})
