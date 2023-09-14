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

local _ = require("utils").get_plugin_spec_table

local specifications = {
  -- [[ Git Integrations ]]
  _("tpope/vim-fugitive"),	-- Git wrapper
  _("tpope/vim-rhubarb"),	-- GitHub extension for vim-fugitive
  _("lewis6991/gitsigns.nvim"),	-- Super fast git decorations in the sign-column

  -- [[ Editing Improvements ]]
  _("AndrewRadev/linediff.vim"),-- Perform diffs on blocks of code
  _("numToStr/Comment.nvim"),	-- Comment plugin that supports treesitter

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

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),	-- Add indentation guides even on blank lines

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),	-- Open files & command output in current neovim instance



  -- [[ New Plugins -> to be organized]]
  --
  -- 'tpope/vim-sleuth',	-- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),		-- Readline style insertion
  _("tpope/vim-eunuch"),	-- Helpers for UNIX
  _("tpope/vim-scriptease"),	-- A Vim plugin for Vim plugins

  -- TODO/FIX: CtrlSpace window's display (status line) is busted
  _("vim-ctrlspace/vim-ctrlspace"),	-- Workspace Manager: buffers, tabs, files, workspace, bookmarks
}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
