local S = {}

local function get_winnr()
  local hide_winnr_attrs = (
    not vim.bo.modifiable or                      -- not modifiable buffer (e.g. ctrlspace)
    vim.api.nvim_win_get_config(0).relative ~= "" -- floating window (e.g. telescope, peekup)
  )
  local force_show_filetypes = {'help', 'man',}   -- TODO: the 'man' extension overrides our winnr addition, so must extend it
  local show_winnr = (
    vim.fn.winnr('$') ~= 1 and                    -- prerequisite: tab must have more than 1 window
    (not hide_winnr_attrs or require("utils.itertools").list_contains(force_show_filetypes, vim.bo.filetype))
  )
  return show_winnr and vim.fn.winnr() or ""
end

local function get_lsp()
  local clients = vim.lsp.get_active_clients()

  if next(clients) == nil then
    return "None Found"
  end

  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local lsp_info = {}
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      table.insert(lsp_info, client.name)
    end
  end
  table.sort(lsp_info)

  return #lsp_info > 0 and table.concat(lsp_info, ', ') or "N/A"
end

local ctrlspace_info = {
  sections = {
    lualine_b = {
      function() return vim.fn['ctrlspace#context#Configuration']().Symbols.CS end,
    },
    lualine_c = {'ctrlspace#api#StatuslineModeSegment',},
    lualine_y = {'ctrlspace#api#StatuslineTabSegment'},
  },
  filetypes = {'ctrlspace'},
}

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
      get_winnr,
      'windows',
    },
    lualine_x = {
      {
        get_lsp,
        icon = ' LSP:',
        -- color = { fg = '#ffffff', gui = 'bold', },    -- TODO: set fg-color based on colorscheme dark vs light
      },
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = { 'progress', '%l:%c', '%L', },
    lualine_z = {
      function () return vim.o.lines .. '×' .. vim.o.columns end,
      vim.fn.environ().TERM_PROGRAM == 'tmux' and '' or 'datetime', -- TODO: customize display style of 'datetime' component
    },
  },
  extensions = {
    ctrlspace_info,
    'fugitive',
    -- 'fzf',
    'lazy',
    'man',
    'mason',
    -- 'mundo',
    'quickfix',
    -- 'trouble',
  },
}

S.event = "VeryLazy"

return S
