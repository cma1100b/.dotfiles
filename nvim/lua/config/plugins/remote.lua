--[[
        Remote file explorer
--]]

local remote = require('remote-sshfs')

remote.setup({
        ssh_configs = {
                os.getenv("HOME") .. "/.ssh/config",
        },
})

local api = require('remote-sshfs.api')

vim.keymap.set('n', '<leader>rc', api.connect, {})
vim.keymap.set('n', '<leader>rd', api.disconnect, {})
vim.keymap.set('n', '<leader>re', api.edit, {})

-- It has a lot more options
