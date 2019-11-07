set nocompatible

" vim-plug configurationn here:
call plug#begin('~/.vim/plugged')

" Base16 colors
Plug 'chriskempson/base16-vim'

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

" dbext
Plug 'https://github.com/vim-scripts/dbext.vim'

" Syntastic
Plug 'https://github.com/vim-syntastic/syntastic'

" Smooth scroll
Plug 'https://github.com/terryma/vim-smooth-scroll'

" Git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tommcdo/vim-fubitive'

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
colorscheme base16-gruvbox-dark-pale

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

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Options for NERDTree and mappings
let NERDTreeShowHidden=1
map <Leader>nt :NERDTreeToggle<cr>

" Quits vim if teh NERDTree is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use omnicompletion with ctrl+space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

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
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Enable JSDoc highlighting
let g:javascript_plugin_jsdoc = 1

" Set the dbext PostgreSQL profile
let g:dbext_default_profile_PG = 'type=PGSQL:user=reg:passwd=regregreg:host=localhost:port=5432:dbname=elgin'
