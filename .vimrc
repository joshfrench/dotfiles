set nocompatible                            " be vIMproved!

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-surround'
Bundle 'AutoClose'
Bundle 'kien/ctrlp.vim'
Bundle 'tComment'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'

Bundle 'scrooloose/syntastic'
Bundle 'vim-coffee-script'
Bundle 'elzr/vim-json'
Bundle 'vim-javascript'
Bundle 'vim-less'
Bundle 'HTML-AutoCloseTag'
Bundle 'Better-CSS-Syntax-for-Vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'

" VIM UI
filetype plugin indent on                 " auto detect filetypes
syntax on                                 " syntax highlighting
set mouse=a                               " allow mouse
set mousehide                             " hide cursor when typing
scriptencoding utf-8
set background=dark                       " assume dark BG
set shortmess+=filmnrxoOtT                " shorter messages & prompts
set viewoptions=folds,options,cursor,unix,slash " unix compat
set virtualedit=onemore                   " allow cursor past EOL
set history=1000
set spell
set hidden                                " switch buffers w/out save
set switchbuf=usetab,newtab               " open buffers in tabs"
set nobackup
set noswapfile

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
color solarized

" switch to current directory when opening a new buffer
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set tabpagemax=15                         " max 15 tabs

" Toggle relative numbers by mode
set rnu
autocmd InsertEnter * :set nu nornu
autocmd InsertLeave * :set nonu rnu

" match gutters to BG
hi clear SignColumn
hi clear LineNr
hi CursorLineNr ctermfg=15
"80 column shading looks awful on solarized
"let &colorcolumn=join(range(81,999),",")
"hi ColorColumn ctermbg=0

" Statusline
set laststatus=2                          " status bar in all modes
let g:airline_left_sep=''                 " don't show silly arrows
let g:airline_right_sep=''
let g:airline_section_x=''                " turn off filetype info
let g:airline_section_y=''

set backspace=indent,eol,start            " backspace ALL the things!
set showmatch                             " hl matching pairs
set incsearch                             " search as you type
set hlsearch                              " hl search terms
set ignorecase                            " ignore case when searching
set smartcase                             " case-sensitive IF uppercase present
set wildmenu                              " show list instead of autocomplete
set wildmode=list:longest,full            " wildmenu completion options
set whichwrap=b,s,h,l,<,>,[,]             " motion keys can wrap on line ends
set scrolljump=5                          " how far to scroll when cursor leaves screen
set scrolloff=3                           " keep X lines above/below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " highlight whitespace

" Formatting
set nowrap                                " don't soft-wrap text
set autoindent                            " match indentation of prev line
set shiftwidth=2                          " tabstop to use when reindenting
set tabstop=2
set softtabstop=2
set expandtab                             " use spaces when hitting TAB
set nojoinspaces                          " prevent extra spaces when joining with J

" Key mappings
map <C-h> <C-w>h                          " easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <S-H> gT                              " easy tab navigation
map <S-L> gt

" Typo fixes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
cmap Tabe tabe

nnoremap Y y$                             " consistent with C and D behavior

" toggle search highlighting
nmap <silent> <leader><space> :set invhlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" search with regexps
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>A :Ack

" Plugins
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.git']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Remap to old TextMate binding
let g:tcommentMapLeader1='<C-\>'
