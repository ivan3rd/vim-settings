set exrc
set norelativenumber
set nu
set hidden
set noerrorbells
set smartindent
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set hlsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes

set nocp
if version >= 600
    filetype plugin indent on
endif
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vex
augroup END

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

Plug 'dense-analysis/ale'
" vue-plugin.
Plug 'posva/vim-vue'
"Plug 'leafOfTree/vim-vue-plugin'

call plug#end()

colorscheme gruvbox

inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

" Следующие две команды должны скопиравать html тег и вставить его закрывающую
" версию на новой строке
"imap <c-n> <Esc>ly3wi
"imap <c-m> <Esc>lpbi/
"n</oright>/ / map <c-/> p b i / <Esc>
" Следующие две команды дают переключение между вкладками vim
map <F5> :tabp <CR>
map <F6> :tabn <CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
