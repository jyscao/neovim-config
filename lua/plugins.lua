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
  _("tpope/vim-fugitive"),                    -- A Git wrapper so awesome, it should be illegal
  _("tpope/vim-rhubarb"),                     -- GitHub extension for vim-fugitive
  _("lewis6991/gitsigns.nvim"),               -- Git integration for buffers

  -- [[ Editing Improvements ]]
  _("AndrewRadev/linediff.vim"),              -- Perform diffs on blocks of code
  _("junegunn/vim-easy-align"),               -- Simple, easy-to-use Vim alignment plugin
  _("nvim-zh/better-escape.vim"),             -- Escaping insert mode without lagging
  _("numToStr/Comment.nvim"),                 -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, and more
  _("utilyre/sentiment.nvim"),                -- Enhanced matchparen.vim plugin for Neovim (archived on Jan 9, 2025)
  _("windwp/nvim-autopairs"),                 -- Powerful autopair plugin that supports multiple characters
  _("kylechui/nvim-surround"),                -- Add/change/delete surrounding delimiter pairs with ease
  _("ntpeters/vim-better-whitespace"),        -- Better whitespace highlighting for Vim

  -- [[ Motion Improvements ]]
  _("ggandor/leap.nvim"),                     -- Motion plugin building & improving on vim-sneak
  _("ggandor/flit.nvim"),                     -- Enhanced f/t motions for Leap
  _("chrisgrieser/nvim-spider"),              -- Move by subwords and skip insignificant punctuation

  -- [[ IDE Core ]]
  _("vim-ctrlspace/vim-ctrlspace"),           -- Workspace Manager: buffers, tabs, files, workspace, bookmarks
  _("neovim/nvim-lspconfig"),                 -- data-only repo, providing basic, default Nvim LSP client configurations for various LSP servers
  _("hrsh7th/nvim-cmp"),                      -- Completion engine using sources that are installed from external repositories
  _("folke/which-key.nvim"),                  -- Helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
  _("nvim-telescope/telescope.nvim"),         -- Ultimate Neovim fuzzy finder: find, filter, preview, pick
  _("nvim-treesitter/nvim-treesitter"),       -- Provides simple & easy way to use the tree-sitter interface, and some basic functionality (e.g. highlighting)

  -- [[ Aesthetics ]]
  _("zaldih/themery.nvim"),                   -- Colorscheme picker with live preview and persistence for neovim
  _("navarasu/onedark.nvim"),                 -- Atom's One Dark and Light theme
  _("folke/tokyonight.nvim"),                 -- VS Code's Tokyo Night theme
  _("nyoom-engineering/oxocarbon.nvim"),      -- Inspired by IBM Carbon (written in fennel)
  _("rebelot/kanagawa.nvim"),                 -- Inspired by the colors from the famous painting of Katsushika Hokusai
  _("EdenEast/nightfox.nvim"),                -- A highly customizable theme; supports LSP, treesitter & variety of plugins
  _("nvim-lualine/lualine.nvim"),             -- A blazing fast and easy to configure neovim statusline plugin written in pure lua

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),   -- Add indentation guides even on blank lines
  _("HiPhish/rainbow-delimiters.nvim"),       -- Rainbow delimiters powered by Tree-sitter
  _("nvim-zh/colorful-winsep.nvim"),          -- Make your nvim window separators colorful

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),                 -- Open files & command output in current neovim instance

  -- [[ Enhancements to Built-ins ]]
  _("jyscao/ventana.nvim"),                   -- Convenient flips & shifts for your windows layout
  _('tpope/vim-sleuth'),                      -- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),                         -- Readline style insertion
  _("tpope/vim-eunuch"),                      -- Helpers for UNIX
  _("stevearc/oil.nvim"),                     -- Neovim file explorer: edit your filesystem like a buffer
  _("gennaro-tedesco/nvim-peekup"),           -- Dynamically interact with vim registers

  -- [[ Added Support for Languages & Development Environments ]]
  _("elixir-tools/elixir-tools.nvim"),        -- Provides NextLS & ElixirLS installation & configuration, and :Mix command
  _("emmanueltouzery/elixir-extras.nvim"),    -- View Elixir docs in telescope & mark multi-clause functions
  _("nvim-flutter/flutter-tools.nvim"),       -- Tools to help create flutter apps in Neovim using the native LSP
  _("wojciech-kulik/xcodebuild.nvim"),        -- Neovim plugin to Build, Debug, and Test applications created for Apple devices

  -- [[ External Tools Integrations ]]
  _("toppair/peek.nvim"),                     -- Markdown preview plugin built using Deno
  _("epwalsh/obsidian.nvim"),                 -- Complement to Obsidian application by writing and navigating Obsidian vaults
  -- _("renerocksai/telekasten.nvim"),           -- Telescope-based plugin for working with a markdown zettelkasten
  _("kndndrj/nvim-dbee"),                     -- Interactive database client for Neovim
  _("rest-nvim/rest.nvim"),                   -- A very fast, powerful, extensible and asynchronous Neovim HTTP client

  -- [[ Meta Plugins for Neovim Config & Plugin Development ]]
  _("tpope/vim-scriptease"),                  -- A Vim plugin for Vim plugins
}

local lazy_opts = {
  ui = {
    border = "rounded",
    title  = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
