-- SPDX-License-Identifier: MIT
--[[
        Gitsigns
        Git diff simbols embeded on buffers
--]]

vim.pack.add {
        'https://github.com/lewis6991/gitsigns.nvim'
}

require('gitsigns').setup {
        signs = {
                add = { text = '+' },          ---@diagnostic disable-line: missing-fields
                change = { text = '~' },       ---@diagnostic disable-line: missing-fields
                delete = { text = '_' },       ---@diagnostic disable-line: missing-fields
                topdelete = { text = '‾' },    ---@diagnostic disable-line: missing-fields
                changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
        }
}

