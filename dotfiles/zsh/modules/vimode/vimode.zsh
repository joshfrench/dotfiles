# jeffreytse/zsh-vi-mode
# ZVM_CURSOR_STYLE_ENABLED=true
# ZVM_VI_SURROUND_BINDKEY='s-prefix'
# ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# ZVM_VI_HIGHLIGHT_BACKGROUND=#586e75
# ZVM_VI_HIGHLIGHT_FOREGROUND=#002b36

# function zvm_after_lazy_keybindings() {
#   bindkey -M viins '^R' fzf-history-widget
#   bindkey -M vicmd '^R' fzf-history-widget
#   bindkey -M vicmd '^[' zvm_enter_insert_mode

#   zvm_bindkey viins '^B' backward-word
# }

# softmoth/zsh-vi-mode
vim-mode-bindkey vicmd  -- change-surround sr
vim-mode-bindkey vicmd  -- delete-surround sd
vim-mode-bindkey vicmd  -- add-surround sa
vim-mode-bindkey vicmd  -- vi-insert '^['
vim-mode-bindkey viins -- vi-backward-word '^b'
vim-mode-bindkey viins -- vi-forward-word '^f'
