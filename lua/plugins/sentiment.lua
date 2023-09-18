local S = {}

function S.init()
  -- `matchparen.vim` needs to be disabled manually in case of lazy loading
  vim.g.loaded_matchparen = 1
end

S.opts = {
}

-- function S.config()
-- end

S.version = "*"

S.event = "VeryLazy"

return S
