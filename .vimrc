set nocompatible

" vim-plug configurationn here:
call plug#begin('~/.vim/plugged')

" Javascript syntax and ident.
Plug 'https://github.com/pangloss/vim-javascript'

" Automatic close of brackets, quotes, etc.
Plug 'https://github.com/Raimondi/delimitMate'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree'

" Airline
Plug 'https://github.com/vim-airline/vim-airline'

" ctrlp to easily search for files.
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" Multiple cursors.
Plug 'https://github.com/terryma/vim-multiple-cursors'

" Auto complete
Plug 'https://github.com/Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

" Threepwood's configuration here:
"
" Set backspace behaviour.
set backspace=indent,eol,start
"
" Enable 24bit colors and syntax highlighting.
syntax on
set termguicolors

" Set the color scheme (available under ~/.vim/colors)
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

" Set the ruler at 100 chars
set colorcolumn=101
highlight ColorColumn guibg=Gray14

" Searching
set ignorecase " ignore case when searching
set smartcase " unless the search term contains uppercase chars
set incsearch " find the next match as the search term is being typed
set hlsearch " highlight search matches

" Mappings for buffer manipulation
map <c-j> :bp!<cr>
map <c-k> :bn!<cr>
" map <Leader>bd :bd<cr>
map <Leader>bd :bp\|bd #<cr>
map <c-b> :b#<cr>

" Share the system clipboard
set clipboard=unnamed

" Options for NERDTree and mappings
let NERDTreeShowHidden=1
map <Leader>nt :NERDTreeToggle<cr>

" Quits vim if teh NERDTree is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline options
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Some file types configs
autocmd filetype make setlocal noexpandtab

" Let ctrlp use ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ignore dirs for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Syntastic configuration
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" Enable JSDoc highlighting
let g:javascript_plugin_jsdoc = 1
