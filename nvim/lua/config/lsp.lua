-- SPDX-License-Identifier: MIT
--[[
        LSP
        Language Server Protocol
        Autocomplete, references, errors, ...
--]]

local function load_server(name)
        local status, _ = pcall(require, "config.lsp." .. name)
        if not status then
                print("Warning: No configuration file for " .. name)
        end
        vim.lsp.enable(name)
end

load_server("clangd")

-- When an LSP tries to load this function will run
vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local bufnr = args.buf

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

                vim.keymap.set("n", "<leader>lf", function()
                        vim.lsp.buf.format({ async = true, })
                end, opts)

                vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
        end,
})

vim.opt.complete:append("o")
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.pumheight = 5

