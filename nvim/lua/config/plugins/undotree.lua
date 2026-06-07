-- SPDX-License-Identifier: MIT
--[[
        Undootree
        Version control inside files
--]]

vim.pack.add {
        'https://github.com/mbbill/undotree'
}

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open [U]ndooTree' })

