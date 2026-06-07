-- SPDX-License-Identifier: MIT
--[[
        Remote file explorer
--]]

vim.pack.add {
        'https://github.com/NOSDuco/remote-sshfs.nvim'
}

require('remote-sshfs').setup {
        ssh_configs = {
                os.getenv("HOME") .. "/.ssh/config",
        },
}

local api = require('remote-sshfs.api')

vim.keymap.set('n', '<leader>rc', api.connect, {})
vim.keymap.set('n', '<leader>rd', api.disconnect, {})
vim.keymap.set('n', '<leader>re', api.edit, {})

-- It has a lot more options
