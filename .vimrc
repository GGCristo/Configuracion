"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic
set noswapfile
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set autoindent
set complete=.,w,b,u,t,i,kspell
set background=dark
filetype plugin indent on
syntax on
set encoding=utf-8
set mouse=a
set number
set relativenumber
set clipboard^=unnamedplus
set hidden
set cc=81
set autoread
set splitright
set noequalalways
"au CursorHold * checktime
set wildmenu
set backspace=indent,eol,start
set incsearch
set list listchars=tab:⍿·,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set showbreak=↪\
set switchbuf+=useopen,usetab
set spelllang=es,en_us
set dictionary+=/usr/share/dict/words,/usr/share/dict/spanish

" Abbrevation
iabbrev Vector vector

" terminal
tnoremap <C-B>[ <C-\><C-N>
tnoremap <C-K> <C-\><C-N><C-W>k

set tags=./tags;/ "This will look in the current directory for "tags", and work up the tree towards root until one is found.
                  "IOW, you can be anywhere in your source tree instead of just the root of it.

set laststatus=2
" Persist undo history between file editing sessions.
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

" pseudo-text object
" https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20
" https://www.reddit.com/r/vim/comments/i8prmn/vifm_as_a_nerdtree_alternative_my_in_progress/
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-', '#' ]
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" augroup
augroup TipoFile
  au!
  " I dont want autocomments
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType gitcommit setlocal spell
  ""vim-commentary
  autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
augroup END

augroup MyTerm
   autocmd!
    if has('nvim')
      autocmd TermOpen * setlocal nobuflisted
      " (https://github.com/akinsho/nvim-toggleterm.lua/blob/master/lua/toggleterm/colors.lua)
      hi DarkenedPanel guibg=Black
      autocmd TermOpen * setlocal winhighlight=Normal:Black
      " autocmd TermOpen * resize -10 <bar> <C-W>J
    else
      autocmd TerminalOpen * setlocal nobuflisted
      " (https://github.com/akinsho/nvim-toggleterm.lua/blob/master/lua/toggleterm/colors.lua)
      autocmd TerminalOpen * setlocal
    endif
augroup END

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

call plug#begin('~/.vim/plugged')
  Plug 'KenN7/vim-arsync'
  Plug 'liuchengxu/vista.vim'
  Plug 'kassio/neoterm'
  Plug 'GGCristo/crear.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim'
  if has ('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    " Plug 'akinsho/nvim-toggleterm.lua'
    Plug 'norcalli/nvim-colorizer.lua'
  end
  Plug 'ryanoasis/vim-devicons'
  Plug 'dense-analysis/ale'
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  Plug 'rbong/vim-crystalline'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'mhinz/vim-startify'
  Plug 'puremourning/vimspector'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/vim-easy-align'
  Plug 'simnalamburt/vim-mundo'
  Plug 'haya14busa/incsearch.vim'
  Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-overwin-f2)'}
  Plug 'tweekmonster/startuptime.vim'
  Plug 'ericcurtin/CurtineIncSw.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'Yggdroot/indentLine'
  Plug 'unblevable/quick-scope'
  Plug 'markonm/traces.vim'
  " Plug 'wincent/terminus'
  Plug 'rhysd/git-messenger.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'machakann/vim-highlightedyank'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Functions
function! Building(modo)
  :ALEDisable
if (a:modo)
  :AsyncTask project-build
else
  :AsyncTask project-build-debug
endif
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  execute a:command
  " Clean up: restore previous search history, and cursor position
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

function! SaveSession()
  cd %:h
  let dir = finddir('src/..',';')
  if dir == ''
    let dir = finddir('.git/..',';')
  endif
  execute 'cd' fnameescape(dir)
  let root_project = fnamemodify(dir, ':t')
  execute ':Obsession ~/.vim/session/' . expand(root_project)
endfunction

function! Tab()
  if &ft == "qf"
    execute "cnewer"
  elseif tabpagenr('$') > 1
    execute "tabnext"
  else
    let start_buffer = bufnr('%')
    execute "bn"
    while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
      execute "bn"
    endwhile
  endif
endfunction

function! STab()
  if &ft == "qf"
    execute "colder"
  elseif tabpagenr('$') > 1
    execute "tabprevious"
  else
    let start_buffer = bufnr('%')
    execute "bp"
    while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
      execute "bp"
    endwhile
  endif
endfunction

"auto close {
"(https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/)
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction

" Maps
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
" nmap <F2> <Plug>(grammarous-move-to-info-window)
noremap <silent><F3> :call asyncrun#quickfix_toggle(13)<cr>
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

let modo = 1
nnoremap <silent><expr>cg ((modo) ? ':AsyncTask project-generate' :
      \   ':AsyncTask project-generate-debug')."\<cr>"
nnoremap <silent><F4> :call Building(modo)<cr>
nnoremap <expr><leader><F4> ':AsyncTask project-run<cr>'
nnoremap <silent><leader>cl :AsyncTask project-clean<cr>:echo "🌬 Se usó clean 🌬"<cr>
nnoremap <expr><silent><leader>cs ((modo) ? ':let modo=0' : ':let modo=1')."\<cr>"

nnoremap <silent><F7> :MundoToggle<CR>

if executable("cppcheck")
  nnoremap <silent><F8> :!clear<cr>:!cppcheck --enable=all --suppress=missingIncludeSystem . -itest/ -ibuild/ -iDebug/ -i.ccls-cache/<CR>
else
  nnoremap <silent><F8> :echo "Instala cppcheck"<CR>
endif

" nnoremap <silent><F12> :CHADopen<cr>
nnoremap <silent><F12> :call MyNerdToggle()<cr>

nnoremap <silent><leader><leader> :call CurtineIncSw()<cr>
nnoremap <silent><leader>bk :call vimspector#ToggleBreakpoint()<cr>
"nnoremap ,,  mtA;<Esc>`t
nnoremap <silent><C-S> :update<cr>:echo 'Buffer actual guardado🖪'<cr>
inoremap <silent><C-S> <esc>:update<cr>:echo 'Buffer actual guardado'<cr>
nnoremap <silent><C-Q> :wa<cr>:echo 'Todos los buffer guardados'<cr>
inoremap <silent><C-Q> <esc>:wa<cr>:echo 'Todos los buffer guardados'<cr>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <expr> <C-P> (len(system('git rev-parse')) ? ':Files' : ':GFiles --cached --others --exclude-standard')."\<cr>"
if executable ("rg")
  nnoremap <silent><C-N> :Rg<CR>
  set grepprg=rg\ --vimgrep\ --hidden\
else
  nnoremap <silent><C-N> :Lines<CR>
endif
nnoremap <silent><leader>s :Vista finder coc<cr>
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Commits<cr>
nnoremap <silent><leader>gb :GBranches<cr>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gs :G<CR>
nnoremap <silent><leader>gp :Git push origin HEAD<CR>
nnoremap <silent><leader>gh :!hub browse<CR>
"map <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

inoremap jj <Esc>lmtA;<Esc>`t
inoremap jk <Esc>
inoremap <C-H> <Left>
inoremap <C-J> <Left>
inoremap <C-K> <Right>
inoremap <C-L> <Right>
vnoremap <silent><Up> :m '<-2<CR>gv=gv
vnoremap <silent><Down> :m '>+1<CR>gv=gv

" (https://superuser.com/questions/410847/how-do-you-create-a-vim-key-mapping-that-requires-numbers-before-the-hotkey-lik)
nnoremap <leader>t :<C-U>exe v:count . 'Ttoggle'<cr>

nnoremap <silent> <tab> :call Tab()<cr>
nnoremap <silent> <S-tab> :call STab()<cr>

inoremap {;<CR> {<CR>};<ESC>O
" I use Allman indentation style
noremap [[ [[k

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
map <silent><leader>r :source $MYVIMRC<CR>
map <silent><leader>bd :call Preserve("%bd<bar>e#<bar>bd#")<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgn
map Y y$
nnoremap n nzz
nnoremap N nzz
nnoremap <silent><leader>v :vsp $MYVIMRC<CR> <C-W>H
" Easy paste above/below
nnoremap <silent><leader>p :put<CR>
nnoremap <silent><leader><S-p> :put!<CR>

" Easy new lines
nnoremap <silent> [<space> :call append(line('.')-1, '')<CR>
nnoremap <silent> ]<space> :call append(line('.'), '')<CR>

inoremap <expr> {<Enter> <SID>CloseBracket()
" Spelling
command! WQ wq
command! Wq wq
command! W w
command! Q q

" ALE
let g:ale_fixers = {'cpp': ['remove_trailing_lines', 'trim_whitespace'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'cpp': ['g++','clangd','ccls'], 'javascript' : ['eslint']}
" let g:ale_cpp_cppcheck_options = '--enable=all --suppress=missingIncludeSystem'
let g:ale_cpp_clangtidy_checks = [
      \'-clang-analyzer-*',
      \'performance-*',
      \'readability-*','-readability-implicit-bool-conversion',
      \ '-readability-magic-numbers',
      \'modernize-*','-modernize-use-trailing-return-type',
      \'bugprone-*']
let g:ale_open_list = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '🛆'
" -let g:ale_sign_warning = ''

let g:ale_pattern_options = {
      \   'test.cpp': {'ale_enabled': 0},
      \}

" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
"let g:ale_pattern_options_enabled = 1
"let g:ale_set_balloons=1
 let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:alex_disable_lsp = 1

let g:ale_lint_delay = 1000
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" COC

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <NUL> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" FZF
" imap <C-X><C-L> <plug>(fzf-complete-line)
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
command! -bang -nargs=* Rg
      \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'), <bang>0)
let g:fzf_buffers_jump=1
"Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]
"packadd! vimspector

"Gitgutter
if (executable("rg"))
  let g:gitgutter_grep = 'rg'
endif
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 8
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"STARTIFY
let g:startify_session_dir = '~/.vim/session'
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

let g:startify_custom_footer = startify#fortune#boxed()
      "\ startify#pad(split(system('fortune | cowsay -f tux'), '\n'))

" INCSEARCH
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz


"" EASYMOTION
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

"" Vim-Easy-Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '<': { 'pattern': '<<\|<' },
      \ '/': {
      \     'pattern':         '//\+\|/\*\|\*/',
      \     'delimiter_align': 'l',
      \     'ignore_groups':   ['!Comment'] },
      \ ']': {
      \     'pattern':       '[[\]]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       '[()]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   }
      \ }

""vim-crystalline

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()} '
    let l:s .= crystalline#right_sep('Fill', 'Fill') . ' %{g:asyncrun_status}'
  endif

  let l:s .= '%='

  if a:current
    let l:s .= crystalline#left_sep('Fill', 'Fill') . '%{coc#status()}'
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{modo ?"build":"Debug"}'
    let l:s .= crystalline#left_sep('', '') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= '%{&ft} %l/%L %c %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

if filereadable(expand('~/.vim/plugged/vim-devicons/plugin/webdevicons.vim'))

  function! TabLabel(buf, max_width) abort
    let [l:left, l:name, l:short_name, l:right] = crystalline#default_tablabel_parts(a:buf, a:max_width)
    return l:left . l:short_name . ' ' . WebDevIconsGetFileTypeSymbol(l:name) . (l:right ==# ' ' ? '' : ' ') . l:right
  endfunction

  function! TabLine() abort
    return crystalline#bufferline(0, 0, 1, 1, 'TabLabel', crystalline#default_tabwidth() + 3)
  endfunction

else

  function! TabLine()
    let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
    return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
  endfunction

endif

let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'badwolf'

set showtabline=2
set guioptions-=e
set laststatus=2

"" indentLine
let g:indentLine_fileTypeExclude = ['help', 'startify']

"" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" highlightedyank
let g:highlightedyank_highlight_duration = 500

"asyncrun
let g:asyncrun_rootmarks = ['src']
let g:asynctasks_term_pos = 'external'
let g:asynctasks_term_pos = 'tab'
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
au User AsyncRunStop call DontTouchMyTerminal()
func DontTouchMyTerminal()
if (g:asyncrun_status=="success")
  :ALEEnable
endif
endfunction
"let g:asyncrun_exit = "silent call system('aplay ~/.vim/notify.wav &')"
"let g:ayncrun_bell = 1

" vim-doge
let g:doge_comment_jump_modes = ['n', 's']

" fzf-checkout.vim TODO
let g:fzf_branch_actions = {
      \ 'pull': {
      \   'prompt': 'Pull> ',
      \   'execute': 'Git pull {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-p',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'diff': {
      \   'prompt': 'Diff> ',
      \   'execute': 'Git diff {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-f',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" neoterm
let g:neoterm_size = 15
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1
"----- NEOVIM ------------------------------------------------------------------
if has ('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF
augroup nvim_treesitter
  autocmd!
  autocmd VimEnter * call _nvim_treesitter()
augroup END
function! _nvim_treesitter()
  hi TSVariable ctermfg=Grey guifg=#a0a8b0 cterm=none gui=none
  hi TSField ctermfg=Magenta guifg=#bd93f9
  hi TSProperty ctermfg=Magenta guifg=#bd93f9
endfunction
end " If has nvim

"NERDTree
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
      :NERDTreeToggle
    else
      :NERDTreeFind
    endif
endfunction

"VISUALS
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
set termguicolors

colorscheme gruvbox
set guifont=FiraCode\ Nerd\ Font\ Mono\
augroup my_colours
  autocmd!
  autocmd ColorScheme hi SpellBad cterm=reverse
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  " ALE
  highlight ALEErrorSign ctermbg=NONE ctermfg=red guifg=red
  " highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guifg=#ffff00
  highlight ALEWarningSign ctermbg=NONE ctermfg=214 guifg=#fabd2f
  highlight ALEError ctermbg=none cterm=underline gui=undercurl
  highlight ALEWarning ctermbg=none cterm=underline gui=undercurl
  highlight ALEErrorLine ctermbg=none cterm=None
  highlight ALEWarningLine ctermbg=none cterm=None
  " COC
  hi CocHighlightText ctermbg=241 guibg=#665c54
  hi! link CocHoverRange CocHighlightText
  " Gitgutter
  highlight GitGutterAdd    ctermfg=40 guifg=#00d700
  highlight GitGutterChange ctermfg=93 guifg=#8700ff
  highlight GitGutterDelete ctermfg=1 guifg=#f70000
  hi clear SignColumn
  " quick-scope
  highlight QuickScopePrimary guifg=#afff5f gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg=#5fffff gui=underline ctermfg=81 cterm=underline
  " startify
  hi StartifyFooter        guifg=NONE guibg=NONE gui=NONE
augroup END
" nvim-colorizer
if has ('nvim')
  lua require'colorizer'.setup()
endif
