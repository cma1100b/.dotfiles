-- SPDX-License-Identifier: MIT
--[[
        LSP
        Language Server Protocol
        Autocomplete, references, errors, ...
--]]

local function load_server(name)
        local status, _ = pcall(require, 'config.lsp.' .. name)
        if not status then
                print('Warning: No configuration file for ' .. name)
        end
        vim.lsp.enable(name)
end

-- When an LSP tries to load this function will run
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('cma-lsp-attach', { clear = true }),
        callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                -- local bufnr = event.buf

                vim.keymap.set(
                        'n',
                        'gd',
                        vim.lsp.buf.definition,
                        { desc = '[G]oto [D]efinition' }
                )
                vim.keymap.set(
                        'n',
                        'K',
                        vim.lsp.buf.hover,
                        { desc = 'See definition' }
                )
                -- vim.keymap.set(
                --         'n',
                --         '<leader>lf',
                --         function() vim.lsp.buf.format { async = true } end,
                --         { desc = '[L]SP [F]ormat' }
                -- )
                vim.keymap.set(
                        {'n', 'x'},
                        'gra',
                        vim.lsp.buf.code_action,
                        { desc = '[G]oto Code [A]ction' }
                )
                vim.keymap.set(
                        'n',
                        'grn',
                        vim.lsp.buf.rename,
                        { desc = '[R]e[n]ame' }
                )
                vim.keymap.set(
                        'n',
                        'grD',
                        vim.lsp.buf.declaration,
                        { desc = '[G]oto [D]eclaration' }
                )

                if
                        client
                        and client:supports_method(
                                'textDocument/documentHighlight',
                                event.buf
                        )
                then
                        local highlight_augroup = vim.api.nvim_create_augroup(
                                'cma-lsp-highlight',
                                { clear = false }
                        )
                        vim.api.nvim_create_autocmd(
                                { 'CursorHold', 'CursorHoldI' },
                                {
                                        buffer = event.buf,
                                        group = highlight_augroup,
                                        callback = vim.lsp.buf.document_highlight,
                                }
                        )

                        vim.api.nvim_create_autocmd(
                                { 'CursorMoved', 'CursorMovedI' },
                                {
                                        buffer = event.buf,
                                        group = highlight_augroup,
                                        callback = vim.lsp.buf.clear_references,
                                }
                        )

                        vim.api.nvim_create_autocmd('LspDetach', {
                                group = vim.api.nvim_create_augroup(
                                        'cma-lsp-detach',
                                        { clear = true }
                                ),
                                callback = function(event2)
                                        vim.lsp.buf.clear_references()
                                        vim.api.nvim_clear_autocmds {
                                                group = 'cma-lsp-highlight',
                                                buffer = event2.buf,
                                        }
                                end,
                        })
                end

                if
                        client
                        and client:supports_method(
                                'textDocument/inlayHint',
                                event.buf
                        )
                then
                        vim.keymap.set(
                                'n',
                                '<leader>th',
                                function()
                                        vim.lsp.inlay_hint.enable(
                                                not vim.lsp.inlay_hint.is_enabled {
                                                        bufnr = event.buf,
                                                }
                                        )
                                end,
                                { desc = '[T]oggle Inlay [H]ints' }
                        )
                end
        end,
})

load_server 'clangd'
load_server 'lua_ls'

vim.opt.complete:append 'o'
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.pumheight = 5
