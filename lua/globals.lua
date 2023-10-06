-----------------------------------------------------------
--               Explicit Global Variables               --
-----------------------------------------------------------

local g = vim.g

-- Set <space> as the leader key; see `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- g.vimsyn_embed = 'l'



-- [[ Disable unnecessary remote plugin providers ]]
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_python_provider = 0
-- NOTE: if need to use plugins written in Python (e.g. "cjrh/vim-conda", "SirVer/ultisnips"), then
-- create conda env, install pynvim, hard-code g.python3_host_prog = /conda/env/python3



-- [[ Disable certain built-in plugins ]]

-- Do not load Netrw; see https://github.com/bling/dotvim/issues/4
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

-- Do not load tohtml.vim
g.loaded_2html_plugin = 1

-- Do not load gzip.vim, tarPlugin.vim & zipPlugin.vim, which are for checking files inside compressed archives
g.loaded_gzip      = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1

-- Do not load the tutor plugin
g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim nor matchparen.vim since we use sentiment.vim
g.loaded_matchit    = 1
g.loaded_matchparen = 1
