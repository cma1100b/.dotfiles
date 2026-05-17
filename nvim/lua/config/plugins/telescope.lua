-- SPDX-License-Identifier: MIT
--[[
        Telescope.
        Fuzzy finder.
--]]

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Old Files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = "Git Files" })

-- Need LSP to work correctly
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = "Definitions" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "References" })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = "Declarations" })

