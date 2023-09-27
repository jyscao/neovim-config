-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local _ = require("utils.plugtools").get_plugin_spec_table

local specifications = {

  -- [[ Git Integrations ]]
  _("tpope/vim-fugitive"),	-- Git wrapper
  _("tpope/vim-rhubarb"),	-- GitHub extension for vim-fugitive
  _("lewis6991/gitsigns.nvim"),	-- Super fast git decorations in the sign-column
  -- _("NeogitOrg/neogit"),

  -- [[ Editing Improvements ]]
  _("AndrewRadev/linediff.vim"),-- Perform diffs on blocks of code
  _("numToStr/Comment.nvim"),	-- Comment plugin that supports treesitter
  _("junegunn/vim-easy-align"),	-- Vim text alignment plugin
  _("kylechui/nvim-surround"),	-- Add/change/delete surrounding delimiter pairs with ease
  -- _("echasnovski/mini.surround"),	-- Fast and feature-rich surround actions
  _("utilyre/sentiment.nvim"),	-- Enhanced matchparen.vim
  _("windwp/nvim-autopairs"),	-- Powerful autopair plugin that supports multiple characters

  -- [[ Motion Improvements ]]
  _("ggandor/leap.nvim"),	-- Motion plugin building & improving on vim-sneak
  _("ggandor/flit.nvim"),	-- Enhanced f/t motions for Leap
  -- _("smoka7/hop.nvim"),
  -- _("rlane/pounce.nvim"),
  _("chrisgrieser/nvim-spider"),	-- Move by subwords and skip insignificant punctuation

  -- [[ IDE Core ]]
  _("neovim/nvim-lspconfig"),	-- LSP
  _("hrsh7th/nvim-cmp"),   	-- Autocompletion
  _("folke/which-key.nvim"),	-- displays popup of custom keybindings
  _("nvim-telescope/telescope.nvim"),	-- Ultimate Neovim Fuzzy Funder: find, Filter, preview, pick
  _("nvim-treesitter/nvim-treesitter"),		-- Treesitter configurations and abstraction layer

  -- [[ Aesthetics ]]
  _("navarasu/onedark.nvim"),		-- Theme inspired by Atom
  -- _("folke/tokyonight.nvim"),	-- A clean, dark Neovim theme
  -- _("catppuccin/nvim"),		-- Soothing pastel theme for (Neo)vim
  _("nvim-lualine/lualine.nvim"),	-- Set lualine as statusline, `:help lualine.txt`
  -- _("nvim-tree/nvim-web-devicons"),

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),	-- Add indentation guides even on blank lines
  -- _("karb94/neoscroll.nvim"),
  _("HiPhish/rainbow-delimiters.nvim"),	-- Rainbow delimiters powered by Tree-sitter

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),	-- Open files & command output in current neovim instance
  -- _("akinsho/toggleterm.nvim"),

  -- [[ Register Improvements ]]
  _("gennaro-tedesco/nvim-peekup"),	-- Dynamically interact with vim registers

  -- [[ External Integrations ]]
  _("epwalsh/obsidian.nvim"),	-- Complement to the Obsidian application
  -- [[Meta Plugins for Neovim Config & Plugins ]]
  _("tpope/vim-scriptease"),	-- A Vim plugin for Vim plugins
  -- _("tenxsoydev/nx.nvim"),	-- Utility wrapper for more convenience w/ Lua keymaps, highlights, autocommands & options



  -- [[ New Plugins -> to be organized]]
  --
  _('tpope/vim-sleuth'),	-- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),		-- Readline style insertion
  _("tpope/vim-eunuch"),	-- Helpers for UNIX

  -- TODO/FIX: CtrlSpace window's display (status line) is busted
  _("vim-ctrlspace/vim-ctrlspace"),	-- Workspace Manager: buffers, tabs, files, workspace, bookmarks

  -- _("kevinhwang91/nvim-bqf"),	-- Better quickfix window in Neovim
  -- _("folke/trouble.nvim"),
}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
