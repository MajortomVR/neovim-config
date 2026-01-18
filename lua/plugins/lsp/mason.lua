return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        -- Language server that get automatically installed
        ensure_installed = {
            "lua_ls",
            "vtsls",  -- typescript, javascript -> from vscode
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
                lua_ls = {},
                vtsls = {},
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
