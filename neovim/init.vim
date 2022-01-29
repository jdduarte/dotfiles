call plug#begin()
  " Plugin section

  " NERDTree
  Plug 'scrooloose/nerdtree'

  " ctrlp to easily search for files
  Plug 'https://github.com/ctrlpvim/ctrlp.vim'

  " Conqueror of completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Automatic close of brackets, quotes, etc.
  Plug 'https://github.com/Raimondi/delimitMate'

  " Javascript syntax and ident
  Plug 'https://github.com/pangloss/vim-javascript'

  " Typescript
  Plug 'leafgarland/typescript-vim'

  " JSX pretty
  Plug 'maxmellon/vim-jsx-pretty'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " Airline
  Plug 'https://github.com/vim-airline/vim-airline'

  " File type icons
  Plug 'ryanoasis/vim-devicons'

call plug#end()

" Config section

" Enable 24 bit colors and syntax highlighting
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" Use Dracula Pro
packadd! dracula_pro
let g:dracula_colorterm = 0
colorscheme dracula_pro

" Set backspace behaviour.
set backspace=indent,eol,start

" Share system clipboard
set clipboard=unnamed

" use mouse on the terminal
set mouse=a

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
set shiftwidth=2
set softtabstop=2

" Set the ruler at 100 chars
set colorcolumn=100
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

" Persistent undo
set undofile
set undodir=$HOME/.nvim/undo
set undolevels=1000
set undoreload=10000

" Nerdtree configurations
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>nt :NERDTreeToggle<cr>

" Let ctrlp use ag
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ignore dirs for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" CoC configuration
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint']
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Airline options
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula_pro'
