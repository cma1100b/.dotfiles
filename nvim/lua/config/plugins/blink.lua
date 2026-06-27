-- SPDX-License-Identifier: MIT
--[[
        Blink
        Better autocomplete than the default

        A lot copied from kikstart.nvim
--]]

vim.pack.add({
        'https://github.com/rafamadriz/friendly-snippets',
        {
                src = 'https://github.com/L3MON4D3/LuaSnip',
                version = vim.version.range '2.*'
        },
        {
                src = 'https://github.com/Saghen/blink.cmp',
                version = vim.version.range '1.*'
        },
})

require('luasnip').setup {}

require('blink.cmp').setup {
        keymap = {
                preset = 'default'
        },
        appearance = {
                nerd_font_variant = 'mono',
        },
        completion = {
                documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },
        sources = {
                default = { 'lsp', 'path', 'snippets' },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = 'lua' },
        signature = { enabled = true },
}

