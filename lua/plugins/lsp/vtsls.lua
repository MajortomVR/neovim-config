local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    capabilities = capabilities,
    settings = {
        vtsls = { autoUseWorkspaceTsdk = true }
    }
}
