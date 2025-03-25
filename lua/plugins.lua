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
  -- _("NeogitOrg/neogit"),                      -- An interactive and powerful Git interface for Neovim, inspired by Magit
  -- _("sindrets/diffview.nvim"),                -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev

  -- [[ Editing Improvements ]]
  _("AndrewRadev/linediff.vim"),              -- Perform diffs on blocks of code
  _("junegunn/vim-easy-align"),               -- Simple, easy-to-use Vim alignment plugin
  _("numToStr/Comment.nvim"),                 -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, and more
  _("utilyre/sentiment.nvim"),                -- Enhanced matchparen.vim plugin for Neovim (archived on Jan 9, 2025)
  _("windwp/nvim-autopairs"),                 -- Powerful autopair plugin that supports multiple characters
  _("kylechui/nvim-surround"),                -- Add/change/delete surrounding delimiter pairs with ease
  -- _("echasnovski/mini.surround"),             -- Fast and feature-rich surround actions
  _("ntpeters/vim-better-whitespace"),        -- Better whitespace highlighting for Vim
  -- _("tenxsoydev/tabs-vs-spaces.nvim"),        -- Hint and fix deviating indentation

  -- [[ Motion Improvements ]]
  _("ggandor/leap.nvim"),                     -- Motion plugin building & improving on vim-sneak
  _("ggandor/flit.nvim"),                     -- Enhanced f/t motions for Leap
  _("chrisgrieser/nvim-spider"),              -- Move by subwords and skip insignificant punctuation
  -- _("smoka7/hop.nvim"),                       -- EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible
  -- _("rlane/pounce.nvim"),                     -- Incremental fuzzy search motion plugin for Neovim

  -- [[ IDE Core ]]
  _("vim-ctrlspace/vim-ctrlspace"),           -- Workspace Manager: buffers, tabs, files, workspace, bookmarks
  _("neovim/nvim-lspconfig"),                 -- data-only repo, providing basic, default Nvim LSP client configurations for various LSP servers
  _("hrsh7th/nvim-cmp"),                      -- Completion engine using sources that are installed from external repositories
  _("folke/which-key.nvim"),                  -- Helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
  _("nvim-telescope/telescope.nvim"),         -- Ultimate Neovim fuzzy finder: find, filter, preview, pick
  _("nvim-treesitter/nvim-treesitter"),       -- Provides simple & easy way to use the tree-sitter interface, and some basic functionality (e.g. highlighting)

  -- [[ AI/LLM Assistance ]]

  -- [[ Aesthetics ]]
  _("zaldih/themery.nvim"),                   -- Colorscheme picker with live preview and persistence for neovim
  _("navarasu/onedark.nvim"),                 -- Atom's One Dark and Light theme
  _("folke/tokyonight.nvim"),                 -- VS Code's Tokyo Night theme
  _("nyoom-engineering/oxocarbon.nvim"),      -- Inspired by IBM Carbon (written in fennel)
  _("rebelot/kanagawa.nvim"),                 -- Inspired by the colors from the famous painting of Katsushika Hokusai
  _("EdenEast/nightfox.nvim"),                -- A highly customizable theme; supports LSP, treesitter & variety of plugins
  _("nvim-lualine/lualine.nvim"),             -- A blazing fast and easy to configure neovim statusline plugin written in pure lua
  -- _("nvim-tree/nvim-web-devicons"),           -- Provides Nerd Font icons (glyphs) for use by neovim plugins

  -- [[ UI Improvements ]]
  _("lukas-reineke/indent-blankline.nvim"),   -- Add indentation guides even on blank lines
  _("HiPhish/rainbow-delimiters.nvim"),       -- Rainbow delimiters powered by Tree-sitter
  _("nvim-zh/colorful-winsep.nvim"),          -- Make your nvim window separators colorful

  -- [[ Terminal Integrations ]]
  _("willothy/flatten.nvim"),                 -- Open files & command output in current neovim instance
  -- _("akinsho/toggleterm.nvim"),               -- Persist & toggle multiple terminals during an editing session
  -- _("mrjones2014/smart-splits.nvim"),         -- Directional navigation & resizing of Neovim + tmux splits

  -- [[ Enhancements to Built-ins ]]
  _("jyscao/ventana.nvim"),                   -- Convenient flips & shifts for your windows layout
  _('tpope/vim-sleuth'),                      -- Automatically adjusts 'shiftwidth' & 'expandtab' based on heuristics
  _("tpope/vim-rsi"),                         -- Readline style insertion
  _("tpope/vim-eunuch"),                      -- Helpers for UNIX
  _("stevearc/oil.nvim"),                     -- Neovim file explorer: edit your filesystem like a buffer
  _("gennaro-tedesco/nvim-peekup"),           -- Dynamically interact with vim registers
  -- _("kevinhwang91/nvim-bqf"),                 -- Better quickfix window in Neovim
  -- _("folke/trouble.nvim"),                    -- A pretty diagnostics, references, telescope results, quickfix and location list
  -- _("kwkarlwang/bufresize.nvim"),             -- Keep split dimensions in proportion when terminal window is resized
  -- _("famiu/bufdelete.nvim"),                  -- Delete buffers w/o losing window layout (archived on Feb 17, 2025)
  -- _("nyngwang/NeoNoName.lua"),                -- Preserves layout on buffer deletion
  -- _("anuvyklack/windows.nvim"),               -- Automatically expand width of the current window, then restores it after
  -- _("sindrets/winshift.nvim"),                -- Rearrange your windows with ease
  -- _("yorickpeterse/nvim-window"),             -- Easily jump between windows interactively

  -- [[ Added Support for Languages & Development Environments ]]
  _("elixir-tools/elixir-tools.nvim"),        -- Provides NextLS & ElixirLS installation & configuration, and :Mix command
  _("emmanueltouzery/elixir-extras.nvim"),    -- View Elixir docs in telescope & mark multi-clause functions
  _("nvim-flutter/flutter-tools.nvim"),       -- Tools to help create flutter apps in Neovim using the native LSP
  _("wojciech-kulik/xcodebuild.nvim"),        -- Neovim plugin to Build, Debug, and Test applications created for Apple devices
  -- _("cjrh/vim-conda"),                        -- Change conda environments inside Vim (deprecated; use ubaldot/vim-conda-activate instead)
  -- _("ubaldot/vim-conda-activate"),            -- Activate Conda environments in Vim
  -- _("vlime/vlime"),                           -- Common Lisp dev environment for Vim and Neovim; NOTE: also see "HiPhish/nvim-cmp-vlime"

  -- [[ External Integrations ]]
  _("toppair/peek.nvim"),                     -- Markdown preview plugin built using Deno
  _("epwalsh/obsidian.nvim"),                 -- Complement to Obsidian application by writing and navigating Obsidian vaults
  -- _("renerocksai/telekasten.nvim"),           -- Telescope-based plugin for working with a markdown zettelkasten

  -- [[Meta Plugins for Neovim Config & Plugins ]]
  _("tpope/vim-scriptease"),                  -- A Vim plugin for Vim plugins
  -- _("b0o/mapx.nvim"),                         -- A better way to create key mappings in Neovim (archived on Jun 5, 2024)
  -- _("tenxsoydev/nx.nvim"),                    -- Utility wrapper for more convenience w/ Lua keymaps, highlights, autocommands & options



  -- [[ New Plugins -> to be organized]]
  --
  -- _("tpope/vim-projectionist"),   -- Provides granular project configuration using "projections"
  -- _("kndndrj/nvim-projector"),    -- Better project-specific configs for nvim-dap w/ telescope
  -- _("folke/snacks.nvim"),         -- A collection of QoL plugins for Neovim
  -- _("stevearc/dressing.nvim"),    -- Improve the default vim.ui interfaces (archived on Feb 12, 2025)
}

local lazy_opts = {
  ui = {
    border = "rounded",
    title  = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
