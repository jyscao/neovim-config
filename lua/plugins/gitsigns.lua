local S = {}

local function _on_attach(bufnr)
  vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

  -- don't override the built-in and fugitive keymaps
  local gs = package.loaded.gitsigns
  vim.keymap.set({'n', 'v'}, ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})

  vim.keymap.set({'n', 'v'}, '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
end

-- function S.init()
-- end

S.opts = {
  -- See `:help gitsigns.txt`
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = _on_attach,
}

-- function S.config()
-- end

S.event = { "BufReadPre", "BufNewFile" }

return S
