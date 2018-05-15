" Vi互換
set nocompatible
" 基本設定
set number
set nowrap
set nobackup
set noswapfile
set ruler
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L
set noundofile

noremap <C-n><C-n> :NERDTreeToggle<CR>
noremap 0 <HOME>
noremap 9 <END>
noremap u :undo<CR>
noremap U :redo<CR>
noremap gt :tabnext<CR>
noremap GT :tabprevious<CR>
noremap tt :tabnew<CR>

" エンコーディング
set fileformat=unix
set fileencoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" インデント設定
set tabstop=4
set shiftwidth=4
set expandtab
set noautoindent
set nosmartindent

augroup vimrc
    autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
    autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
    autocmd! FileType vb setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    autocmd! FileType aspvbs setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    "    autocmd! FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    autocmd! FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
augroup END

" 検索
set wrapscan
set ignorecase
set smartcase
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" 挿入モード
inoremap <C-p> <esc>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" inoremap {} {}<Left>
" inoremap [] []<Left>
" inoremap () ()<Left>
" inoremap <> <><Left>
" inoremap "" ""<Left>
" inoremap '' ''<Left>
" inoremap ?? ??<Left>
" inoremap %% %%<Left>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplcache')
call dein#add('kchmck/vim-coffee-script')
call dein#add('mattn/emmet-vim')
call dein#add('szw/vim-tags')
call dein#add('junegunn/vim-easy-align')
call dein#add('tomasr/molokai')
call dein#add('sjl/badwolf')
call dein#add('KKPMW/moonshine-vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" ----------------------
" Plugin emmet
" ----------------------
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_settings = {
\'lang': 'ja'
\}

" ----------------------
" colorscheme
" ----------------------
syntax on
colorscheme molokai
highlight Normal ctermbg=none

" ----------------------
" EasyAlign
" ----------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ----------------------
" Plugin NERDTree
" ----------------------
"let g:NERDTreeWinSize = 40

" ----------------------
" Plugin neocomplcache
" ----------------------
let g:neocomplcache_enable_at_start = 1
let g:neocomplcache_max_list = 20
autocmd FileType php :set dict+=$NEOBUNDLE_DIR/dict/PHP.dict

" ----------------------
" Plugin neosnippet
" ----------------------
" imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <C-k> <Plug>(neocomplcache_snippets_expand)

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:neosnippet#snippets_directory=$NEOBUNDLE_DIR.'vim-snippets/snippets,'.$NEOBUNDLE_DIR.'/snippets'

" ----------------------
" Plugin vim-coffee-script
" ----------------------
autocmd BufWritePost *.coffee silent CoffeeMake! -c

" ----------------------
" Plugin vim-tags
" ----------------------
"autocmd BufNewFile, BufRead *.vb let g:vim_tags_project_tags_command = "ctags --excmd=number -R --languages=Basic --langmap=Basic:.vb --basic-types=-l {OPTIONS} {DIRECTORY} 2>/dev/null"
"autocmd BufNewFile, BufRead *.cs let g:vim_tags_project_tags_command = "ctags --excmd=number -R --languages=C# --langmap=C#:.cs --basic-types=-l {OPTIONS} {DIRECTORY} 2>/dev/null"

