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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set indentexpr=treesitter#indentexpr()
set foldlevelstart=99
set linebreak                             " softwrap at word boundaries
set completeopt=menu,menuone,noselect     " never autocomplete
set signcolumn=yes

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
set laststatus=3                          " global status bar in all modes
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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug expand('~/dotfiles/lsp-fzf')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
" Plug 'stevearc/dressing.nvim' " nicey nice vim.ui.select and vim.ui.input
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'sbdchd/neoformat'
" Plug 'dense-analysis/ale'
Plug 'weilbith/nvim-code-action-menu'
Plug 'kosayoda/nvim-lightbulb'
Plug 'machakann/vim-highlightedyank'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'lifepillar/vim-solarized8'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/MatchTagAlways'
Plug 'LunarWatcher/auto-pairs', {'tag': '*'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'pangloss/vim-javascript'
" Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'stevearc/vim-arduino'
" Plug 'ianks/vim-tsx'
" Plug 'jparise/vim-graphql'
" Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
Plug 'chr4/nginx.vim'
Plug 'lepture/vim-jinja'
Plug 'hashivim/vim-terraform'
" Plug 'plasticboy/vim-markdown'
Plug 'corriander/vim-markdown-indent'
" Plug 'leafOfTree/vim-vue-plugin'
Plug 'preservim/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'spywhere/lightline-lsp'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-unimpaired'
Plug 'jpalardy/vim-slime'
Plug expand('~/dotfiles/spacetoggle')
Plug 'ryanoasis/vim-devicons'
call plug#end()
"}}}

"{{{ Colorscheme
colorscheme solarized
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
  return NoNerd(get(b:, 'gitsigns_head'))
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

let g:lightline#lsp#indicator_warnings = ''
let g:lightline#lsp#indicator_errors = ''

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
      \   'lsp_warnings': 'lightline#lsp#warnings',
      \   'lsp_errors': 'lightline#lsp#errors',
      \ },
      \ 'component_type': {
      \   'lsp_warnings': 'warning',
      \   'lsp_errors': 'error'
      \ }
\ }

autocmd User DiagnosticChanged call lightline#update()
autocmd User LspDiagnosticChanged call lightline#update()
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
" autocmd CursorHold * lua vim.diagnostic.open_float({source="if_many", focus=false})
autocmd CursorMoved * lua vim.lsp.buf.clear_references()
autocmd InsertLeave,BufWritePre *.go,*.js lua vim.lsp.buf.formatting()
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

lua << EOF
vim.diagnostic.config({
  virtual_text=true,
  signs=true,
  update_in_insert=false,
})
local cmp = require'cmp'
local cmp_confirm = function(fallback)
  if cmp.visible() and #cmp.get_entries() > 0 then
    cmp.confirm({ select = true })
  else
    fallback()
  end
end
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4, {'i'}),
    ['<C-f>'] = cmp.mapping.scroll_docs(4, {'i'}),
    ['<CR>'] = cmp.mapping(cmp_confirm, {'i'}),
    ['<TAB>'] = cmp.mapping(cmp_confirm, {'i'}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' }
  })
})
local on_attach = function(client, bufno)
  require'lsp_signature'.on_attach({
    bind = true,
    hint_prefix = '',
    -- hint_enable = false,
    floating_window = false,
    handler_opts = {
      border = 'single',
    },
  })
  if client.resolved_capabilities.document_highlight then
    vim.cmd("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
  end
end
require'nvim-lsp-installer'.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach
  }
  server:setup(opts)
end)
do
  local method = "textDocument/publishDiagnostics"
  local default_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
    default_handler(err, method, result, client_id, bufnr, config)
    local diagnostics = vim.diagnostic.get()
    local qflist = {open = false}
    for bufnr, diagnostic in pairs(diagnostics) do
      for _, d in ipairs(diagnostic) do
        d.bufnr = bufnr
        d.lnum = d.range.start.line + 1
        d.col = d.range.start.character + 1
        d.text = d.message
        table.insert(qflist, d)
      end
    end
    vim.diagnostic.setqflist(qflist)
  end
end
EOF
"}}}

"{{{ TreeSitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {  "bash",  "clojure", "comment", "css", "dockerfile", "go", "gomod", "html", "http", "javascript", "jsdoc", "json", "lua", "make", "markdown", "python", "regex", "ruby", "tsx", "typescript", "vim", "vue", "yaml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { '#268bd2', '#2aa198', '#859900', '#b58900', '#cb4b16', '#6c71c4', },
  },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gnn",
  --     node_incremental = "grn",
  --     scope_incremental = "grc",
  --     node_decremental = "grm",
  --   },
  -- },
}
EOF
"}}}

"{{{ null-ls
lua << EOF
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require'null-ls'
null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd({"BufWritePre", "InsertLeave"}, {
          group = augroup,
          buffer = bufnr,
          callback = function()
              vim.lsp.buf.formatting_sync()
          end,
      })
    end
  end,
  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.zsh,

    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.shellcheck,

    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.cljstyle,
    -- null_ls.builtins.formatting.jq,
    -- null_ls.builtins.formatting.prettier,
  }
})
EOF
"}}}

"{{{ gitsigns
lua << EOF
require('gitsigns').setup{
   on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF
"}}}

"{{{ HighlightedYank
  let g:highlightedyank_highlight_duration=650
"}}}

"{{{ lightbulb
lua << EOF
vim.fn.sign_define('LightBulbSign', { text = "■", texthl = "LightBulbSign", linehl="", numhl="" })
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ ignore = {"gitsigns"} })]]
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
hi LspReferenceText gui=bold guibg=#004B5E
hi LspReferenceRead gui=bold guibg=#004B5E
hi LspReferenceWrite gui=bold guibg=#004B5E
hi clear MatchParen
hi MatchParen gui=bold guibg=#004B5E
hi! link typescriptReserved Keyword
hi HighlightedyankRegion gui=bold guibg=#004B5E
hi LightBulbSign guifg=#fdf6e3 guibg=#073642
hi link TagbarSignature Comment
hi SignColumn guibg=#073642
hi GitSignsDelete guibg=#073642
hi DiffAdd guibg=#073642
hi DiffChange guibg=#073642

augroup tsx_hi
  autocmd FileType typescript.tsx syn clear xmlError
  autocmd FileType typescript.tsx hi link xmlTagN Function " fix some schemes
augroup end

augroup gcfg
  autocmd FileType gcfg set syntax=cfg | setl commentstring=;\ %s
augroup END
"}}}
