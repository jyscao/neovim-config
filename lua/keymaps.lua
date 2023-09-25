-----------------------------------------------------------
--            Define basic keymaps for Neovim            --
-----------------------------------------------------------

local keymap = require("utils.keymap")

-- [[ Back to NORMAL ]]
keymap._map({ 'i', 'o' }, 'jk', '<Esc>'      )
keymap._map( 'c',         'jk', '<C-c>'      )
keymap._map( 't',         'jk', '<C-\\><C-n>')

-- [[ Better splits ]]
keymap.n('<C-h>', '<C-w>h')
keymap.n('<C-j>', '<C-w>j')
keymap.n('<C-k>', '<C-w>k')
keymap.n('<C-l>', '<C-w>l')
keymap.n('<C-w><C-t>', function()
  return ({ col = '<C-w>t<C-w>H', row = '<C-w>t<C-w>K', })[vim.fn.winlayout()[1]]
end, { expr = true,  desc = "Transpose splits" })
-- TODO: add transposes, flips & rotates (<C-w><C-r>) with >2 splits

-- [[ Remap for dealing with word wrap ]]
keymap.n('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.n('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- [[ Conveniences ]]
keymap.n('?', ':noh<CR>')			-- turn off search highlighting (don't need backwards search anyway since forwards search wraps-around)
keymap.nx(';', ':', { silent = false, })	-- enter Cmdline-mode with ;
-- map({ 'n', 'x', 'o' }, ':', 'gE')       -- NOTE: mapped in config for nvim-spider

-- TODO: add :q command to quit Telescope w/o requiring :q!
--
-- nmap("<C-s>", "<Cmd>update<CR>", { desc = "Save buffer if modified" })
-- nmap("<leader>fs", "<cmd>update<cr>", { desc = "save buffer" })
-- nmap("<leader>wq", "<cmd>x<cr>",      { desc = "quit current window" })

-- [[ Disable anti-pattern and/or inconveniences ]]
keymap.nx('<Up>',    '<Nop>')
keymap.nx('<Down>',  '<Nop>')
keymap.nx('<Left>',  '<Nop>')
keymap.nx('<Right>', '<Nop>')
keymap.nx('<Space>', '<Nop>')
