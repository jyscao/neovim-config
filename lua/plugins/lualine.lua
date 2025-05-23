local S = {}

local function get_tabpagenr()
  local tabpagenr_roman = ({ 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'})[vim.fn.tabpagenr()]   -- TODO: generalize to >10 tabs
  return vim.fn.tabpagenr('$') == 1 and '' or tabpagenr_roman
end

local function get_winnr()
  local hide_winnr_attrs = (
    not vim.bo.modifiable or                      -- not modifiable buffer (e.g. ctrlspace)
    vim.api.nvim_win_get_config(0).relative ~= '' -- floating window (e.g. telescope, peekup)
  )
  local force_show_filetypes = {'help', 'man',}   -- TODO: the 'man' extension overrides our winnr addition, so must extend it
  local show_winnr = (
    vim.fn.winnr('$') ~= 1 and                    -- prerequisite: tab must have more than 1 window
    (not hide_winnr_attrs or require("utils.itertools").list_contains(force_show_filetypes, vim.bo.filetype))
  )
  return show_winnr and vim.fn.winnr() or ''
end

local function get_tab_win_info()
  local t, w = get_tabpagenr(), get_winnr()
  if t ~= '' and w ~= '' then
    return  t .. ':' .. w
  elseif t == '' and w ~= '' then
    return w
  elseif t~= '' and w == '' then
    return t
  else
    return ''
  end
end

local function get_lsp()
  local clients = vim.lsp.get_active_clients()

  if next(clients) == nil then
    return 'None Found'
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

  return #lsp_info > 0 and table.concat(lsp_info, ', ') or 'N/A'
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
    lualine_b = { 'branch', 'diff', 'diagnostics', },
    lualine_c = {
      get_tab_win_info,
      {
        'windows',
        max_length = function() return vim.o.columns / 3 end,   -- this ensures tab-win-info section stays visible even w/ many window segments; the function supports windows resizing
      }
      -- 'filename',  -- TODO: consider adding filename component just for the modification/readonly status
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
    lualine_y = {
      'progress',
      '%l:%c',
      {
        '%L',
        cond = function () return vim.fn.line('$') > vim.fn.winheight(0) end    -- only display total line count if it exceeds the window height
      }
    },
    lualine_z = {
      function () return vim.fn.winheight(0) .. '×' .. vim.fn.winwidth(0) end,  -- display the window dimensions
      {
        'datetime',
        -- style = '', -- TODO: customize display style of 'datetime' component
        cond = function () return vim.fn.environ().TERM_PROGRAM ~= 'tmux' end,  -- only display datetime when not running inside tmux, which already has a time widget
      },
    },
  },
  extensions = {
    'ctrlspace',
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
