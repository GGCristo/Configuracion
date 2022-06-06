require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
  indent = {
    enable = true
  },
}
vim.cmd([[
augroup nvim-treesitter
au!
autocmd VimEnter * call _nvim_treesitter()
augroup END
function! _nvim_treesitter()
hi TSVariable ctermfg=Grey guifg=#a0a8b0 cterm=none gui=none
hi TSField ctermfg=Magenta guifg=#bd93f9
hi TSProperty ctermfg=Magenta guifg=#bd93f9
endfunction
]])
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false
