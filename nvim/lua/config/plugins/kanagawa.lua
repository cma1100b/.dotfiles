-- SPDX-License-Identifier: MIT
--[[
        Kanagawa wave
        Cool colorscheme
--]]

vim.pack.add {
        'https://github.con/rebelot/kanagawa.nvim'
}

require('kanagawa')

-- Activate Colorscheme
vim.cmd("colorscheme kanagawa")

-- Make Background transparent
vim.cmd [[
        highlight LineNr guibg=none
        highlight SignColumn guibg=none
        highlight Normal guibg=none
        highlight Normal ctermbg=none
        highlight NonText guibg=none
        highlight NonText ctermbg=none
]]

-- Remove the color from the status bar (I like the color)
-- vim.cmd(":hi statusline guibg=NONE")
