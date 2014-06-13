
syntax on

autocmd  QuickFixCmdPost *grep* cwindow

":NeoBundleInstall でインストルできる
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'y-uuki/perl-local-lib-path,vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'smartchr'

"quickrun を横に表示する
let g:quickrun_config={'*': {'split': 'vertical'}}

"syntastic on
let g:syntastic_enable_signs=1
let g:syntastic_enable_perl_checker=1
let g:syntastic_auto_loc_list=2

"splitは下にvsplitは右に表示
set splitbelow
set splitright
"smartchr
"inoremap  <expr> = smartchr#loop('=', ' = ', ' == ') 
augroup filetypedetect
 au BufNewFile, BufRead *.psgi  setf perl
 au BufNewFile, BufRead *.t  setf perl
 au BufNewFile, BufRead *.tt  setf tt2html
 au BufNewFile, BufRead *.tt2  setf tt2html
 au BufNewFile, BufRead cpanfile  setf perl
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
augroup END

 filetype plugin indent on     " required!
 filetype indent on

"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

  let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
  \ }

" Define keyword.  
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] ='\h\w*'

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ?
  "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)


set nocp
filetype plugin on


nmap <Leader>r <Plug>(quickrun)
"""""smart move for nakanou
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

""""" Map the key sequence
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
" map <C-N> :bnext<CR>
" map <C-P> :bprevious<CR>
map <C-N> :tabnext<CR>
map <C-P> :tabprevious<CR>
map <C-M> :noh<CR>
" vmap .s :s/。/．/g<CR>
" vmap ,s :s/、/，/g<CR>

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

""" Number of speces that a <Tab> in the file counts for
set tabstop=4 shiftwidth=2 softtabstop=2 textwidth=0
""" Use the appropriate number of spaces to insert a <Tab>
set expandtab
""" Precede each line with its line number
set number
""" Don't give the intro message when starting Vim
set shortmess+=I
""" Print the current language
" language en
""" tags
set tags=tags;/

""" Incremental search
set incsearch
""" hilight with searching
set hlsearch
""" The case of normal letters is ignored
set ignorecase
""" Override the 'ignorecase' option if the search pattern contains upper case
"   characters
set smartcase
""" Copy indent from current line when starting a new line
set autoindent
""" Do smart autoindenting when starting a new line
" set smartindent
""" Do autoindenting when starting a new line according the C indenting rules
set cindent
""" A backup of the original file is made
"set backup
""" List of directories for the backup file, separated with commas
"set backupdir=$HOME/.tmp/
""" When a bracket is inserted, briefly jump to the matching one
set showmatch
""" Command-line completion operates in an enhanced mode
set wildmenu
""" What bases Vim will consider for numbers when using the CTRL-A and CTRL-X
"   commands
set nrformats-=octal
""" Display unprintable characters
set list
""" Strings to use in 'list' mode
set listchars=tab:^-,extends:<,trail:- ",eol:^
""" Searches do not wrap around the end of the file.
set nowrapscan
""" same as ":set backspace=indent,eol,start"
set backspace=2

"---------------------------------------------------------------------------
" for comment out
"---------------------------------------------------------------------------
iabbrev #a /****************************************************************************
iabbrev #A ****************************************************************************/
iabbrev #b /*-------------------------------------------------------------------------*\
iabbrev #B \*-------------------------------------------------------------------------*/
iabbrev #c /*>>>>>>>>>>>>>>>
iabbrev #C <<<<<<<<<<<<<<<*/
iabbrev #d /*--------------->
iabbrev #D <---------------*/

set encoding=utf-8
set fileencoding=utf-8
