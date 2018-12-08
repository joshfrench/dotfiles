set nocompatible                          " be vIMproved!

" VIM UI
scriptencoding utf-8
set background=dark                       " assume dark BG
set shortmess+=filmnrxoOtT                " shorter messages & prompts
set viewoptions=folds,options,cursor,unix,slash " unix compat
set virtualedit=onemore                   " allow cursor past EOL
set history=1000
set spell
set hidden                                " switch buffers w/out save
set switchbuf=usetab,newtab               " open buffers in tabs
set splitright
set splitbelow
set cursorline

set tabpagemax=15                         " max 15 tabs

" Toggle relative numbers by mode
set rnu
set nu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu
hi CursorLineNr ctermbg=0 ctermfg=14


" Statusline
set laststatus=2                          " status bar in all modes

set noshowmode                            " already displayed in statusline

set clipboard=unnamed                     " use system clipboard
set backspace=indent,eol,start            " backspace ALL the things!
" Toggle paste with extra verbosity (since showcmd is off)
nmap <silent> <leader>v :set invpaste<CR>
imap <leader>v <C-O>:set paste<CR>
set pastetoggle=<leader>v
set showmatch                             " hl matching pairs
set incsearch                             " search as you type
set hlsearch                              " hl search terms
set ignorecase                            " ignore case when searching
set smartcase                             " case-sensitive IF uppercase present
set wildmenu                              " show list instead of autocomplete
set wildmode=list:longest,full            " wildmenu completion options
set wildignore+=*/tmp/*,*/sourcemaps/*,*/node_modules/*    " ignore some junk
set whichwrap=b,s,h,l,<,>,[,]             " motion keys can wrap on line ends
set scrolljump=5                          " how far to scroll when cursor leaves screen
set scrolloff=3                           " keep X lines above/below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " highlight whitespace
set nobackup                              " stop with this nonsense
set noswapfile
set undofile                              " peristent undo is nice though
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set ttimeoutlen=0                         " no delay when <esc> exits imode

" Formatting
set nowrap                                " don't soft-wrap text
set autoindent                            " match indentation of prev line
set shiftwidth=2                          " tabstop to use when reindenting
set shiftround                            " round to shiftwidth when realigning
set tabstop=2
set softtabstop=2
set expandtab                             " use spaces when hitting TAB
set nojoinspaces                          " prevent extra spaces when joining with J

" Key mappings
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

" Remap to old TextMate binding
let g:tcommentMapLeader1='<C-\>'

set updatetime=250

filetype plugin on
filetype indent on
filetype plugin indent on                 " auto detect filetypes
syntax on                                 " syntax highlighting
