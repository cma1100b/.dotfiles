-- SPDX-License-Identifier: MIT
--[[
        Harpoon
        Quick jump between buffers.

        > Never search with your eyes.
        Harpoon Man. 2021
--]]

vim.pack.add {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.con/ThePrimeagen/harpoon',
}

require('plenary.async')

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>s', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)

