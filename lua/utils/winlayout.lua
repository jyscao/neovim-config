local M = {}  -- helper module for window layout management

-- add additional info to leafs
local function add_details(layout)
  if layout[1] == "leaf" then
    local win = layout[2]

    local l = {
      type = layout[1],
      winid = win,
      winnr = vim.fn.win_id2win(win),
      bufnr = vim.fn.winbufnr(win),
    }
    return l
  else
    local children = {}
    for _, child in ipairs(layout[2]) do
      table.insert(children, add_details(child))
    end
    return { type = layout[1], children = children }
  end
end

function M.get()
  -- An example of vim.fn.winlayout()'s return structure:
  -- {
  --   "row", {
  --     { "leaf", <winid> },
  --     { "col",
  --       {
  --         { "leaf", <winid> },
  --         { "leaf", <winid> },
  --       }
  --     },
  --   }
  -- }
  local layout = vim.fn.winlayout()

  layout = add_details(layout)
  return layout
end

local function apply_layout(layout)
  if layout.type == "leaf" then
    -- open the previous buffer
    if vim.fn.bufexists(layout.bufnr) then
      vim.cmd.buffer(layout.bufnr)
    end
  else
    -- split cols or rows, split n-1 times
    local split_method = ({
      row = "rightbelow vsplit",
      col = "rightbelow split",
    })[layout.type]
    local wins = { vim.fn.win_getid() }

    for i in ipairs(layout.children) do
      if i ~= 1 then
        vim.cmd(split_method)
        table.insert(wins, vim.fn.win_getid())
      end
    end

    -- recurse into child windows
    for idx, win in ipairs(wins) do
      vim.fn.win_gotoid(win)
      apply_layout(layout.children[idx])
    end
  end
end

function M.set(layout)
  -- make a new window and set it as the only one
  vim.cmd.new()
  vim.cmd.only()
  local tmp_buf = vim.api.nvim_get_current_buf()

  -- apply provided layout
  apply_layout(layout)

  -- delete temporary buffer
  vim.cmd.bdelete(tmp_buf)
end

return M
