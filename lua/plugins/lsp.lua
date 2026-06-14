-- LSP Configs
-- Check lsp health within neovim using `:checkhealth vim.lsp`
-- Every lsp needs a config! (Create a config file so it stays clean here)

vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP Go to Implementation' })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {})
    end
})

-- Init LSPs
vim.lsp.config('clangd', require('plugins.lsp.clangd'))
vim.lsp.config('html', require('plugins.lsp.html'))
vim.lsp.config('jsonls', require('plugins.lsp.jsonls'))
vim.lsp.config('lua_ls', require('plugins.lsp.lua_ls'))
vim.lsp.config('sqls', require('plugins.lsp.sqls'))
vim.lsp.config('vtsls', require('plugins.lsp.vtsls'))

vim.lsp.enable({
    'clangd',
    'html',
    'jsonls',
    'lua_ls',
    'sqls',
    'vtsls',
})

