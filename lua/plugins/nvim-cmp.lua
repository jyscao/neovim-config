local S = {}

-- function S.init()
-- end

S.dependencies = {
  'hrsh7th/cmp-nvim-lsp',         -- Neovim's builtin LSP-client source
  'hrsh7th/cmp-buffer',           -- buffer words source   -- TODO: config its options
  'hrsh7th/cmp-path',             -- filesystem paths source

  'L3MON4D3/LuaSnip',             -- snippet engine for Neovim written in Lua
  'saadparwaiz1/cmp_luasnip',     -- LuaSnip source
  'rafamadriz/friendly-snippets', -- preconfigured snippets for different languages

  -- Adds a number of user-friendly snippets
  'rafamadriz/friendly-snippets',
}

-- [[ Configure nvim-cmp ]]
function S.config()
  -- See `:help cmp`
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  require('luasnip.loaders.from_vscode').lazy_load()
  luasnip.config.setup {}

  local pumheight_half = math.floor(vim.o.pumheight / 2)

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-c>'] = cmp.mapping.close(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.select_next_item({count = pumheight_half}),
      ['<C-u>'] = cmp.mapping.select_prev_item({count = pumheight_half}),
      -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),   -- use <C-p>
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),    -- use <C-n>
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'luasnip' },
    },
  }

end

S.event = "InsertEnter"

return S
