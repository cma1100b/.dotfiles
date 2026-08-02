-- SPDX-License-Identifier: MIT
--[[
        LSP Configuration system
--]]

vim.pack.add({
        'https://github.com/neovim/nvim-lspconfig',
        'https://github.com/mason-org/mason.nvim',
        'https://github.com/mason-org/mason-lspconfig.nvim',
        'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

require('mason').setup {}

require('mason-tool-installer').setup {
        ensure_installed = {
                clangd,
                lua_ls,
        },
}

