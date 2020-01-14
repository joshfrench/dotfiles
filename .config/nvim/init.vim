" ~/.config/nvim/init.vim

"{{{ Basic behavior
scriptencoding utf-8
set nobackup                              " stop with this nonsense
set noswapfile
set undofile                              " peristent undo is nice though
set undodir=~/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000
set ttimeoutlen=0                         " no delay when <esc> exits imode
runtime macros/matchit.vim
"}}}

"{{{ VIM UI
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark                       " assume dark BG
set shortmess+=filmnrxoOtTc               " shorter messages & prompts
set viewoptions=folds,options,cursor,unix,slash " unix compat
set virtualedit=onemore                   " allow cursor past EOL
set history=1000
set hidden                                " switch buffers w/out save
set switchbuf=useopen,usetab              " use existing tabs but don't open new ones
set splitright
set splitbelow
set cursorline
set tabpagemax=15                         " max 15 tabs
set updatetime=250
set showmatch                             " hl matching pairs
set incsearch                             " search as you type
set hlsearch                              " hl search terms
set ignorecase                            " ignore case when searching
set smartcase                             " case-sensitive IF uppercase present
set wildmenu                              " show list instead of autocomplete
set wildmode=list:longest,full            " wildmenu completion options
set wildignore+=*/tmp/*,*/sourcemaps/*,*/node_modules/*    " ignore some junk
set whichwrap=b,s,h,l,<,>,[,]             " motion keys can wrap on line ends
set scrolljump=3                          " how far to scroll when cursor leaves screen
set scrolloff=3                           " keep X lines above/below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " highlight whitespace
set foldmethod=marker
set linebreak                             " softwrap at word boundaries
"}}}

"{{{ Relative numbers
set rnu
set nu
augroup numbertoggle
  au! WinEnter,FocusGained,InsertLeave * if &ft != 'nerdtree' | set rnu
  au! WinLeave,FocusLost,InsertEnter * if &ft != 'nerdtree' | set nornu
augroup END
"}}}

"{{{ Statusline
set laststatus=2                          " status bar in all modes
set noshowmode                            " already displayed in statusline
"}}}

"{{{ Copy/Paste
set clipboard=unnamed                     " use system clipboard
set backspace=indent,eol,start            " backspace ALL the things!
nnoremap <silent> <leader>p :set invpaste<CR> " Toggle paste with extra verbosity (since showcmd is off)
inoremap <leader>p <C-O>:set paste<CR>
set pastetoggle=<leader>p
"}}}

"{{{ Formatting
set wrap                                  " yes soft-wrap text
set autoindent                            " match indentation of prev line
set shiftwidth=2                          " tabstop to use when reindenting
set shiftround                            " round to shiftwidth when realigning
set tabstop=2
set softtabstop=2
set expandtab                             " use spaces when hitting TAB
set nojoinspaces                          " prevent extra spaces when joining with J
"}}}

"{{{ Do what I mean, not what I type
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Bd bd<bang>
cmap Tabe tabe
"}}}

"{{{ Keymapping
map <S-H> gT                              " tab navigation
map <S-L> gt
nnoremap Y y$                             " Consistent with C and D
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

nnoremap <leader>A :Rg<CR>

vmap <bs> x

nnoremap <leader>B :ls<CR>:b
nnoremap <leader>b :Buffers<CR>
"}}}

"{{{ Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'alvan/vim-closetag'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jpalardy/vim-slime'
call plug#end()
"}}}

"{{{ Colorscheme
colorscheme solarized8
let g:solarized_termtrans=1
let g:solarized_visibility="low"
let g:solarized_diffmode="low"
let g:solarized_extra_hi_groups = 1
"}}}

"{{{ Spelling
augroup spelling
    autocmd FileType markdown,md,txt setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt setlocal spell
augroup END
"}}}

"{{{ NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif

map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.git']
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=3
let NERDTreeQuitOnOpen=1
function! SetNerdWidth()
  let width = winwidth(0) > s:medium ? 44 : 32
  let g:NERDTreeWinSize=width
endfunction
augroup nerdwidth
  au! VimEnter,VimResized * call SetNerdWidth()
augroup END

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "x",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:webdevicons_conceal_nerdtree_brackets=1
"}}}

"{{{ MatchTagAlways
let g:mta_filetypes = {
 \ 'javascript': 1,
 \ 'javascript.jsx': 1,
 \ 'typescript': 1,
 \ 'typescript.tsx': 1,
 \ 'html' : 1,
 \ 'xhtml' : 1,
 \ 'xml' : 1
\ }
"}}}

"{{{ fzf
let g:fzf_layout = { 'down': '~20%' }
map <C-t> :Files<CR>

command! -bang -nargs=* FuzzyFind
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --smart-case --hidden --follow --color "always" --colors "path:fg:4" --colors "line:fg:2" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
map <leader>F :FuzzyFind<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --colors "path:fg:4" --colors "line:fg:2" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"}}}

"{{{ TComment
let g:tcomment_mapleader1='<C-\>'
"}}}

"{{{ Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,javascript,javascriptreact,jsx,typescriptreact'
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.tsx'
let g:closetag_xhtml_filetypes = 'xhtml,js,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
"}}}

"{{{ AutoPairs
augroup ts_pairs
  autocmd FileType typescript let b:AutoPairs = AutoPairsDefine({'\w\zs<' : '>'})
augroup end
"}}}

"{{{ LightLine
let s:medium = 120

function! NoNerd(status)
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' : a:status
endfunction

function! LightlineFilename()
  let filename = winwidth(0) > s:medium ? expand('%:~:s?/src/medium/??') : expand('%:t')
  return NoNerd(filename)
endfunction

function! LightlinePWD()
  let pwd = winwidth(0) > s:medium ? fnamemodify(getcwd(), ':t') : ''
  return NoNerd(pwd)
endfunction

function! LightlineBranch()
  return NoNerd(fugitive#head())
endfunction

function! LightlineLinterErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let l:errors = get(info, 'error')
  return errors ? printf('%d', errors) : ''
endfunction

function! LightlineLinterWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let l:warnings = get(info, 'warning')
  return warnings ? printf('%d', warnings) : ''
endfunction

function! LightlineMode()
  return NoNerd(lightline#mode())
endfunction

function! LightlinePercent()
  return NoNerd('%3p%%')
endfunction

function! LightlineFT()
  return NoNerd('%{&ft!=#""?&ft:"no ft"}')
endfunction

function! LightlineLineInfo()
  return NoNerd('%3l:%-2v')
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left':  [ ['mode', 'paste'], ['pwd', 'gitbranch', 'filename'] ],
      \   'right': [ ['linter_warnings'], ['linter_errors'], ['lineinfo'], ['percent'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'gitbranch': 'LightlineBranch',
      \   'pwd': 'LightlinePWD',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_expand': {
      \   'percent': 'LightlinePercent',
      \   'filetype': 'LightlineFT',
      \   'lineinfo': 'LightlineLineInfo',
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ }
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"}}}

"{{{ Slime
let g:slime_target="tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
"}}}

"{{{ CoC
let g:javascript_plugin_flow = 1
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nnoremap <silent><leader>. :CocList actions<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"}}}

"{{{ Startify
let g:startify_bookmarks = [
      \ {'l': "${MONO_HOME}/ts/lite"},
      \ {'r': "${MONO_HOME}/ts/rito"},
      \ {'m': "${MONO_HOME}/medium2"},
      \ {'.': "~/dotfiles"}
\ ]

let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

let g:startify_change_to_dir = 0
" let g:startify_fortune_use_unicode = 1
let lines = winheight(0) > 38 ? 10 : 5
let g:startify_files_number = lines
let g:ascii = [
      \'.+@@@@@+       #@@@@*:',
      \'  .@@@@@=     *@@@@@  ',
      \'   @+@@@@-   =#@@@@@  ',
      \'   @ +@@@@: :% @@@@@  ',
      \'   @  *@@@@-%: @@@@@  ',
      \'   @   *@@@@-  @@@@@  ',
      \'  -@-   #@@+  :@@@@@: ',
      \'-#@@@#-  ##  =@@@@@@@='
      \]
let g:startify_custom_header= startify#pad(g:ascii)
"}}}

"{{{ Go
let g:go_def_mapping_enabled = 0 " let LSP handle this
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_echo_go_info = 0
let g:go_test_show_name = 1
let g:go_doc_popup_window = 1

augroup go_path
  autocmd FileType go GoPath $MONO_HOME/bazel-out/darwin-fastbuild/bin/darwin_amd64_stripped/go_path~:$GOPATH
augroup end
"}}}

"{{{ Stuff that needs to go last
syntax on
filetype plugin indent on

hi clear MatchParen
hi MatchParen cterm=reverse gui=reverse
hi CocHighlightText cterm=reverse gui=reverse
hi CocWarningSign guifg=#fab005
hi CocInfoSign guifg=#268bd2

augroup tsx_hi
  autocmd FileType typescript.tsx,typescriptreact syn clear xmlError
  autocmd FileType typescript.tsx,typescriptreact hi link xmlTagN Function " fix some schemes
augroup end
"}}}
