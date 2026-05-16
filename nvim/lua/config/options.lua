--[[
        Common remaps

        TODO
        - Reduce brightness of no print characters
        - Auto newline
        - Auto remove whitespace
--]]

-- Remove the swap file
vim.opt.swapfile = false

-- Force enable of editor config
vim.g.editorconfig = true

-- Columns and numbers
vim.opt.number = true         -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = false    -- highlight current line
vim.opt.wrap = false          -- do not wrap lines by default
vim.opt.scrolloff = 10        -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10    -- keep 10 lines to left/right of cursor

-- Tabs & Indentation
local tab_width = 8
vim.opt.tabstop = tab_width     -- tabwidth
vim.opt.shiftwidth = tab_width  -- indent width
vim.opt.softtabstop = tab_width -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true        -- use spaces instead of tabs
vim.opt.smartindent = true      -- smart auto-indent
vim.opt.autoindent = false      -- copy indent from current line

-- Removes the automatic add of comment lines
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Search and selection
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true  -- case sensitive if uppercase in string
vim.opt.hlsearch = false  -- highlight search matches
vim.opt.incsearch = true  -- show matches as you type

-- Visual Options
vim.opt.signcolumn = "yes"   -- always show a sign column
vim.opt.colorcolumn = "100"  -- show a column at 100 position chars
vim.opt.showmatch = true     -- highlights matching brackets
vim.opt.termguicolors = true -- More colors
--vim.opt.cmdheight = 1     -- single line command line

-- Print characters
vim.opt.list = true
vim.opt.listchars = "space:·,tab:» ,trail:·,extends:>,precedes:<,eol:↴"
--
-- Splits
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

-- Other (copied)
vim.opt.hidden = true                   -- allow hidden buffers
vim.opt.errorbells = false              -- no error sounds
vim.opt.backspace = "indent,eol,start"  -- better backspace behaviour
vim.opt.autochdir = false               -- do not autochange directories
vim.opt.iskeyword:append("-")           -- include - in words
vim.opt.path:append("**")               -- include subdirs in search
vim.opt.selection = "inclusive"         -- include last char in selection
vim.opt.mouse = "a"                     -- enable mouse support
vim.opt.modifiable = true               -- allow buffer modifications
vim.opt.encoding = "utf-8"              -- set encoding
vim.opt.wildmenu = true                 -- tab completion
vim.opt.wildmode = "longest:full,full"  -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60")  -- improve diff display
vim.opt.redrawtime = 10000              -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000           -- increase max memory
