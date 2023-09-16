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

local function nvmap(lhs, rhs, opts)
  map({'n', 'v' }, lhs, rhs, opts)
end



-- Disable anti-pattern and/or inconvenient keys
nvmap('<Up>',    '<Nop>')
nvmap('<Down>',  '<Nop>')
nvmap('<Left>',  '<Nop>')
nvmap('<Right>', '<Nop>')
nvmap('<Space>', '<Nop>')

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
nvmap(';', ':', { silent = false, })	--  save a keystroke
-- nvmap(':', '<SOMETHING_USEFUL>', { silent = false, })
-- nmap("<leader>fs", "<cmd>update<cr>", { desc = "save buffer" })
-- nmap("<leader>wq", "<cmd>x<cr>",      { desc = "quit current window" })
-- TODO: add :q command to quit Telescope w/o requiring :q!
