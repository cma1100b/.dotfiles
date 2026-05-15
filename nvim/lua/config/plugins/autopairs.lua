--[[
        Autopairs
        Automatic brace and parenthesis close
--]]

local autopairs = require("nvim-autopairs")

autopairs.setup({
        check_ts = true, -- Use treesitter
        fast_wrap = {},
})

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
