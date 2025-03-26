local S = {}

local function lexical_setup()
  local lspconfig = require("lspconfig")
  lspconfig.lexical.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/lexical/lexical" },
    root_dir = function(fname)
      return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
    end,
    filetypes = { "elixir", "eelixir", "heex" },
    settings = {}   -- optional settings
  }
end

-- function S.init()
-- end

S.dependencies = {
  -- Automatically install LSPs to stdpath for neovim
  { 'williamboman/mason.nvim', config = true },       -- Package manager for Neovim to easily install and manage LSP servers, DAP servers, linters & formatters
  'williamboman/mason-lspconfig.nvim',                -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim

  { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- Useful status updates for LSP
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

  'folke/neodev.nvim',                                -- Additional lua configuration, makes nvim stuff amazing!
}

-- function S.init()
-- end

-- [[ Configure LSP ]]
function S.config()
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- TODO: set keymaps using require("utils.keymap")
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-S-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  --
  --  If you want to override the default filetypes that your language server will attach to you can
  --  define the property 'filetypes' to the map in question.
  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },

    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },


    -- TODO: language servers/formatters/linters to review:
    --
    -- Elixir:
    -- * elixir-lang/expert
    --
    -- Dart:
    -- * serverpod/lsp_server
    -- * dcm (from dcm.dev)
    --
    -- Nix:
    -- * oxalica/nil
    -- * nix-community/nixd
    -- * NixOS/nixfmt
    -- * kamadorueda/alejandra
    --
    -- VimScript:
    -- * prabirshrestha/vim-lsp
    -- * Vimjas/vint
    --
    -- ## additional servers in Mason's registry ##
    -- review LS for existings: C#, Lua, PHP, Python
    -- programming: AWK, C/C++, F#, Fennel, Erlang, Hoon, Julia, Powershell, R, SQL, Zig
    -- markups: Markdown, CSS, HTML, HTMX, Jinja, LaTeX
    -- config & data: HCL/Terraform, JSON, Nginx, Protobuf, systemd, TOML, XML, YAML
  }

  -- Setup neovim lua configuration
  require('neodev').setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end
  }

  -- TODO: figure out how to config & setup automatically
  lexical_setup()   -- manually setup Lexical LS w/o Mason


  -- TODO: simplify LSP servers configurations & setups by reviewing best practices mentioned in:
  -- * neovim/nvim-lspconfig
  -- * williamboman/mason.nvim
  -- * williamboman/mason-lspconfig.nvim
end

S.event = { "BufRead", "BufNewFile" }

return S
