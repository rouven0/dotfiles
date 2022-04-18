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
set shiftwidth=4
set smartcase
set colorcolumn=120
set nowrap
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
Plug 'psf/black', { 'branch': 'stable' } " Small note: We have to install python3-pynvim for this to work
Plug 'sirtaj/vim-openscad'
Plug 'github/copilot.vim'
Plug 'andweeb/presence.nvim'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}


call plug#end()

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" set space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "

"discord presence
let g:presence_enable_line_number = 1

" black code formatter
let g:black_linelength = 120
autocmd BufWritePre *.py execute ':Black'

" air-line
let g:airline_powerline_fonts = 1

" minimap
let g:minimap_auto_start = 1 
let g:minimap_auto_start_win_enter = 1

" directly render tex files partly
set conceallevel=2
" beautify indents
:set list lcs=tab:\|\ 

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR> :NERDTreeRefreshRoot<CR>
" NERDTree autostart"
autocmd VimEnter * NERDTree | wincmd p

"remove ex-mode shortcut
nmap Q <Nop>


" trigger the fuzzy finder (fzf)
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

" keybinds for coc
nnoremap <leader>d :CocDiagnostics<CR>

" quickfixlist binds
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" locallist binds
nnoremap <C-l> :lnext<CR>
nnoremap <C-h> :lprev<CR>

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
