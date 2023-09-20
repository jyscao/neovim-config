-----------------------------------------------------------
--            Define basic keymaps for Neovim            --
-----------------------------------------------------------

-- Helpers for defining keymaps
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true, }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local function nxmap(lhs, rhs, opts)
  map({ 'n', 'x' }, lhs, rhs, opts)
end
-- TODO: move above helpers into util related module



-- [[ Disable anti-pattern and/or inconveniences ]]
nxmap('<Up>',    '<Nop>')
nxmap('<Down>',  '<Nop>')
nxmap('<Left>',  '<Nop>')
nxmap('<Right>', '<Nop>')
nxmap('<Space>', '<Nop>')

-- [[ Back to NORMAL ]]
map({ 'i', 'o' }, 'jk', '<Esc>'      )
map( 'c',         'jk', '<C-c>'      )
map( 't',         'jk', '<C-\\><C-n>')

-- [[ Better splits ]]
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')
nmap('<C-w><C-t>', function()
  return ({ col = '<C-w>t<C-w>H', row = '<C-w>t<C-w>K', })[vim.fn.winlayout()[1]]
end, { expr = true,  desc = "Transpose splits" })
-- TODO: add transposes, flips & rotates (<C-w><C-r>) with >2 splits

-- [[ Remap for dealing with word wrap ]]
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- [[ Conveniences ]]
nmap('?', ':noh<CR>')			-- turn off search highlighting (don't need backwards search anyway since forwards search wraps-around)
nxmap(';', ':', { silent = false, })	-- enter Cmdline-mode with ;
-- map({ 'n', 'x', 'o' }, ':', 'gE')       -- NOTE: mapped in config for nvim-spider

-- TODO: add :q command to quit Telescope w/o requiring :q!
--
-- nmap("<C-s>", "<Cmd>update<CR>", { desc = "Save buffer if modified" })
-- nmap("<leader>fs", "<cmd>update<cr>", { desc = "save buffer" })
-- nmap("<leader>wq", "<cmd>x<cr>",      { desc = "quit current window" })
