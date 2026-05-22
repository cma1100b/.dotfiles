-- SPDX-License-Identifier: MIT
--[[
        Oil
        Replaces NTRW as the file explorer
        Makes the file explorer act like a buffer
--]]

vim.pack.add {
        'https://github.com/stevearc/oil.nvim'
}

require("oil").setup({
        view_options = {
                show_hidden = true,
        }
})

vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

