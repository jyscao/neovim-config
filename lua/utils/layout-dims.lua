local M = {}

-- local function get_usable_dims()
function M.get_usable_dims()
  local tabline_height = ({
    [0] = 0,
    [1] = vim.fn.tabpagenr('$') > 1 and 1 or 0,                         -- only has tab line if there are 2+ tabs in the session
    [2] = 1,
  })[vim.o.showtabline]

  local statusline_height = ({
    [0] = 0,
    [1] = vim.fn.tabpagewinnr(vim.fn.tabpagenr(), '$') > 1 and 1 or 0,  -- only has status line if there are 2+ windows in the tab
    [2] = 1,
    [3] = 1,
  })[vim.o.laststatus]

  return (vim.o.lines - tabline_height - statusline_height - vim.o.cmdheight), vim.o.columns
end

return M
