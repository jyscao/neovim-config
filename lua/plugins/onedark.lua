local S = {}

-- S.lazy = false

function S.config()
  vim.cmd.colorscheme 'onedark'
end

-- S.priority = 1000
S.event = "VeryLazy"

return S
