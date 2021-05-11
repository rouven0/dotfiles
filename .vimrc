command Q q
command W w
command Wq wq
command WQ wq

colorscheme desert
syntax on

set number relativenumber
set tabstop=4
set expandtab
set smartcase
set nowrap
set incsearch
set autoread

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'

call plug#end()

let mapleader = ","

setlocal foldmethod=indent
set foldlevel=1
set nofoldenable

nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR>

" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
