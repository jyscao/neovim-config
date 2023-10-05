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
  -- _("NeogitOrg/neogit"),	-- Magit for Neovim
  -- _("sindrets/diffview.nvim"),	  -- Easily cycle through diffs for all modified files

  -- [[ Editing Improvements ]]
  _("AndrewRadev/linediff.vim"),-- Perform diffs on blocks of code
  _("numToStr/Comment.nvim"),	-- Comment plugin that supports treesitter
  _("junegunn/vim-easy-align"),	-- Vim text alignment plugin
  _("utilyre/sentiment.nvim"),	-- Enhanced matchparen.vim
  _("windwp/nvim-autopairs"),	-- Powerful autopair plugin that supports multiple characters
  _("kylechui/nvim-surround"),	-- Add/change/delete surrounding delimiter pairs with ease
  -- _("echasnovski/mini.surround"),	-- Fast and feature-rich surround actions
  _("ntpeters/vim-better-whitespace"),	-- Better whitespace highlighting for Vim

  -- [[ Motion Improvements ]]
  _("ggandor/leap.nvim"),	-- Motion plugin building & improving on vim-sneak
  _("ggandor/flit.nvim"),	-- Enhanced f/t motions for Leap
  _("chrisgrieser/nvim-spider"),-- Move by subwords and skip insignificant punctuation
  -- _("smoka7/hop.nvim"),
  -- _("rlane/pounce.nvim"),

  -- [[ IDE Core ]]
  _("neovim/nvim-lspconfig"),	-- LSP
  _("hrsh7th/nvim-cmp"),   	-- Autocompletion
  _("folke/which-key.nvim"),	-- displays popup of custom keybindings
  _("nvim-telescope/telescope.nvim"),	-- Ultimate Neovim Fuzzy Funder: find, Filter, preview, pick
  _("nvim-treesitter/nvim-treesitter"),		-- Treesitter configurations and abstraction layer

  -- [[ Aesthetics ]]
  _("zaldih/themery.nvim"),		-- Plugin to switch between installed themes (TODO/NOTE: is very broken, create & use own)
  _("navarasu/onedark.nvim"),		-- A theme inspired by Atom
  _("folke/tokyonight.nvim"),		-- A clean, dark Neovim theme
  _("nyoom-engineering/oxocarbon.nvim"),-- A theme inspired by IBM Carbon, written in fennel
  _("rebelot/kanagawa.nvim"),		-- A theme inspired by the famous painting by Katsushika Hokusai
  _("EdenEast/nightfox.nvim"),		-- A highly customizable theme; supports LSP & Treesitter
  _("nvim-lualine/lualine.nvim"),	-- Set lualine as statusline, `:help lualine.txt`
  -- _("nvim-tree/nvim-web-devicons"),

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),	-- Add indentation guides even on blank lines
  _("HiPhish/rainbow-delimiters.nvim"),	-- Rainbow delimiters powered by Tree-sitter

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),	-- Open files & command output in current neovim instance
  -- _("akinsho/toggleterm.nvim"),
  -- _("mrjones2014/smart-splits.nvim"),  -- Directional navigation & resizing of Neovim + tmux splits

  -- [[ Enhancements to Built-ins ]]
  -- _("kevinhwang91/nvim-bqf"),	-- Better quickfix window in Neovim
  -- _("folke/trouble.nvim"),		-- A pretty diagnostics, references, telescope results, quickfix and location list
  _("gennaro-tedesco/nvim-peekup"),	-- Dynamically interact with vim registers

  -- [[ Additional Language Supports ]]
  -- _("cjrh/vim-conda"),		  -- Change conda environments inside Vim
  -- _("elixir-tools/elixir-tools.nvim"), -- Neovim plugin for Elixir

  -- [[ External Integrations ]]
  _("epwalsh/obsidian.nvim"),	-- Complement to the Obsidian application
  -- _("renerocksai/telekasten.nvim"),	-- Telescope-based plugin for working w/ a markdown zettelkasten
  -- _("toppair/peek.nvim"),	-- Markdown preview plugin built using Deno
  _("Saimo/peek.nvim"),		-- TODO: use toppair/peek.nvim once this PR (https://github.com/toppair/peek.nvim/pull/50) merged
  -- _("codota/tabnine-nvim"),	-- NOTE: CPU & memory intensive when running locally
  -- ("vlime/vlime"),		-- Common Lisp dev environment for Vim; also see: "HiPhish/nvim-cmp-vlime"

  -- [[Meta Plugins for Neovim Config & Plugins ]]
  _("tpope/vim-scriptease"),	-- A Vim plugin for Vim plugins
  -- _("tenxsoydev/nx.nvim"),	-- Utility wrapper for more convenience w/ Lua keymaps, highlights, autocommands & options



  -- [[ New Plugins -> to be organized]]
  --
  _('tpope/vim-sleuth'),	-- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),		-- Readline style insertion
  _("tpope/vim-eunuch"),	-- Helpers for UNIX
  -- _("tpope/vim-dadbod"),	-- database client for Vim; also see "kristijanhusak/vim-dadbod-completion"

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
