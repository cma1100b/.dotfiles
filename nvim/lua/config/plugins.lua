-- SPDX-License-Identifier: MIT
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
        { src = gh("nvim-lua/plenary.nvim")               }, -- Common lua functions
        { src = gh("nvim-treesitter/nvim-treesitter")     }, -- Parsers
        { src = gh("nvim-telescope/telescope.nvim")       }, -- Fuzzy finder
        { src = gh("neovim/nvim-lspconfig")               }, -- LSP Configuration tools
        { src = gh("rafamadriz/friendly-snippets")        }, -- Snippets
        { src = gh("windwp/nvim-autopairs")               }, -- Autoclose parenthesis and braces
        { src = gh("numToStr/Comment.nvim")               }, -- Smart comments
        { src = gh("mbbill/undotree")                     }, -- Branching Undoo
        { src = gh("stevearc/oil.nvim")                   }, -- File explorer as buffer
        { src = gh("ThePrimeagen/harpoon")                }, -- Quick file jump
        { src = gh("NOSDuco/remote-sshfs.nvim")           }, -- Remote file explorer
        { src = gh("rebelot/kanagawa.nvim")               }, -- colorscheme
        { src = gh("lewis6991/gitsigns.nvim")             }, -- Git changes on files
        { src = gh("lukas-reineke/indent-blankline.nvim") }, -- Indentation visulizer
        { src = gh("nvim-tree/nvim-web-devicons")         }, -- Icons
        { src = gh("nvim-lualine/lualine.nvim")           }, -- Better looking file line
        -- { src = gh("Saghen/blink.cmp")                }, -- Autocomplete
})

-- Core editor tooling
load_config("treesitter")

-- Text editor tools
load_config("autopairs")
load_config("comment")

-- File navigation
load_config("telescope")
load_config("harpoon")
load_config("undotree")
load_config("oil")

-- Remote
load_config("remote")

-- Git integrations
load_config("gitsigns")

-- Visuals
load_config("indent")
load_config("kanagawa")
load_config("lualine")

