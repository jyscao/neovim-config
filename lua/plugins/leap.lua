local S = {}

S.dependencies = {
  "tpope/vim-repeat",
}

-- function S.init()
-- end

-- S.opts = {
-- }

function S.config()
  require('leap').add_default_mappings()
end

S.event = "VeryLazy"

return S
