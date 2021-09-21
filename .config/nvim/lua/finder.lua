require('telescope').setup {}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
local opts = { noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<C-P>', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-N>', ':Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-S>', ':Telescope lsp_document_symbols<cr>', opts)
