-----------------------------------------------------------
--              General Options & Settings               --
-----------------------------------------------------------

-- HINT: `:set!` for non-defaults; `:set! all` for all opts

local o = vim.opt

-- [[ Timings ]]
o.updatetime = 250          -- ?
o.timeoutlen = 300          -- milliseconds to wait for mapped sequence to complete

-- [[ Inputs ]]
o.mouse     = 'nv'          -- enable mouse support only in Normal & Visual modes
o.clipboard = 'unnamedplus' -- sync clipboard between OS & Neovim

-- [[ Appearance ]]
o.termguicolors  = true     -- enable 24-bit RGB color in the terminal
o.showmode       = false    -- omit mode in command line, since status line shows it
o.showtabline    = 0        -- never show the tab line
o.number         = true     -- print line number
o.relativenumber = true     -- show line number relative to cursor; see augroup 'focused_window_group'
o.cursorline     = true     -- highlight line the cursor is on; see augroup 'focused_window_group'
o.colorcolumn    = '100'    -- column to highlight for text alignment; see augroup 'focused_window_group'
o.signcolumn     = 'yes'    -- keep signcolumn by default
o.synmaxcol      = 300      -- disable syntax highlighting after this column
o.wrap           = false    -- do not wrap lines longer than the window width
o.breakindent    = true     -- maintain indentation level when wrapping lines
o.laststatus     = 3        -- use a global statusline at the bottom instead of one for each window
-- o.shortmess      = ''    -- list of flags to tweak short messages (interactive & status-line); default: 'filnxtToOCF'

-- [[ Editing ]]
-- o.formatoptions = ""     -- opts that influence how Vim formats text; TODO: review & set
-- NOTE: currently see 2 common sets: 'jcroql' (e.g. lua, vim) & 'tcqj' (e.g. python, tmux, elixir); check "folke/neodev.nvim"
-- `:set formatoptions+=mM` for CJK support, see: https://stackoverflow.com/q/32669814/6064933

-- [[ Tabs & Indentation ]] -- NOTE: this is also managed in part by tpope/vim-sleuth
-- o.tabstop  = 8           -- number of spaces <Tab> counts for; default is 8
o.softtabstop = 4           -- tabstop while editing; negative (w/ vim-sleuth) means shiftwidth value is used
o.shiftwidth  = 4           -- number of spaces to use for indentation (`>>` & `<<`)
o.shiftround  = true        -- round indent to multiple of shiftwidth
o.expandtab   = true        -- use appropriate number of spaces to insert <Tab> in Insert mode, and `>>` & `<<`

-- [[ Display View ]]
o.splitright    = true      -- new window placed to the right of current
o.splitbelow    = true      -- new window placed below the current
o.scrolloff     = 2         -- number of lines to keep on top & bottom when scrolling
o.sidescrolloff = 10        -- number of columns to keep when side scrolling

-- [[ Command & Search ]]
o.ignorecase   = true       -- ignore case in search patterns
o.smartcase    = true       -- ignore case UNLESS search query contains upper case or using \C
o.hlsearch     = true       -- highlight all search matches
o.incsearch    = true       -- show incremental matches while searching
o.inccommand   = 'split'    -- preview effect of search substitutions
o.cmdwinheight = 5          -- number of lines to use for command-line window {q:, q/, etc.}

-- [[ Motions & Movements ]]
o.tildeop     = true        -- make ~ behave as an operator, i.e. accepts motions & text-objects
o.startofline = true        -- move the cursor to first non-blank column for navigation commands
o.jumpoptions = "stack"     -- ?; stack preserves relative location of entries when navigating backwards

-- [[ File Names ]]
o.fileignorecase = true     -- ignore case when using file names & directories
o.wildignorecase = true     -- ignore case when completing file names & directories
o.wildignore     = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**'

-- [[ Diff Mode ]]
-- o.diffexpr = ''          -- expression that's evaluated to obtain diff file
o.diffopt:append({'linematch:60', 'algorithm:patience'})  -- additional opts for diff mode

-- [[ Completion ]]
o.completeopt = 'menuone,preview,noinsert,noselect'       -- list of ins-mode completion opts
o.infercase   = true        -- matches user-inputted case for ins-mode completions
o.pumheight   = 15          -- max number of items to show in popup-menu
o.pumblend    = 0           -- transparency % for popup-menu; 0 is disabled

-- [[ History & Persistence ]]
o.history   = 1000          -- number of commands & searches to remember
o.undofile  = true          -- stores undo history offline in file
-- o.autoread  = true       -- re-read file to get latest state if changed outside of Neovim
o.autowrite = true          -- ?
o.swapfile  = false         -- disable swap file generation
-- o.sessionoptions = ""    -- affects what properties are saved & restored w/ :mksession (used by vim-ctrlspace)
-- o.viewoptions    = ""    -- affects what properties are saved & restored w/ :mkview
