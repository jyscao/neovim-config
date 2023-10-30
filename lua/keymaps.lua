-----------------------------------------------------------
--            Define basic keymaps for Neovim            --
-----------------------------------------------------------

local keymap = require("utils.keymap")

-- [[ Back to NORMAL ]]
keymap._map({ 'i', 'o' }, 'jk', '<Esc>'      )
keymap._map( 'c',         'jk', '<C-c>'      )
keymap._map( 't',         'jk', '<C-\\><C-n>')

-- [[ Better windows ]]
keymap.n('<C-h>', '<C-w>h')
keymap.n('<C-j>', '<C-w>j')
keymap.n('<C-k>', '<C-w>k')
keymap.n('<C-l>', '<C-w>l')

-- [[ Remap for dealing with word wrap ]]
keymap.n('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.n('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- [[ Conveniences ]]
keymap.n(',', ':noh<CR>')			-- turn off search highlighting
-- keymap.n('?', ':noh<CR>')			-- see https://stackoverflow.com/a/1220118/5437918 for uses of backwards search; e.g. `y?bar` copies from the current line to previous line containing "bar"
keymap.nx(';', ':', { silent = false, })	-- enter Cmdline-mode with ;
keymap.nx('QQ', '<Cmd>quitall!<CR>')		-- force exit Neovim
-- map({ 'n', 'x', 'o' }, ':', 'gE')       -- NOTE: mapped in config for nvim-spider

-- [[ Diff copying in VISUAL ]]			-- useful when working w/ fugitive diffs
keymap.x('<leader>dg', ":diffget<CR>")
keymap.x('<leader>dp', ":diffput<CR>")

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
