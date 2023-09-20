-----------------------------------------------------------
--              General Options & Settings               --
-----------------------------------------------------------

-- HINT: `:set!` for non-defaults; `:set! all` for all opts

-- [[ Timings ]]
vim.o.updatetime = 250          -- ?
vim.o.timeoutlen = 300          -- milliseconds to wait for mapped sequence to complete

-- [[ Inputs ]]
vim.o.mouse     = 'nv'          -- enable mouse support only in Normal & Visual modes
vim.o.clipboard = 'unnamedplus' -- sync clipboard between OS & Neovim

-- [[ Appearance ]]
vim.o.termguicolors  = true     -- enable 24-bit RGB color in the terminal
vim.o.showmode       = false    -- omit mode in command line, since status line shows it
vim.o.showtabline    = 0        -- never show the tab line
vim.o.number         = true     -- print line number
vim.o.relativenumber = true     -- show line number relative to cursor; see augroup 'focused_window_group'
vim.o.cursorline     = true     -- highlight line the cursor is on; see augroup 'focused_window_group'
vim.o.colorcolumn    = '100'    -- column to highlight for text alignment; see augroup 'focused_window_group'
vim.o.signcolumn     = 'yes'    -- keep signcolumn by default
vim.o.synmaxcol      = 300      -- disable syntax highlighting after this column
vim.o.wrap           = false    -- do not wrap lines longer than the window width
vim.o.breakindent    = true     -- maintain indentation level when wrapping lines

-- [[ Tabs & Indentation ]]     -- NOTE: this is also managed in part by tpope/vim-sleuth
-- vim.o.tabstop  = 8           -- number of spaces <Tab> counts for; default is 8
vim.o.softtabstop = 4           -- tabstop while editing; negative (w/ vim-sleuth) means shiftwidth value is used
vim.o.shiftwidth  = 4           -- number of spaces to use for indentation (`>>` & `<<`)
vim.o.shiftround  = true        -- round indent to multiple of shiftwidth
vim.o.expandtab   = true        -- use appropriate number of spaces to insert <Tab> in Insert mode, and `>>` & `<<`

-- [[ Display View ]]
vim.o.splitright    = true      -- new window placed to the right of current
vim.o.splitbelow    = true      -- new window placed below the current
vim.o.scrolloff     = 2         -- number of lines to keep on top & bottom when scrolling
vim.o.sidescrolloff = 10        -- number of columns to keep when side scrolling

-- [[ Search ]]
vim.o.ignorecase = true         -- ignore case in search patterns
vim.o.smartcase  = true         -- ignore case UNLESS search query contains upper case or using \C
vim.o.hlsearch   = true         -- highlight all search matches
vim.o.incsearch  = true         -- show incremental matches while searching
vim.o.inccommand = 'split'      -- preview effect of search substitutions

-- [[ Motions % Movements ]]
vim.o.tildeop     = true        -- make ~ behave as an operator, i.e. accepts motions & text-objects
vim.o.startofline = true        -- move the cursor to first non-blank column

-- [[ File Names ]]
vim.o.fileignorecase = true     -- ignore case when using file names & directories
vim.o.wildignorecase = true     -- ignore case when completing file names & directories
vim.o.wildignore     = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**'

-- [[ Completion Menu ]]
vim.o.completeopt = 'menuone,noselect'
vim.o.pumheight   = 15

-- [[ History & Persistence ]]
vim.o.history   = 1000          -- number of commands & searches to remember
vim.o.undofile  = true          -- stores undo history offline in file
-- vim.o.autoread  = true       -- re-read file to get latest state if changed outside of Neovim
vim.o.autowrite = true          -- ?
vim.o.swapfile  = false         -- disable swap file generation
