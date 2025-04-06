-- Enable file type detection and indentation settings
vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Set terminal color support
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- General settings
vim.opt.number = true -- Display line numbers
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.incsearch = true -- Incrementally search
vim.opt.hlsearch = true -- Highlight all occurrences in search
vim.opt.showmatch = true -- Highlight matching parentheses
vim.opt.wildmenu = true -- Improved command navigation
vim.opt.confirm = true -- Prompt for confirmation before exiting without saving
vim.opt.mouse = "a" -- Enable mouse usage
vim.opt.mousemoveevent = true -- Enable mouse events
vim.opt.virtualedit = "onemore" -- Allow moving the cursor one space beyond the end of the line
vim.opt.title = true -- Show window title
vim.opt.timeoutlen = 500

-- Clipboard and backup
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.backup = false -- Do not create backup files
vim.opt.writebackup = false -- Do not create temporary backups

-- Cursor and text appearance
vim.opt.cursorline = true -- Highlight the current line
vim.opt.linebreak = true -- Line break without cutting words

-- Smart searches
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.smartcase = true -- If there are uppercase letters in the search, respect them

-- Auto completion options
vim.opt.completeopt = { "noinsert", "menuone", "noselect" } -- Improved autocomplete behavior

-- Indentation and spacing
vim.opt.smartindent = true -- Smart indentation
vim.opt.autoindent = true -- Keep indentation from the previous line
vim.opt.tabstop = 2 -- TAB size
vim.opt.shiftwidth = 2 -- Number of spaces when reindenting
vim.opt.softtabstop = 2 -- TAB key size when editing
vim.opt.expandtab = true -- Replace TABs with spaces
vim.opt.smarttab = true -- Improved TAB key behavior

-- Character encoding
vim.opt.encoding = "utf-8" -- Use UTF-8 as default
vim.opt.autoread = true -- Update externally modified files

-- Window splitting
vim.opt.splitbelow = true -- New horizontal splits below the current one
vim.opt.splitright = true -- New vertical splits to the right of the current one

-- Spell checking
vim.opt.spell = true -- Enable spell checker
vim.opt.spelllang = { "pt_br", "en_us" } -- Set languages for spell checking

-- Enable folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
