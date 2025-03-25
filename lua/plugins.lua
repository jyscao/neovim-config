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
  -- _("tenxsoydev/tabs-vs-spaces.nvim"),  -- Hint and fix deviating indentation

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
  _("nvim-treesitter/nvim-treesitter"),	-- Treesitter configurations and abstraction layer

  -- [[ Aesthetics ]]
  _("zaldih/themery.nvim"),		-- Plugin to switch between installed themes (TODO/NOTE: is very broken, create & use own)
  _("navarasu/onedark.nvim"),		-- A theme inspired by Atom
  _("folke/tokyonight.nvim"),		-- A clean, dark Neovim theme
  _("nyoom-engineering/oxocarbon.nvim"),-- A theme inspired by IBM Carbon, written in fennel
  _("rebelot/kanagawa.nvim"),		-- A theme inspired by the famous painting by Katsushika Hokusai
  _("EdenEast/nightfox.nvim"),		-- A highly customizable theme; supports LSP & Treesitter
  _("nvim-lualine/lualine.nvim"),	-- Set lualine as statusline, `:help lualine.txt`
  -- _("nvim-tree/nvim-web-devicons"),	-- Adds file type icons to Neovim plugins; loaded as a dependency for lualine.nvim; only activate if custom config needed/desired

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),	-- Add indentation guides even on blank lines
  _("HiPhish/rainbow-delimiters.nvim"),	-- Rainbow delimiters powered by Tree-sitter
  _("nvim-zh/colorful-winsep.nvim"),	-- Adds colorful window separators

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),	-- Open files & command output in current neovim instance
  -- _("akinsho/toggleterm.nvim"),        -- Persist & toggle multiple terminals during an editing session
  -- _("mrjones2014/smart-splits.nvim"),  -- Directional navigation & resizing of Neovim + tmux splits

  -- [[ Enhancements to Built-ins ]]
  _("stevearc/oil.nvim"),               -- Neovim file explorer: edit your filesystem like a buffer
  -- _("kevinhwang91/nvim-bqf"),	-- Better quickfix window in Neovim
  -- _("folke/trouble.nvim"),		-- A pretty diagnostics, references, telescope results, quickfix and location list
  _("gennaro-tedesco/nvim-peekup"),	-- Dynamically interact with vim registers
  -- _("mrjones2014/smart-splits.nvim"),-- Smart, seamless, directional navigation & resizing of Neovim + tmux
  -- _("kwkarlwang/bufresize.nvim"),	-- Keep split dimensions in proportion when terminal window is resized
  -- _("famiu/bufdelete.nvim"),         -- Delete buffers w/o losing window layout
  -- _("nyngwang/NeoNoName.lua"),	-- Preserves layout on buffer deletion
  -- _("anuvyklack/windows.nvim"),	-- Automatically expand width of the current window, then restores it after
  -- _("sindrets/winshift.nvim"),	-- interactively rearrange windows w/ ease
  -- _("yorickpeterse/nvim-window"),	-- Easily jump b/w windows interactively
  _("jyscao/ventana.nvim"),             -- Convenient flips & shifts for your windows layout

  -- [[ Additional Language Supports ]]
  -- _("cjrh/vim-conda"),		  -- Change conda environments inside Vim
  -- _("elixir-tools/elixir-tools.nvim"), -- Neovim plugin for Elixir
  _("emmanueltouzery/elixir-extras.nvim"),  -- View Elixir docs in Telescope & mark mult-clause functions

  -- [[ External Integrations ]]
  _("toppair/peek.nvim"),               -- Markdown preview plugin built using Deno
  _("nvim-flutter/flutter-tools.nvim"), -- Tools to help create flutter apps in Neovim using the native LSP
  _("wojciech-kulik/xcodebuild.nvim"),  -- Neovim plugin to Build, Debug, and Test applications created for Apple devices
  _("epwalsh/obsidian.nvim"),           -- Complement to the Obsidian application
  -- _("renerocksai/telekasten.nvim"),	-- Telescope-based plugin for working w/ a markdown zettelkasten
  -- TODO: build plugin that creates a new note w/ autogenerated ID following JDS schema & zettelkasten-id-gen & populate w/ templated metadata
  -- _("codota/tabnine-nvim"),	-- NOTE: CPU & memory intensive when running locally
  -- _("vlime/vlime"),		-- Common Lisp dev environment for Vim; also see: "HiPhish/nvim-cmp-vlime"

  -- [[Meta Plugins for Neovim Config & Plugins ]]
  _("tpope/vim-scriptease"),	-- A Vim plugin for Vim plugins
  -- _("tenxsoydev/nx.nvim"),	-- Utility wrapper for more convenience w/ Lua keymaps, highlights, autocommands & options



  -- [[ New Plugins -> to be organized]]
  --
  _('tpope/vim-sleuth'),	-- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),		-- Readline style insertion
  _("tpope/vim-eunuch"),	-- Helpers for UNIX
  -- _("tpope/vim-dadbod"),	-- database client for Vim; also see "kristijanhusak/vim-dadbod-completion"
  -- _("kndndrj/nvim-dbee"),	-- Interactive database client for Neovim
  -- _("kndndrj/nvim-projector"), -- Better project-specific configs for nvim-dap w/ telescope
  -- _("stevearc/dressing.nvim"), -- Improve the default vim.ui interfaces

  _("vim-ctrlspace/vim-ctrlspace"),	-- Workspace Manager: buffers, tabs, files, workspace, bookmarks
}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
