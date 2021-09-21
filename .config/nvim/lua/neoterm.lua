-- (https://superuser.com/questions/410847/how-do-you-create-a-vim-key-mapping-that-requires-numbers-before-the-hotkey-lik)
-- nnoremap <leader>t :<C-U>exe v:count . 'Ttoggle'<cr>
vim.api.nvim_set_keymap('n', '<leader>t', ':<C-U>exe v:count . \'Ttoggle\'<CR>', { noremap = true, silent = true })

-- let g:neoterm_size = 15
vim.g.neoterm_size = 15
-- let g:neoterm_default_mod = 'botright'
vim.g.neoterm_default_mod = 'botright'
-- let g:neoterm_autoinsert = 1
vim.g.neoterm_autoinsert = 1 -- TODO is this needed with the autocommand?
