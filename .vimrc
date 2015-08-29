set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins for JavaScript syntax highlight and ident guides
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
"Plugin 'Yggdroot/indentLine'

" Plugin for automating close of brackets, quotes, etc.
Plugin 'Raimondi/delimitMate'

" Linting plugin for hook up with JSHint
Plugin 'scrooloose/syntastic'

" Nerd tree
Plugin 'scrooloose/nerdtree'

" Airline
Plugin 'bling/vim-airline'

" Auto completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

" ctrlp to easily open files
Plugin 'kien/ctrlp.vim'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Threepwood's configuration here:
"
" Enable the 256 colour pallet, enable syntax highlighting, let Vim know we
" want a dark background and light foreground and finally set a different
" colour scheme.
set t_Co=256
syntax on
set background=dark
colorscheme molokai

" use mouse on the terminal
set mouse=a 
set ttymouse=xterm2

" Set line numbers ON
set number

" Highlight the current line
set cursorline

" Set line endins ON
set listchars=tab:▸\ ,eol:¬,nbsp:☠
set list

" Disable line wrap
set nowrap
set textwidth=0
set wrapmargin=0

" Set the identation configuration
set expandtab
set shiftwidth=4
set softtabstop=4

" Set the ruler at 80 chars
set colorcolumn=81
highlight ColorColumn guibg=Gray14
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Searching
set ignorecase " ignore case when searching
set smartcase " unless the search term contains uppercase chars
set incsearch " find the next match as the search term is being typed
set hlsearch " highlight search matches

" Mappings for buffer manipulation
map <c-n> :bp!<cr>
map <c-m> :bn!<cr>
" map <Leader>bd :bd<cr>
map <Leader>bd :bp\|bd #<cr>
map <c-b> :b#<cr>

" Share the system clipboard
set clipboard=unnamed

" Options for NERDTree and mappings
let NERDTreeShowHidden=1
map <Leader>nt :NERDTreeToggle<cr>

" Quits vim if teh NERDTree is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline options
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Some file types configs
autocmd filetype make setlocal noexpandtab

" Ignore dirs for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Syntastic configuration
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
