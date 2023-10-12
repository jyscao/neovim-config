local S = {}

-- function S.init()
-- end

S.dependencies = {
  'hrsh7th/cmp-nvim-lsp',         -- Neovim's builtin LSP-client source
  'hrsh7th/cmp-buffer',           -- buffer words source      -- TODO: config its options
  'hrsh7th/cmp-path',             -- filesystem paths source  -- TODO: consider switching to 'FelipeLema/cmp-async-path'

  'L3MON4D3/LuaSnip',             -- snippet engine for Neovim written in Lua
  'saadparwaiz1/cmp_luasnip',     -- LuaSnip source
  'rafamadriz/friendly-snippets', -- preconfigured snippets for different languages

  -- TODO: add the following & activate on markdown files
  'uga-rosa/cmp-dictionary',      -- language (e.g. English) dictionary source; -- TODO: only load on supported filetypes
  -- 'f3fora/cmp-spell',          -- `spell` source based on Vim's `spellsuggest`
  -- 'max397574/cmp-greek',       -- Greek letters source

  -- TODO: review, evaluate & selectively incorporate; also see: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  -- 'petertriho/cmp-git',        -- git source
  -- 'ray-x/cmp-treesitter',      -- Tree-sitter nodes source
  -- 'andersevenrud/cmp-tmux',    -- tmux source
  -- 'kdheepak/cmp-latex-symbols',-- LaTeX symbol support source
  -- 'Jezda1337/nvim-html-css',   -- HTML & CSS source
  -- 'jcha0713/cmp-tw2css',       -- source to convert Tailwind CSS classes to pure CSS
  -- 'garyhurtz/cmp_bulma.nvim',  -- Bulma CSS source
  -- 'hrsh7th/cmp-cmdline',       -- Neovim cmdline source
  -- 'hrsh7th/cmp-nvim-lua',      -- Neovim Lua API source
  -- 'hrsh7th/cmp-omni',          -- omnifunc source
  -- 'hrsh7th/cmp-calc',          -- math calculations source
  -- 'hrsh7th/cmp-emoji',         -- emojis source
  -- 'hrsh7th/cmp-nvim-lsp-signature-help',  -- source for displaying function signatures
  -- 'hrsh7th/cmp-nvim-lsp-document-symbol', -- source for textDocument/documentSymbol via nvim-lsp
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

  cmp.setup.filetype({'markdown', 'text',}, {
    sources = {
      {
        name = "dictionary",
        keyword_length = 2,
      },
    }
  })

  local dict = require("cmp_dictionary")
  dict.switcher({
    spelllang = {
      -- to generate the EN dictionary: $ aspell --master=en dump master | aspell --lang=en expand > ~/Documents/en-dict.txt
      en = "~/Documents/en-dict.txt",
      -- es = "~/Documents/es-dict.txt",  -- TODO: get Spanish dictionary to work as source
    },
  })

  -- -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })
  --
  -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline({ '/', '?' }, {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })
  --
  -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources(
  --     {
  --       {
  --         name = 'path',
  --         option = {
  --           trailing_slash = true
  --         },
  --       }
  --     },
  --     {
  --       {
  --         name = 'cmdline',
  --         option = {
  --           ignore_cmds = { 'Man', '!' }
  --         }
  --       },
  --
  --   })
  -- })

end

S.event = "InsertEnter"

return S
