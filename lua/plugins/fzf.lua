local status, fzf = pcall(require, 'fzf-lua')
if status then
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find Files (fzf-lua)' })
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Live Grep (fzf-lua)' })
    vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = 'Grep Current Word' })
    vim.keymap.set('n', '<leader>fb', fzf.grep_curbuf, { desc = 'Search Current Buffer' })
    vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = 'Resume Last Search' })
end
