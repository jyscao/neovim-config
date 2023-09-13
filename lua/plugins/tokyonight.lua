local S = {}

S.lazy = false

S.opts = {
}

-- function S.init()
-- end

function S.config()
  vim.cmd.colorscheme 'tokyonight'
end

S.priority = 1000

return S
