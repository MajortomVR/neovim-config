-- LSP Configs
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP Go to Implementation' })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {})
    end
})

-- Init LSPs
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' } 
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false
            },
        }
    }
})

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'vtsls',
})

