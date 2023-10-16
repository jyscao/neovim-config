local S = {}

S.dependencies = {
  { 'nvim-tree/nvim-web-devicons', opt = true },
}

S.opts = {
  icons_enabled = true,
  theme = 'auto',
  -- theme = 'onedark',
  -- theme = 'tokyonight',
  -- component_separators = '|',    -- default separators:  
  -- section_separators = '',       -- default separators:  
  sections = {
    lualine_c = {
      function()
        -- TODO: exclude floating windows (e.g. telescope, themery) & management windows (e.g. ctrlspace)
        return vim.fn.winnr('$') == 1 and "" or vim.fn.winnr()
        -- return #vim.api.nvim_tabpage_list_wins(0) == 1 and "" or vim.fn.winnr()
      end,
      'filename',
    },
  },
  extensions = {
    'fugitive',
    -- 'fzf',
    'lazy',
    'man',
    -- 'mundo',
    'quickfix',
    -- 'trouble',
  },
}

S.event = "VeryLazy"

return S
