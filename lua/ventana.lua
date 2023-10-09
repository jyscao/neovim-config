local M = {}

local winlayout = require("utils.winlayout")

local function _swap_split_types(layout)
  if layout.type ~= "leaf" then
    layout.type = ({ col = "row", row = "col", })[layout.type]
    for _, child in ipairs(layout.children) do
      _swap_split_types(child)
    end
  end
end

local function _shift_top_splits(layout)
  if layout.type ~= "leaf" then
    local last_win = table.remove(layout.children)
    table.insert(layout.children, 1, last_win)
  end
end

local function get_winid_by_bufnr(layout, bufnr)
  if layout.type == "leaf" then
    if layout.bufnr == bufnr then
      return layout.winid
    end
  else
    for _, child in ipairs(layout.children) do
      local res = get_winid_by_bufnr(child, bufnr)
      if res then
        return res
      end
    end
  end
end

-- flips the windows along the main diagonal, akin to a matrix transpose
function M.transpose()
  local active_winnr = vim.fn.tabpagewinnr(vim.fn.tabpagenr())

  local layout = winlayout.get()
  _swap_split_types(layout)
  winlayout.set(layout)

  vim.fn.execute(active_winnr .. 'wincmd w')
end

-- shifts the windows in the top level splits
function M.shift()
  local layout = winlayout.get()
  local active_bufnr = vim.fn.winbufnr(0)

  _shift_top_splits(layout)
  winlayout.set(layout)

  layout = winlayout.get()
  local active_winnr = vim.fn.win_id2win(get_winid_by_bufnr(layout, active_bufnr))
  vim.fn.execute(active_winnr .. 'wincmd w')
end

return M
