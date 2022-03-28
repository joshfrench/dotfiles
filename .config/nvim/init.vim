" ~/.config/nvim/init.vim

"{{{ Basic behavior
set nocompatible
scriptencoding utf-8
set nobackup                              " stop with this nonsense
set noswapfile
set undofile                              " peristent undo is nice though
set undodir=~/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000
set ttimeoutlen=0                         " no delay when <esc> exits imode
runtime macros/matchit.vim
set shell=/bin/bash\ -i
"}}}

"{{{ VIM UI
set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " fixes background in true color mode
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_Cs = "\e[4:3m"                     " undercurl support
let &t_Ce = "\e[4:0m"
set background=dark                       " assume dark BG
set winblend=0                            " no transparency on floating windows
set shortmess+=filmnrxoOtTc               " shorter messages & prompts
set viewoptions=folds,options,cursor,unix,slash " unix compat
set virtualedit=onemore                   " allow cursor past EOL
set history=1000
set hidden                                " switch buffers w/out save
set switchbuf=useopen,usetab,uselast      " use existing tabs but don't open new ones; open QF in last focused win
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
" set foldlevelstart=99
set linebreak                             " softwrap at word boundaries
set completeopt=menuone,noselect          " never autocomplete
set signcolumn=yes:1
" set signcolumn=number                   " not useful when gitgutter is noisy

let s:medium = 142                        " used for laptop/desktop UI tweaks
autocmd FileType qf wincmd J
"}}}

"{{{ mouse
set mouse=a
set mousefocus
set mousehide
set mousemodel=popup
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
" set nojoinspaces                        " prevent extra spaces when joining with J (on by default in 0.6)
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
cnoreabbrev git Git
"}}}

"{{{ Keymapping
map <S-H> gT                              " tab navigation
map <S-L> gt
" nnoremap Y y$                           " Consistent with C and D (on by default in 0.6)
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

vmap <bs> x

nnoremap <leader>B :ls<CR>:b
nnoremap <leader>b :Buffers<CR>

nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi

vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

"}}}

"{{{ Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug expand('~/dotfiles/lsp-fzf')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sbdchd/neoformat'
" Plug 'dense-analysis/ale'
Plug 'weilbith/nvim-code-action-menu'
Plug 'kosayoda/nvim-lightbulb'
Plug 'machakann/vim-highlightedyank'
Plug 'ray-x/lsp_signature.nvim'
Plug 'iamcco/diagnostic-languageserver'
Plug 'lifepillar/vim-solarized8'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/MatchTagAlways'
" Plug 'jiangmiao/auto-pairs'
Plug 'LunarWatcher/auto-pairs', {'tag': '*'}
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
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'ianks/vim-tsx'
Plug 'jparise/vim-graphql'
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
Plug 'chr4/nginx.vim'
Plug 'lepture/vim-jinja'
Plug 'hashivim/vim-terraform'
Plug 'plasticboy/vim-markdown'
Plug 'corriander/vim-markdown-indent'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'preservim/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-unimpaired'
Plug 'jpalardy/vim-slime'
Plug 'luochen1990/rainbow'
Plug expand('~/dotfiles/spacetoggle')
Plug 'ryanoasis/vim-devicons'
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
" Quit vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree if vim is started with no args
" autocmd VimEnter * if !argc() | NERDTree | wincmd w | endif

command! NERDTreeToggleRefresh :NERDTreeToggle<cr> | call nerdtree#ui_glue#invokeKeyMap('R')
map <C-e> :NERDTreeToggleRefresh<CR>
map <leader>e :NERDTreeFind<CR>

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\~$', '\.swo$', '\.swp$', '\.git$']
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=3
let NERDTreeQuitOnOpen=0
let NERDTreeAutoDeleteBuffer = 1
function! SetNerdWidth()
  let width = winwidth(0) > s:medium ? 44 : 32
  let g:NERDTreeWinSize=width
endfunction
augroup nerdwidth
  au! VimEnter,VimResized * call SetNerdWidth()
augroup END

let g:NERDTreeGitStatusIndicatorMapCustom = {
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
let g:DevIconsEnableFoldersOpenClose = 1
"}}}

"{{{ MatchTagAlways
let g:mta_filetypes = {
 \ 'javascript': 1,
 \ 'javascript.jsx': 1,
 \ 'typescript': 1,
 \ 'typescript.tsx': 1,
 \ 'html' : 1,
 \ 'vue': 1,
 \ 'xhtml' : 1,
 \ 'xml' : 1
\ }
"}}}

"{{{ Telescope
lua <<EOF
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local custom_actions = {}
function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.file_edit(prompt_bufnr)
    end
end
local multi_select = {
    i = {
        -- close on escape
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<cr>"] = custom_actions.fzf_multi_select
    },
    n = {
        ["<tab>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<cr>"] = custom_actions.fzf_multi_select
    }
  }
require'telescope'.setup{
  defaults = {
    path_display = {
      -- "shorten"
    },
  },
  pickers = {
    find_files = {
      mappings = multi_select
    },
    live_grep = {
      mappings = multi_select
    },
    lsp_references = {
      mappings = multi_select
    },
    lsp_code_actions = {
      layout_config={
        width=0.25,
        height=0.25
      },
      layout_strategy='cursor'
    }
  }
}
EOF
map <leader>A <cmd>lua require'telescope.builtin'.live_grep()<CR>
nnoremap <leader>t <cmd>lua require'telescope.builtin'.find_files()<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references()<CR>
" nnoremap <leader>. <cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>
"}}}

"{{{ CodeActionMenu
nnoremap <leader>. <cmd>CodeActionMenu<CR>
vnoremap <leader>. <cmd>CodeActionMenu<CR>
let g:code_action_menu_show_details = v:false
"}}}

"{{{ TComment
let g:tcomment_mapleader1='<C-\>'
"}}}

"{{{ Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.tsx,*.vue'
let g:closetag_filetypes = 'html,xhtml,javascript,javascriptreact,jsx,typescriptreact,typescript.tsx,vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.tsx,*.vue'
let g:closetag_xhtml_filetypes = 'xhtml,js,jsx,tsx,vue'
let g:closetag_emptyTags_caseSensitive = 1
"}}}

"{{{ AutoPairs
augroup ts_pairs
  let g:AutoPairsCompatibleMaps = 0
  let g:AutoPairsMapBS = 1
  let g:AutoPairsMultilineBackspace = 1
  let g:AutoPairs = autopairs#AutoPairsDefine([
        \ {"open":"\w\zs<", "close":">", "filetype":"typescript"}
        \ ])
  let g:AutoPairsShortcutFastWrap = "<C-e>"
  let g:AutoPairsFiletypeBlacklist = ['TelescopePrompt']
augroup end
"}}}

"{{{ LightLine
function! NoNerd(status)
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' : a:status
endfunction

function! LightlineFilename()
  let filename = winwidth(0) > s:medium ? expand('%:~:s?/src/rstudio/??') : expand('%:t')
  return NoNerd(filename)
endfunction

function! LightlinePWD()
  let pwd = winwidth(0) > s:medium ? fnamemodify(getcwd(), ':t') : ''
  return NoNerd(pwd)
endfunction

function! LightlineBranch()
  return NoNerd(fugitive#head())
endfunction

function! LightlineLSPErrors() abort
  let e=''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let e=luaeval("vim.diagnostic.get(vim.fn.bufnr('%'), [[Error]])")
  endif
  return e == '0' ? '' : e
endfunction

function! LightlineLSPWarnings() abort
  let w=''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let w=luaeval("vim.diagnostic.get(vim.fn.bufnr('%'), [[Warning]])")
  endif
  return w == '0 '? '' : w
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

function! LightlineTagbar()
  return NoNerd(tagbar#currenttag('%s','','f', 'nearest-stl'))
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left':  [ ['mode', 'paste'], ['pwd', 'gitbranch', 'filename', 'tagbar'] ],
      \   'right': [ ['lsp_warnings'], ['lsp_errors'], ['lineinfo'], ['percent'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'gitbranch': 'LightlineBranch',
      \   'pwd': 'LightlinePWD',
      \   'filename': 'LightlineFilename',
      \   'tagbar': 'LightlineTagbar',
      \ },
      \ 'component_expand': {
      \   'percent': 'LightlinePercent',
      \   'filetype': 'LightlineFT',
      \   'lineinfo': 'LightlineLineInfo',
      \   'lsp_warnings': 'LightlineLSPWarnings',
      \   'lsp_errors': 'LightlineLSPErrors',
      \ },
      \ 'component_type': {
      \   'lsp_warnings': 'warning',
      \   'lsp_errors': 'error'
      \ }
\ }

autocmd User DiagnosticChanged call lightline#update()
"}}}

"{{{ Slime
let g:slime_target="tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"} " down-of, bottom, last...
"}}}

"{{{ Startify
let g:startify_bookmarks = [
      \ {'c': "~/src/rstudio/connect"},
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
" let g:ascii = [ ]
" let g:startify_custom_header= startify#pad(g:ascii)
"}}}

"{{{ Go
" vim-go for highlighting, nvim for LSP.
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_echo_go_info = 0
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
au BufWritepre *.go silent | GoImports
"}}}

"{{{ Sandwich
  " RIP substitution
  nmap s <Nop>
	xmap s <Nop>

  " enable text selections (mainly for visual mode)
	xmap is <Plug>(textobj-sandwich-query-i)
	xmap as <Plug>(textobj-sandwich-query-a)
	omap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)

	xmap iss <Plug>(textobj-sandwich-auto-i)
	xmap ass <Plug>(textobj-sandwich-auto-a)
	omap iss <Plug>(textobj-sandwich-auto-i)
	omap ass <Plug>(textobj-sandwich-auto-a)

  " surround.vim-like brackets
	let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
  let g:sandwich#recipes += [
	\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
	\
	\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
	\
	\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
	\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
	\
	\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['{']},
	\
	\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['[']},
	\
	\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
	\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'], 'input': ['(']},
	\ ]
"}}}

"{{{ Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=0
"}}}

"{{{ Rainbow Parens
let g:rainbow_conf = { 'guifgs': ['#268bd2', '#2aa198', '#859900', '#b58900', '#cb4b16', '#6c71c4'], }
"}}}

"{{{ Search & Replace
" set inccommand=nosplit " (on by default in 0.6)
nnoremap <Leader>s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//c<Left><Left>
xnoremap <Leader>s "sy:%s/<C-r>s//c<Left>

nnoremap <silent> <Leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> <Leader>c "sy:let @/=@s<CR>cgn
nnoremap <CR> gnzz
xmap <CR> .<Esc>gnzz
xnoremap ! <Esc>ngnzz
autocmd! BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd! CmdwinEnter *        nnoremap <buffer> <CR> <CR>
"}}}

"{{{ Tagbar
" ctags_identifier:tagbar_display_name:fold:show_in_statusline
" ctags --list-kinds-full=<lang>
let g:tagbar_type_go = {
    \ 'kinds' : [
        \ 'p:package:0:1',
        \ 'i:interfaces',
        \ 'c:constants:1:0',
        \ 'v:variables:0:0',
        \ 't:types:1',
        \ 'n:methods:1',
        \ 'm:members',
        \ 'f:functions',
        \ 's:structs',
        \ 'u:unknown',
    \ ],
    \ 'kind2scope': {
       \ 'p': 'package',
       \ 's': 'struct',
       \ 'i': 'interface',
    \ },
\ }

let g:tagbar_type_typescript = {
    \ 'kinds' : [
        \ 'n:namespaces',
        \ 'i:interfaces',
        \ 'g:enums',
        \ 'e:enumerations:0:0',
        \ 'c:classes',
        \ 'C:constants:0:0',
        \ 'f:functions',
        \ 'p:properties:0:0',
        \ 'v:variables:0:0',
        \ 'm:methods',
        \ '?:unknown',
    \ ],
\ }

let g:tagbar_autofocus = 1
let g:tagbar_compact = 2
let g:tagbar_map_showproto = ''
let g:tagbar_map_togglefold = '<Space>'
" let g:tagbar_show_data_type = 1

nmap <silent> <c-t> :TagbarToggle<CR>
"}}}

"{{{ LSP
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
sign define DiagnosticSignError text=■ texthl=DiagnosticSignError
sign define DiagnosticSignWarn text=■ texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo text=■ texthl=DiagnosticSignInfo
sign define DiagnosticSignHint text=■ texthl=DiagnosticSignHint
autocmd CursorHold * lua vim.lsp.buf.document_highlight()
autocmd CursorHold * lua vim.diagnostic.open_float({source="if_many"})
autocmd CursorMoved * lua vim.lsp.buf.clear_references()
" autocmd InsertLeave <buffer> silent! lua vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace('lsp_signature'), 0, -1)
autocmd InsertLeave,BufWritePre *.go lua vim.lsp.buf.formatting()
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" Todo: <c-k> conflicts with tmux nav
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gd   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent><leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
" autocmd Filetype ts,go setlocal omnifunc=v:lua.vim.lsp.omnifunc
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <Tab>     compe#confirm('<Tab>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
vim.diagnostic.config({
  virtual_text=false,
  signs=true,
  update_in_insert=false,
})
local on_attach_vim = function(client)
  require'lsp_signature'.on_attach({
    bind = true,
    hint_prefix = '',
    -- hint_enable = false,
    floating_window = false,
    handler_opts = {
      border = 'single',
    },
  })
end
require'compe'.setup{
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source={
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    emoji = true;
  }
}
require'lspconfig'.tsserver.setup{on_attach=on_attach_vim}
require'lspconfig'.gopls.setup{
  on_attach = on_attach_vim;
  -- settings = {
  --   gopls = {
      -- env = {GOFLAGS="-tags=linux"}
  --   }
  -- }
}
require'lspconfig'.r_language_server.setup{on_attach=on_attach_vim}
require'lspconfig'.diagnosticls.setup{
  filetypes = {   "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx"},
  init_options = {
    linters = {
      eslint = {
        sourceName = 'eslint',
        rootPatterns = {".eslintrc.js"},
        command = 'eslint_d',
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        },
        securities = {[2] = "error", [1] = "warning"},
      },
    },
    filetypes = {
      ['typescript.tsx'] = 'eslint',
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint'
      },
  },
}
require'lspconfig'.vuels.setup{
  on_attach=on_attach_vim,
  init_options = {
    config = {
      vetur = {
        ignoreProjectWarning = true,
        useWorkspaceDependencies = false,
        validation = {
          template = true,
          style = true,
          script = true,
        },
        completion = {
          autoImport = false,
          useScaffoldSnippets = false,
          tagCasing = 'kebab',
        },
        format = {
          defaultFormatter = {
            js = 'none',
            ts = 'none',
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false,
        },
      },
      css = {},
      html = {
        suggest = {},
      },
      javascript = {
        format = {},
      },
      typescript = {
        format = {},
      },
      emmet = {},
      stylusSupremacy = {},
    },
  },
}
require'lspconfig'.pyright.setup{
  on_attach=on_attach_vim
}
-- too noisy
-- require'lspconfig'.solargraph.setup{
--   on_attach=on_attach_vim,
--   cmd = { "solargraph", "stdio" },
--   flags = { debounce_text_changes = 150 },
--   settings = {
--     solargraph = {
--         autoformat = false,
--         formatting = false,
--         completion = true,
--         diagnostic = false,
--         folding = true,
--         references = true,
--         rename = true,
--         symbols = true
--     }
--   }
-- }
EOF
"}}}

"{{{ TreeSitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"   },
" }
" EOF
"   incremental_selection = {
"     enable = true,
"     keymaps = {
"       init_selection = "gnn",
"       node_incremental = "grn",
"       scope_incremental = "grc",
"       node_decremental = "grm",
"     },
"   },
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
"}}}

"{{{ Ale (disabled)
let g:ale_enabled=1
let g:ale_disable_lsp=1
let g:ale_linters={
\ 'typescript': ['eslint'],
\ 'javascript': ['eslint'],
\ 'go': ['gopls'],
\}
let g:ale_linters_explicit=1
let g:ale_shell='/bin/bash'
let g:ale_hover_cursor=0
let g:ale_echo_cursor=0
let g:ale_sign_error="●"
let g:ale_sign_warning="●"
let g:ale_sign_info="●"
let g:ale_virtualtext_prefix='● '
let g:ale_virtualtext_cursor=1
"}}}

"{{{ Neoformat
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1
au InsertLeave,BufWritepre <buffer> silent! undojoin | Neoformat
let g:neoformat_typescript_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
  \ 'stdin': 1
  \ }
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_go = [] " let LSP handle go
let g:neoformat_enabled_ruby = [] " slow af
"}}}

"{{{ Gitgutter
let g:gitgutter_sign_priority=0
let g:gitgutter_set_sign_backgrounds = 1
"}}}

"{{{ HighlightedYank
  let g:highlightedyank_highlight_duration=500
"}}}

"{{{ lightbulb
lua << EOF
vim.fn.sign_define('LightBulbSign', { text = "■", texthl = "LightBulbSign", linehl="", numhl="" })
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
EOF
"}}}

"{{{ Stuff that needs to go last
syntax on
filetype plugin indent on

hi DiagnosticError guifg=#dc322f guibg=#073642
hi DiagnosticInfo guifg=#268bd2 guibg=#073642
hi DiagnosticWarn guifg=#b58900 guibg=#073642
hi DiagnosticHint guifg=#fdf6e3 guibg=#073642
hi DiagnosticDefaultError guifg=#dc322f guibg=#073642
hi DiagnosticDefaultInfo guifg=#268bd2 guibg=#073642
hi DiagnosticDefaultWarn guifg=#b58900 guibg=#073642
hi DiagnosticDefaultHint guifg=#fdf6e3 guibg=#073642
hi DiagnosticUnderlineError gui=undercurl cterm=undercurl guisp=#dc322f
hi DiagnosticUnderlineWarn gui=undercurl cterm=undercurl guisp=#b58900
hi DiagnosticUnderlineHint gui=undercurl cterm=undercurl guisp=#268bd2
hi LspReferenceText cterm=reverse gui=reverse
hi LspReferenceRead cterm=reverse gui=reverse
hi LspReferenceWrite cterm=reverse gui=reverse
hi clear MatchParen
hi MatchParen cterm=reverse gui=reverse
hi clear ALEError
hi ALEError cterm=undercurl gui=undercurl guisp=#dc322f
hi! link ALEErrorSign DiagnosticDefaultError
hi! link ALEVirtualTextError ALEErrorSign
hi! link ALEErrorSignLineNr ALEErrorSign
hi! link ALEWarningSign DiagnosticDefaultWarning
hi! link ALEInfoSogn DiagnosticDefaultInformation
hi! link typescriptReserved Keyword
hi HighlightedyankRegion gui=standout guibg=#073642 guifg=#b58900
hi LightBulbSign guifg=#fdf6e3 guibg=#073642
hi link TagbarSignature Comment
hi SignColumn guibg=#073642

augroup tsx_hi
  autocmd FileType typescript.tsx syn clear xmlError
  autocmd FileType typescript.tsx hi link xmlTagN Function " fix some schemes
augroup end

let g:rainbow_active = 0
augroup rainbows
  autocmd FileType lisp,clojure,schema RainbowToggleOn
augroup END

augroup gcfg
  autocmd FileType gcfg set syntax=cfg | setl commentstring=;\ %s
augroup END
"}}}
