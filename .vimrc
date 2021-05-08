command Q q
command W w
command Wq wq
command WQ wq

colorscheme desert

set number relativenumber
set tabstop=4
set expandtab
set smartcase
set nowrap
set incsearch
set autoread

let mapleader = ","

setlocal foldmethod=indent

nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR> 

" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
