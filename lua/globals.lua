-----------------------------------------------------------
--               Explicit Global Variables               --
-----------------------------------------------------------

-- Set <space> as the leader key; see `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.g.vimsyn_embed = 'l'



-- [[ Disable unnecessary remote plugin providers ]]
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
-- vim.g.python3_host_prog = vim.fn.exepath('python3')



-- [[ Disable certain built-in plugins ]]

-- Do not load Netrw; see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load gzip.vim, tarPlugin.vim & zipPlugin.vim, which are for checking files inside compressed archives
vim.g.loaded_gzip      = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim nor matchparen.vim since we use sentiment.vim
vim.g.loaded_matchit    = 1
vim.g.loaded_matchparen = 1
