local S = {}

S.lazy = false

-- function S.init()
-- end

function S.config()
  vim.cmd.colorscheme 'onedark'
end

S.priority = 1000

return S
