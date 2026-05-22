-- SPDX-License-Identifier: MIT
--[[
        Autopairs
        Automatic brace and parenthesis close
--]]

vim.pack.add {
        'https://github.com/windwp/nvim-autopairs'
}

require('nvim-autopairs').setup {
        check_ts = true, -- Use treesitter
        fast_wrap = {},
}

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')

