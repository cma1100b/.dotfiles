--[[
        Treesitter
        Parser library and tool for syntax highlight and LSP integration

        Treesitter config
        Ensures that the usefull parsers are installed on start up
--]]

local treesitter = require("nvim-treesitter.config")

treesitter.setup({
        -- Usefull parsers (for me)
        ensure_installed = {
                "c",
                "bash",
                "make",
                "markdown",
                "markdown_inline",
                "lua",
                "vim",
                "vimdoc",
        },
        -- So that ensure installed works
        sync_install = false,
        -- Installs parsers for files that don't have one
        auto_install = true,

        highlight ={
                enable = true,
                additional_vim_regex_highlighting = true,
        },

        indent  = {
                enable = true,
        },
})

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr"                          -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99                               -- start with all folds open
