-- [[ Basic Keymaps ]]

-- back to normal
vim.keymap.set({ 'i', 'o' }, 'jk', '<Esc>', { silent = true })   -- Insert, Replace & Operator-pending modes
vim.keymap.set( 'c', 'jk', '<C-c>', { silent = true })    -- Cmdline mode
vim.keymap.set( 't', 'jk', '<C-\\><C-n>', { silent = true })    -- Terminal mode

-- conveniences
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set("n", "<leader>fs", "<cmd>update<cr>", { silent = true, desc = "save buffer" })
vim.keymap.set("n", "<leader>wq", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

-- easier window switching
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
