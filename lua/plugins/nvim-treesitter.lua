local S = {}

-- function S.init()
-- end

S.dependencies = {
  'nvim-treesitter/nvim-treesitter-textobjects',
}

-- [[ Configure Treesitter ]]
function S.config()
  -- See `:help nvim-treesitter`
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<s-space>',
        node_incremental = '<s-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  vim.keymap.set('n', '<leader>dx', vim.diagnostic.enable, { desc = 'Enable diagnostic' })
  vim.keymap.set('n', '<leader>dX', vim.diagnostic.disable, { desc = 'Disable diagnostics' })

  -- See: https://neovim.discourse.group/t/how-can-i-disable-completely-diagnostics-for-a-specific-buffer/1757
  -- vim.keymap.set('n', '<leader>x', vim.diagnostic.disable, { desc = 'Disable diagnostics' })

  ---- Diagnostic settings
  vim.diagnostic.config {
    virtual_text = true,
    signs = false,
    underline = true,
  }
end

S.build = ':TSUpdate'
-- S.event = "VeryLazy"
S.event = { "BufReadPost", "BufNewFile" }

return S
