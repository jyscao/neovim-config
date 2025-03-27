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
    ensure_installed = {
      -- "arduino",
      -- "asm",                  -- generic assembly grammar
      -- "awk",
      "bash",
      -- "beancount",            -- double-entry accounting from text files
      -- "bibtex",               -- process bibliographies for LaTeX or other formats
      -- "blade",                -- template language for PHP Laravel
      -- "c",
      -- "c_sharp",
      -- "cmake",
      -- "comment",              -- comment tags like TODO, FIXME
      -- "commonlisp",
      -- "cpp",
      "css",
      -- "csv",                  -- comma-separated values
      -- "cuda",                 -- Extension to tree-sitter-cpp to support NVIDIA CUDA
      "dart",
      -- "desktop",              -- desktop entry specification (KDE & GNOME)
      -- "dhall",
      "diff",                 -- file diff output
      -- "disassembly",          -- parses disassembly text
      -- "djot",                 -- improved markup language primarily based on commonmark Markdown
      -- "dockerfile",
      -- "dot",                  -- Graphviz DOT (DAG of tomorrow)
      -- "doxygen",              -- documentation generator supporting multiple formats
      -- "ebnf",                 -- Extended Backus–Naur form to express context-free grammar
      -- "editorconfig",         -- maintain consistent coding styles for multiple devs using multiple editors
      -- "eex",
      "elixir",
      -- "erlang",
      -- "fennel",
      -- "fish",
      -- "forth",
      -- "fortran",
      -- "fsharp",
      -- "func",                 -- FunC, language used for development on TON (Telegram's blockchain)
      -- "gdscript",             -- Godot's GDScript
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      -- "gleam",
      -- "glsl",                 -- OpenGL Shading Language
      -- "go",
      -- "gpg",
      -- "graphql",
      -- "haskell",
      -- "hcl",                  -- HashiCorp Configuration Language
      "heex",
      -- "helm",
      -- "hjson",                -- human-readable syntax extension to JSON
      -- "hoon",                 -- Urbit's programming language
      "html",
      -- "htmldjango",           -- Django's template language
      "http",
      -- "hurl",                 -- command line tool powered by libcurl
      "ini",                  -- plain text config files used by PHP, systemd, Windows, etc.
      -- "javascript",
      -- "jq",
      "json",
      -- "json5",                -- extension to JSON aiming to be easier to write and maintain by hand
      -- "jsonc",                -- superset of JSON supporting comments
      -- "jsonnet",              -- extension to JSON with computation & syntax features for configurations
      -- "julia",
      -- "just",                 -- just a command runner, not a build system like GNU Make
      -- "kconfig",              -- configuration language for the Linux kernel
      -- "kotlin",
      -- "latex",
      -- "ledger",               -- CLI double-entry accounting system
      -- "leo",                  -- Rust-based programming language for the Aleo blockchain
      -- "linkerscript",         -- script for working with GNU linker (ld)
      -- "llvm",
      "lua",
      -- "luadoc",               -- Luadoc/LuaCATS (Lua Comment And Type System)
      -- "luap",                 -- Lua patterns (see: https://www.lua.org/pil/20.2.html)
      -- "luau",                 -- language created by Roblox: Lua with a type system
      "make",
      "markdown",
      "markdown_inline",
      -- "mermaid",              -- diagramming &a charting tool rendering Markdown-inspired text definitions
      -- "muttrc",
      "nginx",
      -- "nim",
      -- "nim_format_string",
      -- "nix",
      -- "objc",
      -- "objdump",              -- parses objdump text files
      -- "ocaml",
      -- "ocaml_interface",
      -- "ocamllex",
      "passwd",
      "pem",                  -- Privacy-Enhanced Mail: file format for storing and sending cryptographic keys, certificates
      -- "perl",
      -- "php",
      -- "php_only",
      -- "phpdoc",
      -- "powershell",
      -- "printf",               -- printf formats
      -- "prolog",
      -- "proto",                -- protocol buffer files
      -- "psv",                  -- pipe-separated values
      -- "purescript",
      -- "pymanifest",           -- MANIFEST.in files used in Python packaging
      "python",
      -- "ql",                   -- language & toolchain for code analysis created by GitHub
      -- "query",                -- tree-sitter query files (scheme-like)
      -- "r",
      -- "racket",
      -- "readline",             -- GNU Readline init files
      "regex",
      -- "requirements",         -- Python pip's requirements.txt files
      "robots",               -- robots.txt files
      -- "rst",                  -- reStructuredText
      -- "scala",
      -- "scfg",                 -- Synchronous context-free grammar for use in transfer-based machine translation
      -- "scheme",
      -- "solidity",             -- smart-contract language on the Ethereum and other blockchains
      "sql",
      "ssh_config",
      -- "strace",               -- diagnostic, debugging & instructional userspace utility for Linux
      -- "styled",               -- extension of tree-sitter-css to support styled-components interpolation syntax
      -- "superhtml",            -- HTML Language Server & Templating Language Library
      -- "surface",              -- server-side rendering component library for Phoenix
      -- "swift",
      -- "tact",                 -- smart-contract language for TON (Telegram's blockchain)
      -- "terraform",
      "tmux",
      -- "todotxt",              -- for todo.txt files
      "toml",
      "tsv",                  -- tab-separated values
      -- "typst",                -- markup-based typesetting system aiming to replace LaTeX
      -- "udev",                 -- udev rules files for Linux kernel devices
      -- "v",                    -- the V programming language
      -- "vala",                 -- OOP language that generates C code and uses the GObject system
      "vim",
      "vimdoc",
      -- "vue",
      -- "wgsl",                 -- WebGPU Shading Language
      -- "wit",                  -- WebAssembly Interface Types
      -- "xcompose",             -- X client mappings for multi-key input sequences
      "xml",
      -- "xresources",           -- resource file for the X Window System
      "yaml",
      -- "zathurarc",            -- Zathura document viewer
      -- "zig",
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
      enable = true,
      disable = {'dart'},   -- NOTE: enabling indentation significantly slows down editing in Dart files; see - https://github.com/nvim-flutter/flutter-tools.nvim/issues/267#issuecomment-1616728174
    },
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
end

S.build = ':TSUpdate'
-- S.event = "VeryLazy"
S.event = { "BufReadPost", "BufNewFile" }

return S
