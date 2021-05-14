command Q q
command W w
command Wq wq
command WQ wq
command S sp

colorscheme desert
syntax on

set number relativenumber
set tabstop=4
set expandtab
set smartcase
set nowrap
set incsearch
set autoread

" air-line
let g:airline_powerline_fonts = 1

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "

setlocal foldmethod=indent
set foldlevel=1

nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR>

" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

nnoremap <leader>f :Files<CR>
