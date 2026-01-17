-- LSPs do no longer need to be enabled manually thanks to mason-lspconfig
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("vtsls")
--

vim.diagnostic.config({
    virtual_lines = false, -- Inserts a line for the error message
    virtual_text = true, -- Turn off the old "side" text to avoid clutter
})
