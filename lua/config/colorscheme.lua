-- COLOR SCHEME


vim.o.background = "dark"
vim.cmd.colorscheme("tokyonight")



-- Sonokai (added as vim pack see init.lua)
-- vim.g.sonokai_style = 'andromeda'
-- vim.cmd([[colorscheme sonokai]])

-- Catpuccin from 'https://github.com/catppuccin/nvim'
-- local status, catppuccin = pcall(require, "catppuccin")
-- if not status then
--     return
-- end
--
-- catppuccin.setup({
--     flavour = "mocha",
-- })
-- vim.cmd.colorscheme("catppuccin")



-- One Dark
-- require('onedark').setup {
--     style = 'warmer'
-- }
-- require('onedark').load()
--
-- Dracula
-- local status, dracula = pcall(require, "dracula")
-- if not status then
--     return
-- end



-- dracula.setup({
--     -- Customize options if you like
--     italic_comment = true,
--
--     -- OPTIONAL: If you want Dracula to be jet-black instead of dark purple,
--     -- uncomment the 'colors' block below:
--     -- colors = {
--     --     bg = "#000000",
--     --     bgdark = "#0b0b0b",
--     --     bgfloat = "#111111",
--     -- },
-- })

-- Load the colorscheme
-- vim.cmd.colorscheme("dracula")




-- Nordic

-- local status, nordic = pcall(require, "nordic")
-- if not status then
--     return
-- end
--
-- nordic.setup({
--     -- Enable italic comments
--     italic_comments = true, --
--
--     -- CRITICAL FOR EXTRA DARKNESS:
--     -- This swaps the normal dark background with an even darker charcoal one.
--     swap_backgrounds = true, --
--
--     -- This forces treesitter-context splits to stay dark as well
--     ts_context = {
--         dark_background = true, --
--     },
--
--     -- Clean styling for float windows like FZF-lua
--     telescope = {
--         style = 'flat', --
--     },
-- })
--
-- -- Load the colorscheme
-- vim.cmd.colorscheme("nordic") --
