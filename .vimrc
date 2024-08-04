set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green
if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula
