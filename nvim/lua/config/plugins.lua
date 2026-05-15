--[[
        Plugins download and configuration.

        `pack` handles downloading and setting up each plugin, just add the
        correct url.
        If the plugin requires more configurartion create a lua file with the
        configuration file under the `plugins` directory and call `load_config`
        (or require) to load it.

        Remaining:
                - blink.cmp: autocomplete
                - alpha:     greeater//frontpage
                - lualine:   cool status bar
                - nvim-tree: tree file explorer for alpha
                - which-key: to show help for all the plugins
--]]

local gh = function(x) return "https://github.com/" .. x end

local function load_config(name)
        local status, _ = pcall(require, "config.plugins." .. name)
        if not status then
                print("Warning: No configuration file for " .. name)
        end
end

vim.pack.add({
        { src = gh("nvim-lua/plenary.nvim")           }, -- Common lua functions
        { src = gh("nvim-treesitter/nvim-treesitter") }, -- Parsers
        { src = gh("neovim/nvim-lspconfig")           }, -- LSP Configuration tools
        { src = gh("rafamadriz/friendly-snippets")    }, -- Snippets
        { src = gh("Saghen/blink.cmp")                }, -- Autocomplete
        { src = gh("windwp/nvim-autopairs")           }, -- Autoclose parenthesis and braces
        { src = gh("numToStr/Comment.nvim")           }, -- Smart comments
        { src = gh("mbbill/undotree")                 }, -- Branching Undoo
        { src = gh("stevearc/oil.nvim")               }, -- File explorer as buffer
        { src = gh("nvim-telescope/telescope.nvim")   }, -- Fuzzy finder
        { src = gh("ThePrimeagen/harpoon")            }, -- Quick file jump
        { src = gh("NOSDuco/remote-sshfs.nvim")       }, -- Remote file explorer
        { src = gh("rebelot/kanagawa.nvim")           }, -- colorscheme
})

-- Dependencies
load_config("plenary")

-- Core editor tooling
load_config("treesitter")
load_config("blink")
load_config("autopairs")
load_config("comment")
load_config("undotree")
load_config("oil")

-- Cool tools
load_config("telescope")
load_config("harpoon")
load_config("remote")

-- Visuals
load_config("kanagawa")
