highlight Normal ctermbg=NONE
set nocompatible
set noswapfile
set nobackup
set autoindent
set balloonevalterm
set complete=.,w,b,u,t,i,kspell
set background=dark
" Basic ##############
filetype plugin indent on
packadd termdebug
syntax on
set encoding=utf-8
set mouse=a
set termwinsize=20x0
set number
set relativenumber
set clipboard+=unnamedplus
set hidden
set autoread
set splitright
au CursorHold * checktime
set path=$PWD/**,/usr/local/lib/*,/usr/local/include
set wildmenu
set backspace=indent,eol,start
set list
set incsearch
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set switchbuf+=usetab,newtab


call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'MaskRay/ccls', { 'dir': '~/ccls' }

  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-dispatch'

  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-startify'
  Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c'}
  Plug 'airblade/vim-gitgutter'
  Plug 'honza/vim-snippets'
  Plug 'ericcurtin/CurtineIncSw.vim'

  Plug 'gruvbox-community/gruvbox'
call plug#end()


" Persist undo history between file editing sessions.

colorscheme gruvbox
set t_Co=256
set laststatus=2
set undofile
set undolevels=5000
set undodir=~/.vim/undodir

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

filetype plugin on

highlight CursorColumn  ctermbg=NONE guibg=NONE
autocmd CursorHoldI * highlight CursorColumn term=underline ctermbg=237 guibg=#3c3836
autocmd CursorHoldI * highlight CursorLine ctermbg=NONE guibg=NONE
autocmd CursorHold * highlight CursorLine term=underline ctermbg=237 guibg=#3c3836
autocmd CursorHold * highlight CursorColumn term=underline ctermbg=NONE guibg=NONE
set cursorline
set cursorcolumn

"FILE BROWSING
let g:netrw_banner=0       " disable annoying banne
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1         " open splits to the right
let g:netrw_liststyle=3    " tree view
let g:netrw_winsize = 10
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
set tags=./tags;/ "This will look in the current directory for "tags", and work up the tree towards root until one is found.
                  "IOW, you can be anywhere in your source tree instead of just the root of it.


autocmd BufEnter * let dir = finddir('src/..',';')
autocmd BufEnter * let root_project = fnamemodify(dir, ':t')

" Mapping
"
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let mapleader= " "
" F5 para empezar para debugear/continuar
" S-F5 para parar de debugear
" C-S-F5 para restaurar el debuger con la misma configuración
" F6 Para pausar el debugger
  "nnoremap <silent><F6> :Termdebug %:r<CR><c-w>2j<c-w>L
" F9
" S-F9
"F10 Step Over
"F11 Step Into
"S-F11 Step out of current function scope
nnoremap <silent><F2> :TagbarToggle<cr>
nnoremap <silent><F3> :copen<cr>
nnoremap <silent><leader><F3> :cclose<cr>
nnoremap <silent><F4> :wa<bar>Make -C build<cr>:echo "😁Compiló😁"<cr>
nnoremap <silent><leader><F4> :make -C build run<cr>
nnoremap <silent><S-F4> :make -C build clean<cr><cr>:echo "🌬 Se usó clean 🌬"<cr>
nnoremap <F7> :ctags -R
nnoremap <expr><F8> ':Obsession ~/.vim/session/' . expand(root_project) . '<cr>:echo "Se guardó la sesion" <cr>'
nnoremap <silent><F12> :Lex<cr>

map <silent><leader><leader> :call CurtineIncSw()<CR>
nnoremap <silent><leader>bk :call vimspector#ToggleBreakpoint()<cr>
nnoremap ,,  mtA;<Esc>`t
nnoremap <C-_> <C-I>
nnoremap <silent><C-S> :update<cr>:echo 'Buffer actual guardado'<cr>
inoremap <silent><C-S> <esc>:update<cr>:echo 'Buffer actual guardado'<cr>a
nnoremap <silent><C-Q> :wa<cr>:echo 'Todos los buffer guardados'<cr>
inoremap <silent><C-Q> <esc>:wa<cr>:echo 'Todos los buffer guardados'<cr>a
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <silent><C-P> :Files<CR>
nnoremap <silent><C-N> :Lines<CR>
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gl :Commits<cr>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gs :G<CR>
nnoremap <silent><leader>gp :Git push origin HEAD<CR>
nnoremap <silent><leader>gb :!hub browse<CR>

imap jk <Esc>
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
vnoremap <silent><UP> :m '<-2<CR>gv=gv
vnoremap <silent><DOWN> :m '>+1<CR>gv=gv

inoremap {;<CR> {<CR>};<ESC>O

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgn
nnoremap n nzz
nnoremap N nzz

" ALE
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'cpp' : ['clangtidy', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'cpp': ['g++']}
let g:ale_open_list = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed=1
let g:ale_pattern_options_enabled = 1
"let g:ale_set_balloons=1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_lint_delay = 1000
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" " TextEdit might fail if hidden is not set.

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <NUL> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText ctermfg=231 guifg=#ffffff ctermbg=60 guibg=#df5f87
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme="dark"

" FZF
set rtp+=~/.fzf
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'enter': 'drop',
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'}
let g:fzf_preview_window = 'right:60%'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
packadd! vimspector

"Gitgutter
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 8
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
highlight GitGutterAdd    ctermfg=40
highlight GitGutterChange ctermfg=93
highlight GitGutterDelete ctermfg=1
hi clear SignColumn
"highlight GitGutterAdd    guifg=green guibg=green ctermfg=green ctermbg=green
"highlight GitGutterChange guifg=yellow guibg=yellow ctermfg=yellow ctermbg=yellow
"highlight GitGutterDelete guifg=red guibg=red ctermfg=red ctermbg=red

" Startify

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
 \'  ##############..... ##############  ',
 \'  ##############......##############  ',
 \'    ##########..........##########    ',
 \'    ##########........##########      ',
 \'    ##########.......##########       ',
 \'    ##########.....##########..       ',
 \'    ##########....##########.....     ',
 \'  ..##########..##########.........   ',
 \'....##########.#########............. ',
 \'  ..################JJJ............   ',
 \'    ################.............     ',
 \'    ##############.JJJ.JJJJJJJJJJ     ',
 \'    ############...JJ...JJ..JJ  JJ    ',
 \'    ##########....JJ...JJ..JJ  JJ     ',
 \'    ########......JJJ..JJJ JJJ JJJ    ',
 \'    ######    .........               ',
 \'                .....                 ',
 \'                  .      ',
 \])

let g:startify_fortune_use_unicode = 1

hi StartifyFooter        guifg=#5f5f00 guibg=orange gui=NONE
let g:startify_custom_footer = startify#fortune#boxed()
   ""\ startify#pad(split(system('fortune | cowsay -f tux'), '\n'))
