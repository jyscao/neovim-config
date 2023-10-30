local S = {}

-- function S.init()
-- end

function S.config()
  local keymap = require("utils.keymap")
  -- set keymaps
  keymap.n("<leader>gs" , "<cmd>topleft Git<CR>"        , { desc = "Git status" })
  keymap.n("<leader>gd" , "<cmd>Gvdiffsplit<CR>"        , { desc = "Gvdiffsplit" })
  keymap.n("<leader>gD" , "<cmd>Ghdiffsplit<CR>"        , { desc = "Ghdiffsplit" })
  keymap.n("<leader>gr" , "<cmd>Gread<CR>"              , { desc = "Gread" })
  keymap.n("<leader>gw" , "<cmd>Gwrite<CR>"             , { desc = "Gwrite" })
  keymap.n("<leader>gc" , "<cmd>topleft Git commit<CR>" , { desc = "Git commit" })
  keymap.n("<leader>gl" , "<cmd>Gclog<CR>"              , { desc = "Git log" })
  keymap.n("<leader>gp" , "<cmd>Git push<CR>"           , { desc = "Git push" })
  keymap.n("<leader>gb" , "<cmd>Git blame<CR>"          , { desc = "Git blame" })
  keymap.n("<leader>gB" , "<cmd>GBrowse<CR>"            , { desc = "Open in GitHub" })
  keymap.n("<leader>gS" , "<cmd>Git stash -k<CR>"       , { desc = "Git stash --keep-index" })

  -- -- convert git to Git in command line mode
  -- vim.fn['utils#Cabbrev']('git', 'Git')

  -- set convenient exit keymap
  vim.api.nvim_create_autocmd('User', {
    callback = function()
      keymap.n('q', '<Cmd>quit<CR>', { buffer = true })
    end,
    group = require("utils.augroup-defs").easy_quit_key_group,
    pattern = {'FugitiveIndex', 'FugitivePager'},
  })
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
