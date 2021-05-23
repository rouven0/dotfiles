"     _____  _____  
"    |  __ \| ____|     | customized vimrc file
"    | |__) | |__       |
"    |  _  /|___ \      | https://github.com/therealr5/dotfiles
"    | | \ \ ___) |     |
"    |_|  \_\____/      | last changed 2021-05-23
"

" basic commands bound to uppercase key
command Q q
command W w
command Wq wq
command WQ wq
command S sp

" coloring stuff
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" set space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" folding, maybe I should bing it to keys
setlocal foldmethod=indent
set foldlevel=1
set nofoldenable

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR>
" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" trigger the fuzzy finder (fzf)
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" keybinds for coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" better autocompletion menu colors
highlight Pmenu ctermbg=black ctermfg=gray
highlight PmenuSel ctermbg=gray ctermfg=black
