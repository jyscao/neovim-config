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

local function build_resize_cmd(lotr, resize_cmd)
  if lotr.type == "leaf" then
    local rows, cols = unpack(lotr.win_dims)
    resize_cmd = string.format("%s%dresize %d|", resize_cmd, lotr.winnr, rows)
    resize_cmd = string.format("%svert %dresize %d|", resize_cmd, lotr.winnr, cols)
  else
    for _, child in ipairs(lotr.children) do
       resize_cmd = build_resize_cmd(child, resize_cmd)
    end
  end
  return resize_cmd
end

function M.get_resize_cmd(lotr)
  local resize_cmd = build_resize_cmd(lotr, '')
  return resize_cmd .. resize_cmd   -- do this twice to handle some window layouts properly
end

return M
