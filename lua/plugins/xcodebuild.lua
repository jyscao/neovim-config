local S = {}

-- function S.init()
-- end

S.dependencies = {
  "nvim-telescope/telescope.nvim",
  "MunifTanjim/nui.nvim",
  - "folke/snacks.nvim", -- (optional) to show previews
  "stevearc/oil.nvim", -- (optional) to manage project files
  "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
}

-- S.opts = {
-- }

function S.config()
  require("xcodebuild").setup({
  })
end

S.event = "VeryLazy"

return S
