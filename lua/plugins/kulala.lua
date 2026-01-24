return {
    {
        "mistweaverco/kulala.nvim",
        -- Register the parser BEFORE the plugin setup
        init = function()
            -- Create the autocommand to register the parser for TSUpdate
            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                callback = function()
                    -- Use the direct table access
                    local parsers = require("nvim-treesitter.parsers")
                    parsers.kulala_http = {
                        install_info = {
                            url = "https://github.com/mistweaverco/tree-sitter-http",
                            files = { "src/parser.c" },
                            branch = "main",
                        },
                        filetype = "http",
                    }
                end,
            })

            -- Disable folding in the request output
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "json.kulala_ui",
                callback = function()
                    vim.schedule(function()
                        vim.opt_local.foldenable = false
                        vim.opt_local.foldlevel = 99
                        vim.cmd("normal! zR")
                    end)
                end,
            })

            -- Link the file extension
            vim.filetype.add({
                extension = { ["http"] = "http" },
            })

            -- Register the language name
            vim.treesitter.language.register("kulala_http", "http")
        end,

        config = function(_, opts)
            require("kulala").setup(opts)

            -- Enable highlighting manually
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "http",
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
        keys = {
            { "<leader>Rs", desc = "Send request" },
            { "<leader>Ra", desc = "Send all requests" },
            { "<leader>Rb", desc = "Open scratchpad" },
        },
        ft = {"http", "rest"},
        opts = {
            -- https://neovim.getkulala.net/docs/getting-started/configuration-options
            global_keymaps = true,
            global_keymaps_prefix = "<leader>R",
            kulala_keymaps_prefix = "",

            -- The default env file
            default_env = "dev",
            ui = {
                display_mode = "float",  -- "split", "float"
                split_direction = "vertical",
                autocomplete = true, -- Enable autocomplete (default: true)
                float = {
                    width = 0.9,        -- width of floating windows (0.0-1.0 for percentage)
                    height = 0.8,       -- height of floating windows (0.0-1.0 for percentage)
                    border = "rounded", -- Border style of floating windows ("rounded", "single", ...? )
                },
            },
            -- winbar = true,
        },
    },
}
