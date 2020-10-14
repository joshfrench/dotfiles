if exists('g:loaded_lsp_fzf') | finish | endif


let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" command to run our plugin
" command! Whid lua require'whid'.whid()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_lsp_fzf = 1