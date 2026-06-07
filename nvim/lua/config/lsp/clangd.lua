--[[
        Clangd language server configuation
--]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config['clangd'] = {
        cmd = {
                'clangd',
                '--pretty',
                '--background-index',          -- Indexes the project for better autocomplete
                '--clang-tidy',                -- Real time code analysis
                '--header-insertion=iwyu',     -- Automatic #include insertion
                '--completion-style=detailed', -- More info on the menu
                '--pch-storage=memory',        -- Better performance
                '--function-arg-placeholders',
                '--suggest-missing-includes',
                '--fallback-style=llvm',
        },
        filetypes = { 'c', 'cpp', 'h', 'hpp' },
        root_markers = {
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git',
        },
        settings = {
                workspace = {
                        didChangeWatchedFiles = {
                                enabled = 'true',
                        },
                },
                index = {
                        StandardLibrary = 'Yes',
                        Background = 'Build',
                        BackgroundIndex = 'true',
                        BackgroundWait = 'true',
                },
        },
        capabilities = capabilities,
}
