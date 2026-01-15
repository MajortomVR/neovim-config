vim.opt.number = true -- enable line numbers
vim.opt.cursorline = true -- enable cursor line
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.scrolloff = 8 -- always keep 8 lines above/below the cursor unless at start/end of file
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.termguicolors = true -- enable 24-bit colors

-- Indentation
vim.opt.shiftwidth = 4 -- contols number of spaces when using >> or << commands
vim.opt.tabstop = 4 -- how many spaces tab inserts
vim.opt.softtabstop = 4 -- how many spaces tab inserts
vim.opt.expandtab = true -- use appropriate number of spaces with tab
vim.opt.smartindent = true -- indenting correctly after {

-- Copy/Paste to clipboard
vim.opt.clipboard = "unnamedplus"
