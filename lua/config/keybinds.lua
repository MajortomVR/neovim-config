-- Leader
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- Open File explorer ( :Explore)
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Clear highlighting after search  ( :noh or in full :nohlsearch )
vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<CR><C-l>", { desc = "Clear search highlights" })
