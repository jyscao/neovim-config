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
  _("neovim/nvim-lspconfig"),

  _("hrsh7th/nvim-cmp"),    -- Autocompletion

  -- Useful plugin to show you pending keybinds.
  _("folke/which-key.nvim"),

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  _("lewis6991/gitsigns.nvim"),

  _("navarasu/onedark.nvim"),   -- Theme inspired by Atom
  -- _("folke/tokyonight.nvim"),   -- A clean, dark Neovim theme

  _("nvim-lualine/lualine.nvim"),   -- Set lualine as statusline, `:help lualine.txt`

  -- Add indentation guides even on blank lines
  _("lukas-reineke/indent-blankline.nvim"),   -- See `:help indent_blankline.txt`

  -- "gc" to comment visual regions/lines
  _("numToStr/Comment.nvim"),

  -- Fuzzy Finder (files, lsp, etc)
  _("nvim-telescope/telescope.nvim"),

  -- Highlight, edit, and navigate code
  _("nvim-treesitter/nvim-treesitter"),

  -- TODO/FIX: CtrlSpace window's display (status line) is busted
  _("vim-ctrlspace/vim-ctrlspace"),

}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
  },
}

require('lazy').setup(specifications, lazy_opts)
