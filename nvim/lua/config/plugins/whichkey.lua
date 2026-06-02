-- SPDX-License-Identifier: MIT
--[[
        Wich key
        Suggestion for commands
--]]

vim.pack.add {
        'https://github.com/folke/which-key.nvim',
}

require('which-key').setup {
        -- Delay between pressing a key and opening which-key (milliseconds)
        delay = 500,
        icons = { mappings = vim.g.have_nerd_font },
        -- Document existing key chains
        spec = {
                { '<C-s>', group = '[S]earch', mode = { 'n', 'v' } },
                { '<C-t>', group = '[T]oggle' },
                { '<C-g>', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
                { 'la', group = 'LSP Actions', mode = { 'n' } },
        },
}
