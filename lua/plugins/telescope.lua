local S = {}

-- function S.init()
-- end

S.dependencies = {
  'nvim-lua/plenary.nvim',
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}

-- [[ Configure Telescope ]]
function S.config()
  -- See `:help telescope` and `:help telescope.setup()`
  local t_actions = require('telescope.actions')
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = t_actions.move_selection_next,
          ['<C-k>'] = t_actions.move_selection_previous,
          ['<C-h>'] = t_actions.move_to_top,
          ['<C-m>'] = t_actions.move_to_middle,
          ['<C-l>'] = t_actions.move_to_bottom,
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
        n = {
          ['q'] = t_actions.close,   -- see augroup `easy_quit_key_group`; TODO/FIXME: `q` key stops working if leave then return to TelescopePrompt
        },
      },
    },
  }

  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')
  local keymap = require("utils.keymap")

  -- See `:help telescope.builtin`
  keymap.n('<leader>?'       , require('telescope.builtin').oldfiles , { desc = '[?] Find recently opened files' })
  keymap.n('<leader><space>' , require('telescope.builtin').buffers  , { desc = '[ ] Find existing buffers' })
  keymap.n('<leader>/'       , function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend  = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  keymap.n('<leader>gf' , require('telescope.builtin').git_files   , { desc = 'Search [G]it [F]iles' })
  keymap.n('<leader>sf' , require('telescope.builtin').find_files  , { desc = '[S]earch [F]iles' })
  keymap.n('<leader>sh' , require('telescope.builtin').help_tags   , { desc = '[S]earch [H]elp' })
  keymap.n('<leader>sw' , require('telescope.builtin').grep_string , { desc = '[S]earch current [W]ord' })
  keymap.n('<leader>sg' , require('telescope.builtin').live_grep   , { desc = '[S]earch by [G]rep' })
  keymap.n('<leader>sd' , require('telescope.builtin').diagnostics , { desc = '[S]earch [D]iagnostics' })
  keymap.n('<leader>sr' , require('telescope.builtin').resume      , { desc = '[S]earch [R]resume' })
end

S.branch = '0.1.x'
S.event = "VeryLazy"
-- S.cmd = "Telescope"

return S
