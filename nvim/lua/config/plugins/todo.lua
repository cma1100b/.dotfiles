-- SPDX-License-Identifier: MIT
--[[
        Todo
        Hiighlight todos, notes and warnings inside comments
--]]

vim.pack.add {
        'https://github.com/folke/todo-comments.nvim'
}

require('todo-comments').setup { signs = false }

