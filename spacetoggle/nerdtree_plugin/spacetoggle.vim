" symlink to vim-plug dir, e.g.
" ~/.local/share/nvim/plugged/spacetoggle/nerdtree_plugin/
" and activate as `Plug 'joshfrench/spacetoggle'`

scriptencoding utf-8

if exists('g:loaded_nerdtree_spacetoggle')
    finish
endif
let g:loaded_nerdtree_spacetoggle = 1

call NERDTreeAddKeyMap({
      \ 'key': '<space>',
      \ 'callback': 'ActivateDirNode',
      \ 'scope': 'DirNode' })

function! ActivateDirNode(dir, ...) abort
  call a:dir.activate()
endfunction
