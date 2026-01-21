-- Leader
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- Open File explorer ( :Explore)
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit Terminal Mode' })
