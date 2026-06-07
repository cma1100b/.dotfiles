-- SPDX-License-Identifier: MIT
--[[
        Mini satus line
        Status line, smaller that lualine
--]]

if vim.g.have_nerd_font then
        vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
end

vim.pack.add {
        'https://github.com/nvim-mini/mini.nvim'
}

local statusline = require 'mini.statusline'
statusline.setup {
        use_icons = vim.g.have_nerd_font
}

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

