local M = {}

local layout_tree = require("utils.layout-tree")

local function _swap_split_types(lotr)
  if lotr.type ~= "leaf" then
    lotr.type = ({ col = "row", row = "col", })[lotr.type]
    for _, child in ipairs(lotr.children) do
      _swap_split_types(child)
    end
  end
end

-- flips the windows along the main diagonal, akin to a matrix transpose
function M.transpose()
  local active_winnr = vim.fn.tabpagewinnr(vim.fn.tabpagenr())

  local lotr = layout_tree.get()
  _swap_split_types(lotr)
  layout_tree.set(lotr)

  vim.fn.execute(active_winnr .. 'wincmd w')
end

local function _shift_top_splits(lotr)
  if lotr.type ~= "leaf" then
    local last_win = table.remove(lotr.children)
    table.insert(lotr.children, 1, last_win)
  end
end

local function get_win_by_bufnr(lotr, bufnr)
  if lotr.type == "leaf" then
    if lotr.bufnr == bufnr then
      return lotr.winid, lotr.winnr
    end
  else
    for _, child in ipairs(lotr.children) do
      local winid, winnr = get_win_by_bufnr(child, bufnr)
      if winid and winnr then
        return winid, winnr
      end
    end
  end
end

-- shifts the windows in the top level splits
function M.shift()
  local lotr = layout_tree.get()
  local active_bufnr = vim.fn.winbufnr(0)

  _shift_top_splits(lotr)
  layout_tree.set(lotr)
  -- require("utils.itertools").print_tbl(lotr)

  lotr = layout_tree.get()  -- get layout-tree again w/ updated winnr
  local _, winnr = get_win_by_bufnr(lotr, active_bufnr)
  vim.fn.execute(winnr .. 'wincmd w')
end

return M
