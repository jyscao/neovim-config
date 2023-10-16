local S = {}

local function set_winnr()
  local hide_winnr = (
      vim.fn.winnr('$') == 1 or                     -- tab only has 1 window
      not vim.bo.modifiable  or                     -- not modifiable buffer (e.g. ctrlspace)
      vim.api.nvim_win_get_config(0).relative ~= "" -- floating window (e.g. telescope)
  )
  local force_show_filetypes = {'help', 'man',}     -- TODO: the 'man' extension overrides our winnr addition, so must extend it
  local show_winnr = (
    not hide_winnr or
    require("utils.itertools").list_contains(force_show_filetypes, vim.bo.filetype)
  )
  return show_winnr and vim.fn.winnr() or ""
end

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
    lualine_c = {set_winnr, 'filename', },
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
