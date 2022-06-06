--[["""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _____  .__        .__
"   /     \ |__| ___  _|__| ____________   ____
"  /  \ /  \|  | \  \/ /  |/     \_  __ \_/ ___\
" /    Y    \  |  \   /|  |  Y Y  \  | \/\  \___
" \____|____/__|   \_/ |__|__|_|__/__|    \_____>
"   ________  _________________        .__          __
"  /  _____/ /  _____/\_   ___ \_______|__| _______/  |_  ____
" /   \  ___/   \  ___/    \  \/\_  __ \  |/  ___/\   __\/  _ \
" \    \_\  \    \_\  \     \____|  | \/  |\___ \  |  | (  <_> )
"  \________/\________/\________/|__|  |__/______> |__|  \____/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""]]
-- Basic
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
-- vim.o.hidden = true
vim.o.colorcolumn = '81'
vim.o.splitright = true
vim.opt.formatoptions:remove('cro') -- TODO No autocomments in new line
vim.o.dictionary = '/usr/share/dict/words,/usr/share/dict/spanish'
vim.o.signcolumn = 'yes'
vim.o.updatetime = 100
vim.o.undofile = true
vim.o.undolevels = 5000
vim.bo.spelllang = 'es,en_us'
vim.o.spelllang = 'es,en_us'
-- The width of a TAB is set to 2.
-- Still it is a \t. It is just that
-- Vim will interpret it to be having
-- a width of 2.
vim.bo.tabstop = 2
vim.o.tabstop = 2
-- Indents will have a width of 2
vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
-- Sets the number of columns for a TAB
vim.bo.softtabstop = 2
vim.o.softtabstop = 2
-- Expand TABs to spaces
vim.bo.expandtab = true
vim.o.expandtab = true
vim.o.laststatus = 3
-- Visual
vim.wo.list = true
vim.o.listchars='tab:⍿·,nbsp:␣,trail:•,extends:⟩,precedes:⟨'
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=250, on_visual=true}')
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_invert_selection = 0
vim.o.termguicolors = true
vim.cmd('colorscheme gruvbox')
-- vim.o.guifont = 'FiraCode\\ Nerd\\ Font\\ Mono\\'
-- vim.o.guifont = "ComicCodeLigatures-SemiBold"
vim.o.guifont = 'Comic\\ Code\\ Ligatures\\ SemiBold\\'
vim.cmd('hi clear SignColumn')

vim.g.python3_host_prog = "/usr/bin/python"
-- augroup
-- vim.api.nvim_create_augroup("CursorLine", {})
-- vim.api.nvim_create_autocmd({ "VimEnter,WinEnter,BufWinEnter" }, { command = "setlocal cursorline", group = "CursorLine"})
-- vim.api.nvim_create_autocmd("WinLeave", { command = "setlocal nocursorline", group = "CursorLine"})
vim.cmd([[
augroup CursorLine
    au!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
]])

vim.cmd([[
augroup Myterm
    au!
    au TermOpen * setlocal nobuflisted
    au BufEnter term://* startinsert
augroup END
]])

vim.cmd([[
augroup Files
au!
au FileType gitcommit,markdown setlocal spell
au FileType c,cpp,cs,java setlocal commentstring=//\ %s
augroup END
]])

vim.cmd([[
augroup QFClose
au!
au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup END
]])

vim.g.mapleader = ' '
require('plugins')

-- General maps (no related to plugins)
local opts = {noremap = true, silent = true} -- TODO ADD new var just for noremap?
-- Terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<c-\\><c-n>', opts)
vim.api.nvim_set_keymap('t', '<C-K>', '<C-\\><C-N><C-W>k', opts)
-- Insert
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', opts)
vim.api.nvim_set_keymap('i', '<C-H>', '<Left>', opts)
vim.api.nvim_set_keymap('i', '<C-J>', '<Left>', opts)
vim.api.nvim_set_keymap('i', '<C-K>', '<Right>', opts)
vim.api.nvim_set_keymap('i', '<C-L>', '<Right>', opts)
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:update<cr>', {})
-- Visual
vim.api.nvim_set_keymap('v', '<Up>', ':m \'<-2<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', '<Down>', ':m \'>+1<CR>gv=gv', opts)
-- Normal
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', opts)
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', opts)
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', opts)
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', opts)
-- https://www.reddit.com/r/vim/comments/8k4p6v/what_are_your_best_mappings/
vim.api.nvim_set_keymap('n', 'c*', '*``cgn', opts)
vim.api.nvim_set_keymap('n', 'c#', '#``cgn', opts)

-- vim.api.nvim_set_keymap('n', 'n', 'nzz', opts) -- Already done with incsearch plugin
-- vim.api.nvim_set_keymap('n', 'N', 'Nzz', opts)
vim.api.nvim_set_keymap('n', '[[', '][%_', opts) -- Jump to function head
-- Easy paste above/below
vim.api.nvim_set_keymap('n', '<leader>p', ':put<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>P', ':put!<cr>', opts)
