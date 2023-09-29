local S = {}

-- S.lazy = false

S.opts = {
}

-- function S.init()
-- end

function S.config()
  vim.opt.background = 'dark'
  vim.cmd.colorscheme 'oxocarbon'
  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

-- S.priority = 1000
S.event = "VeryLazy"

return S
