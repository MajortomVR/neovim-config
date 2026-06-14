-- KULALA REST CLIENT
if pcall(require, "kulala") then
    local opts = {
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
        client = {
            insecure = true
        },
    }
    require("kulala").setup(opts)

    -- Force Neovim to natively parse syntax for .http files without heavy plugins
    vim.filetype.add({ extension = { ["http"] = "http" } })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function(args) vim.treesitter.start(args.buf) end,
    })

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
end

