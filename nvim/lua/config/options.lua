-- SPDX-License-Identifier: MIT
--[[
        Common remaps

        TODO
        - Reduce brightness of no print characters
        - Auto newline
        - Auto remove whitespace
--]]

-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Force enable of editor config
vim.g.editorconfig = true

vim.g.have_nerd_font = true

-- Remove the swap file
vim.opt.swapfile = false
-- Enable undo/redo changes even after closing and reopening a file
vim.opt.undofile = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Columns and numbers
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

-- Tabs & Indentation
local tab_width = 8
vim.opt.tabstop = tab_width -- tabwidth
vim.opt.shiftwidth = tab_width -- indent width
vim.opt.softtabstop = tab_width -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = false -- copy indent from current line
vim.opt.breakindent = true -- automatic indent break

-- Removes the automatic add of comment lines
vim.cmd [[autocmd FileType * set formatoptions-=ro]]

-- Search and selection
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = false -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

-- Visual Options
vim.opt.signcolumn = 'yes' -- always show a sign column
vim.opt.colorcolumn = '100' -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.termguicolors = true -- More colors
--vim.opt.cmdheight = 1        -- single line command line

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Print characters
vim.opt.list = true
vim.opt.listchars = 'tab:» ,trail:·,extends:>,precedes:<'

-- Splits
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- Clipboard
-- vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Other (copied)
vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = 'indent,eol,start' -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append '-' -- include - in words
vim.opt.path:append '**' -- include subdirs in search
vim.opt.selection = 'inclusive' -- include last char in selection
vim.opt.mouse = 'a' -- enable mouse support
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = 'utf-8' -- set encoding
vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = 'longest:full,full' -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append 'linematch:60' -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = { min = vim.diagnostic.severity.WARN } },

        -- Can switch between these as you prefer
        virtual_text = true, -- Text shows up at the end of the line
        virtual_lines = false, -- Text shows up underneath the line, with virtual lines

        -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
        jump = {
                on_jump = function(_, bufnr)
                        vim.diagnostic.open_float {
                                bufnr = bufnr,
                                scope = 'cursor',
                                focus = false,
                        }
                end,
        },
}

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup(
                'kickstart-highlight-yank',
                { clear = true }
        ),
        callback = function() vim.hl.on_yank() end,
})

