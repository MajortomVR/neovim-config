-- Keybinds (move to keybinds.lua)
vim.g.mapleader = " "
vim.g.maplocalleader = ""

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- Open File explorer ( :Explore)

-- Double-tap Escape to exit Terminal Mode cleanly on QWERTZ
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Clear highlighting after search  ( :noh or in full :nohlsearch )
-- vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<CR><C-l>", { desc = "Clear search highlights" })

-- Color Schemes
vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/sainnhe/sonokai',
    'https://github.com/catppuccin/nvim',
    "https://github.com/navarasu/onedark.nvim",
    'https://github.com/Mofiqul/dracula.nvim',
    'https://github.com/AlexvZyl/nordic.nvim',
})

require("config.options")
require("config.colorscheme")
require("config.autocomplete")

-- Plugins
vim.pack.add({
	'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/mistweaverco/kulala.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/lewis6991/gitsigns.nvim',
})

-- LSPs
vim.pack.add({
    'https://github.com/nanotee/sqls.nvim',
})

require("plugins.fzf")
require("plugins.lsp")
require("plugins.kulala")
require("plugins.gitsigns")

-- vim-fugitive config
if pcall(vim.cmd, "packadd vim-fugitive") or pcall(require, "fugitive") then
    -- Interactive Git Status panel (Stage, commit, push all from one screen)
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status (Fugitive)' })
    
    -- Side-by-side active diff splitting against HEAD
    vim.keymap.set('n', '<leader>gd', ':G diffsplit<CR>', { desc = 'Git Diff Split' })
    
    -- Interactive side-line blame
    vim.keymap.set('n', '<leader>gb', ':G blame<CR>', { desc = 'Git Blame' })
end


-- Fix YAML files indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yaml.docker-compose" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})

