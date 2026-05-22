-- SPDX-License-Identifier: MIT
--[[
        Telescope.
        Fuzzy finder.
--]]

vim.pack.add {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.con/nvim-telescope/telescope.nvim',
        'https://github.con/nvim-telescope/telescope-ui-select.nvim',
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'

vim.keymap.set(
        'n',
        '<leader>ff',
        builtin.find_files,
        { desc = '[F]ind [F]iles' }
)
vim.keymap.set(
        'n',
        '<leader>fg',
        builtin.live_grep,
        { desc = '[F] live [G]rep' }
)
vim.keymap.set(
        'n',
        '<leader>fo',
        builtin.oldfiles,
        { desc = '[F]ind Old Files' }
)
vim.keymap.set(
        'n',
        '<leader>fb',
        builtin.buffers,
        { desc = '[F]ind [B]uffers' }
)
vim.keymap.set(
        'n',
        '<leader>fh',
        builtin.help_tags,
        { desc = '[F]ind help tags' }
)
vim.keymap.set(
        'n',
        '<leader>fG',
        builtin.git_files,
        { desc = '[F]ind [G]it Files' }
)

-- There are a lot more options but I dont really use them

-- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
-- If you later switch picker plugins, this is where to update these mappings.
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup(
                'telescope-lsp-attach',
                { clear = true }
        ),
        callback = function(event)
                local buf = event.buf
                vim.keymap.set(
                        'n',
                        '<leader>fr',
                        builtin.lsp_references,
                        { buffer = buf, desc = '[F]ind [R]eferences' }
                )
                vim.keymap.set(
                        'n',
                        '<leader>fi',
                        builtin.lsp_implementations,
                        { buffer = buf, desc = '[F]ind [I]mplementation' }
                )
                vim.keymap.set(
                        'n',
                        '<leader>fd',
                        builtin.lsp_definitions,
                        { buffer = buf, desc = '[F]ind [D]efinition' }
                )
                vim.keymap.set(
                        'n',
                        '<leader>fs',
                        builtin.lsp_document_symbols,
                        { buffer = buf, desc = '[F]ind Document [S]ymbols' }
                )
                vim.keymap.set(
                        'n',
                        '<leader>fws',
                        builtin.lsp_dynamic_workspace_symbols,
                        { buffer = buf, desc = '[F]ind [W]orkspace [S]ymbols' }
                )
                vim.keymap.set(
                        'n',
                        '<leader>ft',
                        builtin.lsp_type_definitions,
                        { buffer = buf, desc = '[F]ind [T]ype Definition' }
                )
        end,
})

-- Other cool stuff
-- Override default behavior and theme when searching
vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown {
                        winblend = 10,
                        previewer = false,
                }
        )
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set(
        'n',
        '<leader>f/',
        function()
                builtin.live_grep {
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                }
        end,
        { desc = '[F]ind [/] in Open Files' }
)

-- Shortcut for searching your Neovim configuration files
vim.keymap.set(
        'n',
        '<leader>fn',
        function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,
        { desc = '[S]earch [N]eovim files' }
)
