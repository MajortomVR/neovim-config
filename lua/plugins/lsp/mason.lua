-- Config to make vtsls attach to vue files and make it aware of the vue_ls plugin which handles these files.
local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}
vim.lsp.config('vtsls', {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})


--     -----------------------------------------------------------------------
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        -- Language server that get automatically installed
        ensure_installed = {
            "neocmake",
            "clangd",   -- C++
            "lua_ls",
            "vtsls",  -- typescript, javascript -> from vscode
            "vue_ls",    -- vue support   -- https://github.com/vuejs/language-tools/wiki/Neovim
            "html",
            "graphql",
        },
        -- automatic_enable = true,
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            },
        },
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                opts = {},
            },
        },
        opts = {
            servers = {
                clangd = {},
                neocmake = {},
                lua_ls = {},
                vtsls = {},
                vue_ls = {},
                html = {},
                graphql = {},
            }
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')

            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    },
}
