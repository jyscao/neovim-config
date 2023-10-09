local M = {}  -- helper module for window layout management

-- add additional info to leafs
local function gen_layout_tree(winlayout)
  if winlayout[1] == "leaf" then
    local win = winlayout[2]

    local l = {
      type  = winlayout[1],
      bufnr = vim.fn.winbufnr(win),
      winnr = vim.fn.win_id2win(win),
      winid = win,
    }
    return l
  else
    local children = {}
    for _, child in ipairs(winlayout[2]) do
      table.insert(children, gen_layout_tree(child))
    end
    return { type = winlayout[1], children = children }
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
  local winlayout = vim.fn.winlayout()
  return gen_layout_tree(winlayout)
end

local function apply_layout_tree(lotr)
  if lotr.type == "leaf" then
    -- open the previous buffer
    if vim.fn.bufexists(lotr.bufnr) then
      vim.cmd.buffer(lotr.bufnr)
    end
  else
    -- split cols or rows, split n-1 times
    local split_method = ({
      row = "rightbelow vsplit",
      col = "rightbelow split",
    })[lotr.type]
    local wins = { vim.fn.win_getid() }

    for i in ipairs(lotr.children) do
      if i ~= 1 then
        vim.cmd(split_method)
        table.insert(wins, vim.fn.win_getid())
      end
    end

    -- recurse into child windows
    for idx, win in ipairs(wins) do
      vim.fn.win_gotoid(win)
      apply_layout_tree(lotr.children[idx])
    end
  end
end

function M.set(lotr)
  -- make a new window and set it as the only one
  vim.cmd.new()
  vim.cmd.only()
  local tmp_buf = vim.api.nvim_get_current_buf()

  -- apply provided layout-tree
  apply_layout_tree(lotr)

  -- delete temporary buffer
  vim.cmd.bdelete(tmp_buf)
end

return M
