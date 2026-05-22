-- SPDX-License-Identifier: MIT
--[[
        Lualine
        Better looking file line
--]]

if vim.g.have_nerd_font then
        vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
end

vim.pack.add {
        'https://github.com/nvim-lualine/lualine.nvim'
}

require('lualine').setup()
