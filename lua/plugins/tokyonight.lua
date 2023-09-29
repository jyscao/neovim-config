local S = {}

-- S.lazy = false

S.opts = {
}

function S.config()
  vim.cmd.colorscheme 'tokyonight'
end

-- S.priority = 1000
S.event = "VeryLazy"

return S
