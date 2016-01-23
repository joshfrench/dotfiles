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
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'tComment'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-dispatch'
Bundle 'thoughtbot/vim-rspec'

Bundle 'scrooloose/syntastic'
Bundle 'vim-coffee-script'
Bundle 'elzr/vim-json'
Bundle 'mxw/vim-jsx'
Bundle 'vim-es6'
Bundle 'vim-less'
Bundle 'lambdatoast/elm.vim'
Bundle 'HTML-AutoCloseTag'
Bundle 'Better-CSS-Syntax-for-Vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-salve'
Bundle 'tpope/vim-fireplace'
Bundle 'venantius/vim-eastwood'
Bundle 'paredit.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'

runtime macros/matchit.vim

" VIM UI
filetype plugin indent on                 " auto detect filetypes
syntax on                                 " syntax highlighting
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

let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
color solarized

let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

set tabpagemax=15                         " max 15 tabs

" Toggle relative numbers by mode
set rnu
set nu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu
hi CursorLineNr ctermbg=0 ctermfg=14


" Statusline
set laststatus=2                          " status bar in all modes
let g:airline_left_sep=''                 " don't show silly arrows
let g:airline_right_sep=''
let g:airline_section_x=''                " turn off filetype info
let g:airline_section_y=''
let g:airline_section_b='%{fnamemodify(getcwd(), ":t")}@%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'

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
set wildignore+=*/tmp/*,*/sourcemaps/*,*/node_modules/*    " ignore some junk"
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

" Plugins
map <C-e> :NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.git']
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_focus_on_files=1

" Remap to old TextMate binding
let g:tcommentMapLeader1='<C-\>'

" Set ctrlp working dir to project root
let g:ctrlp_working_path_mode = 'ra'

function! AirlineThemePatch(palette)
  let s:solar_blue = [ '#eee8d5', '#268bd2', 7, 4 ]
  let a:palette.insert.airline_a = s:solar_blue
  let a:palette.insert.airline_z = s:solar_blue
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

" Autoload rainbow parens for Clojure
augroup rainbow_parentheses
  autocmd Syntax clojure RainbowParenthesesActivate
  autocmd Syntax clojure RainbowParenthesesLoadRound
  autocmd Syntax clojure RainbowParenthesesLoadSquare
  autocmd Syntax clojure RainbowParenthesesLoadBraces
augroup END

" Smart jump is aware that Clojure uses [] and {} as well as ()
let g:paredit_smartjump = 1
" Not into this behavior
let g:paredit_electric_return = 0
" Use system leader
let g:paredit_leader = '\'

" Fix some clojure indentations
" https://github.com/guns/vim-clojure-static
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let',
                                      \ '^fnk', '^dfnk',
                                      \ '^query', '^render', '^params', '^ident'
                                      \ ]
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
let g:clojure_align_multiline_strings = 1
" add some common keywords
let g:clojure_syntax_keywords = {
      \ 'clojuremacro': ["defui"]
      \ }

let g:syntastic_javascript_checkers = ['jsxhint']

" vim-rspec mappings
map <Leader>s :call RunCurrentSpecFile()<CR>   " run (s)pec file
map <Leader>t :call RunNearestSpec()<CR>       " run (t)his spec
map <Leader>l :call RunLastSpec()<CR>          " run (l)ast spec
map <Leader>r :call RunAllSpecs()<CR>          " run (r)spec all

let g:rspec_command = 'compiler rspec | set makeprg=spring | Make rspec {spec}'

" Filetypes
au BufNewFile,BufRead *.boot set filetype=clojure
