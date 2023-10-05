local S = {}

-- function S.init()
-- end

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n("<leader>gs" , "<cmd>Git<CR>"         , { desc = "Git status" })
  keymap.n("<leader>gd" , "<cmd>Gvdiffsplit<CR>" , { desc = "Gvdiffsplit" })
  keymap.n("<leader>gD" , "<cmd>Ghdiffsplit<CR>" , { desc = "Ghdiffsplit" })
  keymap.n("<leader>gr" , "<cmd>Gread<CR>"       , { desc = "Gread" })
  keymap.n("<leader>gw" , "<cmd>Gwrite<CR>"      , { desc = "Gwrite" })
  keymap.n("<leader>gc" , "<cmd>Git commit<CR>"  , { desc = "Git commit" })
  keymap.n("<leader>gl" , "<cmd>Gclog<CR>"       , { desc = "Git log" })
  keymap.n("<leader>gp" , "<cmd>Git push<CR>"    , { desc = "Git push" })
  keymap.n("<leader>gb" , "<cmd>Git blame<CR>"   , { desc = "Git blame" })
  keymap.n("<leader>gB" , "<cmd>GBrowse<CR>"     , { desc = "Open in GitHub" })

  -- -- convert git to Git in command line mode
  -- vim.fn['utils#Cabbrev']('git', 'Git')
end

-- local wk = require("which-key")
-- wk.register(
--   {
--     g = {
--       name = "Git",
--       s = {"<cmd>Git<CR>", "Git status"}
--     }
--   }, {}
-- )

S.cmd = "Git"
-- S.event = "VeryLazy"
S.keys = "<leader>g"

return S
