local S = {}

-- function S.init()
-- end

function S.config()
  -- set keymaps
  local keymap = vim.keymap
  keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
  keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Gdiffsplit" })
  keymap.set("n", "<leader>gw", "<cmd>Gread<CR>", { desc = "Gread" })
  keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>", { desc = "Gwrite" })
  keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
  keymap.set("n", "<leader>gl", "<cmd>Gclog<CR>", { desc = "Git log" })
  keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
  keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
  keymap.set("n", "<leader>gB", "<cmd>GBrowse<CR>", { desc = "Open in GitHub" })

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
