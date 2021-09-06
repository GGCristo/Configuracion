set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
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
set signcolumn=yes
set updatetime=100

" Abbrevation
iabbrev Vector vector

" Terminal
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>
tnoremap <C-K> <C-\><C-N><C-W>k

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
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted 
augroup END

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
  Plug 'liuchengxu/vista.vim'
  Plug 'kassio/neoterm'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'ggandor/lightspeed.nvim'
  Plug 'junegunn/fzf.vim'
  Plug 'windwp/nvim-autopairs'
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'onsails/lspkind-nvim'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'folke/trouble.nvim'
  if has ('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'antoinemadec/FixCursorHold.nvim'
  end
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/glyph-palette.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  " Plug 'dense-analysis/ale'
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  " Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'

  Plug 'rbong/vim-crystalline'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'mhinz/vim-startify'
  Plug 'puremourning/vimspector'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/vim-easy-align'
  Plug 'simnalamburt/vim-mundo'
  Plug 'haya14busa/incsearch.vim'
  Plug 'dstein64/vim-startuptime'
  Plug 'ericcurtin/CurtineIncSw.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'Yggdroot/indentLine'
  Plug 'unblevable/quick-scope'
  Plug 'markonm/traces.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'gruvbox-community/gruvbox'
  Plug 'vim-test/vim-test'
call plug#end()

" Functions
function! Building(modo)
  " :ALEDisable
if (a:modo != "Debug")
  :AsyncTask project-build
else
  :AsyncTask project-build-debug
endif
endfunction

function! Running(modo)
if (a:modo != "test")
  :AsyncTask project-run
else
  :AsyncTask project-run-myTest
endif
endfunction

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! execute a:command
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
noremap <silent><F3> :call asyncrun#quickfix_toggle(13)<cr>
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

let modo = "build"

autocmd VimEnter cpp call Building(modo)
nnoremap <silent><F2> :TroubleToggle<cr>
nnoremap <silent><F4> :call Building(modo)<cr>
nnoremap <silent><leader><F4> :call Running(modo)<cr>
nnoremap <silent><leader>cl :AsyncTask project-clean<cr>:echo "🚿Se usó clean🚿"<cr>
" nnoremap <expr><silent><leader>cs ((modo) ? ':let modo=0' : ':let modo=1')."\<cr>"
nnoremap <silent><leader>csb :let modo="build"<cr> :AsyncTask project-generate<cr>
nnoremap <silent><leader>csd :let modo="Debug"<cr> :AsyncTask project-generate-debug<cr>
nnoremap <silent><leader>cst :let modo="test"<cr> :AsyncTask project-generate-test<cr>

nnoremap <silent><F7> :MundoToggle<CR>

if executable("cppcheck")
  nnoremap <silent><F8> :!clear<cr>:!cppcheck --enable=all --suppress=missingIncludeSystem . -itest/ -ibuild/ -iDebug/ -i.ccls-cache/<CR>
else
  nnoremap <silent><F8> :echo "Instala cppcheck"<CR>
endif

nnoremap <silent><F12> :Fern . -drawer -toggle<cr>

nnoremap <silent><leader><leader> :call CurtineIncSw()<cr>
nnoremap <silent><leader>bk :call vimspector#ToggleBreakpoint()<cr>
"nnoremap ,,  mtA;<Esc>`t
nnoremap <silent><C-S> :update<cr>:echo 'Buffer actual guardado🖪'<cr>
inoremap <silent><C-S> <esc>:update<cr>:echo 'Buffer actual guardado'<cr>
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
nnoremap <silent><leader>s :Vista finder nvim_lsp<cr>
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Commits<cr>
nnoremap <silent><leader>gb :GBranches<cr>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gs :G<CR>
nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gh :!gh repo view -w<CR>
"map <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

inoremap jj <Esc>lmtA;<Esc>`t
inoremap jk <Esc>
inoremap <C-H> <Left>
inoremap <C-J> <Left>
inoremap <C-K> <Right>
inoremap <C-L> <Right>
vnoremap <silent><Up> :m '<-2<CR>gv=gv
vnoremap <silent><Down> :m '>+1<CR>gv=gv

nnoremap <silent><Tab> :bn<CR>
nnoremap <silent><S-Tab> :bp<CR>

map <silent><leader>bd :call Preserve("%bd<bar>e#<bar>bd#")<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgn
map Y y$
nnoremap n nzz
nnoremap N nzz
nnoremap [[ ][%_

" Easy paste above/below
nnoremap <silent><leader>p :put<CR>
nnoremap <silent><leader><S-p> :put!<CR>

" Spelling
command! WQ wq
command! Wq wq
command! W w
command! Q q

" LSP
lua << EOF
require'lspconfig'.ccls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi link LspReferenceRead Visual
      hi link LspReferenceText Visual
      hi link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "GruvboxAqua"})
  cfg = {
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter
    hint_scheme = "String",
    }
  require "lsp_signature".on_attach(cfg) 
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"ccls", "gopls", "tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
require('lspkind').init({
-- enables text annotations
--
-- default: true
with_text = true,

-- default symbol map
-- can be either 'default' or
-- 'codicons' for codicon preset (requires vscode-codicons font installed)
--
-- default: 'default'
preset = 'codicons',

-- override preset symbols
--
-- default: {}
symbol_map = {
  Text = '',
  Method = 'ƒ',
  Function = '',
  Constructor = '',
  Variable = '',
  Class = '',
  Interface = 'ﰮ',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '了',
  Keyword = '',
  Snippet = '﬌',
  Color = '',
  File = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = ''
  },
})
EOF

" COMP
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
set completeopt=menuone,noselect
lua << EOF
-- Compe setup
require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'disable';
throttle_time = 80;
source_timeout = 200;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = true;

source = {
  path = true;
  buffer = true;
  calc = true;
  nvim_lsp = true;
  };
}

local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
local col = vim.fn.col('.') - 1
if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
  return true
else
  return false
end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-n>"
elseif check_back_space() then
  return t "<Tab>"
else
  return vim.fn['compe#complete']()
end
end
_G.s_tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-p>"
else
  return t "<S-Tab>"
end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF


" windwp/nvim-autopairs
lua << EOF
require('nvim-autopairs').setup{}
EOF

" Trouble
lua << EOF
require("trouble").setup {}
EOF

" lightspeed
lua << EOF
require'lightspeed'.setup {
   jump_to_first_match = true,
   jump_on_partial_input_safety_timeout = 400,
   highlight_unique_chars = false,
   grey_out_search_area = true,
   match_only_the_start_of_same_char_seqs = true,
   limit_ft_matches = 5,
   full_inclusive_prefix_key = '<c-x>',
}
EOF

" FZF
" imap <C-X><C-L> <plug>(fzf-complete-line)
set rtp+=~/.fzf
let g:fzf_buffers_jump = 1

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
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

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

"Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_install_gadgets = [ 'vscode-cpptools', 'vscode-go' ]

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

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

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]

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

"vim-peekaboo
let g:peekaboo_delay = 600

"vim-crystalline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%d✘ %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

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
    " let l:s .= crystalline#right_sep('Fill', 'Fill') . ' %{LinterStatus()}'
  endif

  let l:s .= '%='

  if a:current
    " let l:s .= crystalline#left_sep('Fill', 'Fill') . '%{coc#status()}'
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{modo}'
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
    " return l:left . l:short_name . ' ' . WebDevIconsGetFileTypeSymbol(l:name) . (l:right ==# ' ' ? '' : ' ') . l:right
    return l:left . l:short_name . ' ' . nerdfont#find(l:name) . (l:right ==# ' ' ? '' : ' ') . l:right
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

" let g:crystalline_tabline_fn = 'TabLine'
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
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=250, on_visual=true}

"asyncrun
let g:asyncrun_rootmarks = ['src', '.git']
" let g:asynctasks_term_pos = 'tab'
" let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 15    " set height for the horizontal terminal split
let g:asynctasks_term_reuse = 1
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -bang -bar -nargs=* Gpush execute 'AsyncRun<bang> -cwd=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'AsyncRun<bang> -cwd=' .
      \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

" vim-doge
let g:doge_comment_jump_modes = ['n', 's']

" neoterm
" (https://superuser.com/questions/410847/how-do-you-create-a-vim-key-mapping-that-requires-numbers-before-the-hotkey-lik)
nnoremap <leader>t :<C-U>exe v:count . 'Ttoggle'<cr>

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
require "bufferline".setup {
  options = {
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 18,
  enforce_regular_tabs = true,
  view = "multiwindow",
  show_buffer_close_icons = true,
  separator_style = "thin",
  diagnostics = "nvim_lsp",
  diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local icon = level:match("error") and " " or " "
  return " " .. icon .. count
end
},
highlights = {
  background = {
    guifg = "Normal",
    guibg = "Normal"
    },
  fill = {
    guifg = "Normal",
    guibg = "Normal"
    },
  buffer_selected = {
    guifg = normal_fg,
    guibg = "#3A3E44",
    gui = "bold"
    },
  separator_visible = {
    guifg = "#282828",
    guibg = "#282828"
    },
  separator_selected = {
    guifg = "#282828",
    guibg = "#282828"
    },
  separator = {
    guifg = "#282828",
    guibg = "#282828"
    },
  indicator_selected = {
    guifg = "#282828",
    guibg = "#282828"
    },
  modified_selected = {
    guifg = string_fg,
    guibg = "Normal"
    }
  }
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

" Fern
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
function! s:init_fern() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )

  nmap <buffer><nowait> <Tab> <Plug>(fern-my-expand-or-collapse)
endfunction

let g:fern#renderer = "nerdfont"
let g:fern#hide_cursor = 1
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"VISUALS
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
set termguicolors

colorscheme gruvbox
set guifont=FiraCode\ Nerd\ Font\ Mono\
hi PmenuSel guibg=#98c379"
hi PmenuSbar guibg =#353b45"
hi PmenuThumb guibg =#81A1C1"
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
