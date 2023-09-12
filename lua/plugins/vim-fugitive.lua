local S = {}

-- function S.init()
-- end

function S.config()
  -- set keymaps
  local keymap = vim.keymap
  keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
  keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
  keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git add" })
  -- keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
  keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
  keymap.set("n", "<leader>gl", "<cmd>Gclog<cr>", { desc = "Git log --oneline" })
  -- keymap.set("n", "<leader>gpl", "<cmd>Git pull<cr>", { desc = "Git pull" })
  keymap.set("n", "<leader>gp", "<cmd>15 split|term git push<cr>", { desc = "Git push" })

  -- -- convert git to Git in command line mode
  -- vim.fn['utils#Cabbrev']('git', 'Git')
end

-- local wk = require("which-key")
-- wk.register(
--   {
--     g = {
--       name = "Git",
--       s = {"<cmd>Git<cr>", "Git status"}
--     }
--   }, {}
-- )

return S
