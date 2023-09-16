-----------------------------------------------------------
-- Define basic keymaps for Neovim
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



-- Disable anti-pattern and/or inconvenient keys
nxmap('<Up>',    '<Nop>')
nxmap('<Down>',  '<Nop>')
nxmap('<Left>',  '<Nop>')
nxmap('<Right>', '<Nop>')
nxmap('<Space>', '<Nop>')

-- Back to Normal mode
map({ 'i', 'o' }, 'jk', '<Esc>'      )
map( 'c',         'jk', '<C-c>'      )
map( 't',         'jk', '<C-\\><C-n>')

-- Better splits navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Conveniences
nxmap(';', ':', { silent = false, })	--  save a keystroke
-- nxmap(':', '<SOMETHING_USEFUL>', { silent = false, })
-- nmap("<leader>fs", "<cmd>update<cr>", { desc = "save buffer" })
-- nmap("<leader>wq", "<cmd>x<cr>",      { desc = "quit current window" })
-- TODO: add :q command to quit Telescope w/o requiring :q!
