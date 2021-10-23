local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', "<leader>gw", ":Gwrite<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>gr", ":GRead<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>gs", ":G<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>gp", ":Git! push<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>gh", ":!gh repo view -w<cr>", opts)
