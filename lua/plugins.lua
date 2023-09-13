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
  -- Git related plugins
  _("tpope/vim-fugitive"),
  _("tpope/vim-rhubarb"),

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies =  require("plugins.nvim-lspconfig").get_deps(),
    config = require("plugins.nvim-lspconfig").config,
    event = { "BufRead", "BufNewFile" },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies =  require("plugins.nvim-cmp").get_deps(),
    config = require("plugins.nvim-cmp").config,
    event = "VeryLazy",
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = require("plugins.which-key").get_opts(),
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = require("plugins.gitsigns").get_opts(),
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = require("plugins.lualine").get_opts(),
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = require("plugins.indent-blankline").get_opts(),
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = require("plugins.Comment").get_opts(),
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = require("plugins.telescope").get_deps(),
    config = require("plugins.telescope").config,
    event = "VeryLazy",
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = require("plugins.nvim-treesitter").get_deps(),
    config = require("plugins.nvim-treesitter").config,
    build = ':TSUpdate',
    event = "VeryLazy",
  },

  {
    "vim-ctrlspace/vim-ctrlspace",
    init = require("plugins.vim-ctrlspace").init,
    config = require("plugins.vim-ctrlspace").config,
    event = "VeryLazy",
    -- keys = "<C-Space>",
  },  -- FIX: CtrlSpace window's display (status line) is busted

}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
