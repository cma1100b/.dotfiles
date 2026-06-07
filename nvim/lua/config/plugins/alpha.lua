-- SPDX-License-Identifier: MIT
--[[
        Alpha
        Cool looking Greeter
--]]

vim.pack.add {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-mini/mini.nvim',
        'https://github.com/goolord/alpha-nvim'
}

local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
        [[  ^  ^  ^   ^☆ ★ ☆ ___I_☆ ★ ☆ ^  ^   ^  ^  ^   ^  ^ ]],
        [[ /|\/|\/|\ /|\ ★☆ /\-_--\ ☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
        [[ /|\/|\/|\ /|\ ★ /  \_-__\☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
        [[ /|\/|\/|\ /|\ 󰻀 |[]| [] | 󰻀 /|\/|\ /|\/|\/|\ /|\/|\ ]],
}

alpha.setup(dashboard.opts)

