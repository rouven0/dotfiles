"     _____  _____
"    |  __ \| ____|     | customized vimrc file
"    | |__) | |__       |
"    |  _  /|___ \      | https://github.com/therealr5/dotfiles
"    | | \ \ ___) |     |
"    |_|  \_\____/      | 
"

" basic commands bound to uppercase key
command Q q
command W w
command Wq wq
command WQ wq

set number relativenumber
set tabstop=4
set expandtab
set smartcase
set nowrap
set incsearch
set autoread
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'psf/black', { 'branch': 'stable' }


call plug#end()

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" set space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" black code formatter
let g:black_linelength = 120
autocmd BufWritePre *.py execute ':Black'

" air-line
let g:airline_powerline_fonts = 1

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR>
" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"remove ex-mode shortcut
nmap Q <Nop>

"open up a terminal
nnoremap <leader>t :ter<CR>

" trigger the fuzzy finder (fzf)
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

" keybinds for coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>d :CocDiagnostics<CR>

" quickfixlist binds
nmap <C-j> :cnext<CR>
nmap <C-k> :cprev<CR>

" locallist binds
nmap <C-l> :lnext<CR>
nmap <C-h> :lprev<CR>

" split keybinds
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vs<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" coloring stuff
let g:dracula_colorterm = 0
colorscheme dracula

" better autocompletion menu colors
highlight Pmenu ctermbg=darkgray ctermfg=black
highlight PmenuSel ctermbg=gray ctermfg=black
