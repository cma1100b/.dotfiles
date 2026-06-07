-- SPDX-License-Identifier: MIT
--[[
        Harpoon
        Quick jump between buffers.

        > Never search with your eyes.
        Harpoon Man. 2021
--]]

vim.pack.add {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/ThePrimeagen/harpoon',
}

require('plenary.async')

local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd file to Harpoon' } )
vim.keymap.set('n', '<leader>s', ui.toggle_quick_menu, { desc = 'Open Harpoon menu' })
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = 'Jump to file 1'})
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = 'Jump to file 2'})
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = 'Jump to file 3'})
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = 'Jump to file 4'})

