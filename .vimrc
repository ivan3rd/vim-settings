runtime! plugin/sensible.vim

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
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
set hlsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set hidden
set laststatus=2
" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
" code folding
set foldmethod=indent
set foldlevel=99

syntax on

set nocp
if version >= 600
    filetype plugin indent on
endif
autocmd VimEnter * NERDTree | wincmd p
"let g:netrw_liststyle = 3
"g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_preview = 1
"let g:netrw_altv = 1
"let g:netrw_winsize = 20
"augroup ProjectDrawer
    "autocmd!
    "autocmd VimEnter * :Vex
"augroup END
let g:closetag_filenames = '*.vue,*.html,*.xhtml,*.phtml'

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'

Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" vue-plugin.
Plug 'posva/vim-vue'
"Plug 'leafOfTree/vim-vue-plugin'
"Plug 'ap/vim-buftabline' даёт возможность использовать бафферы как табы.
"Может быть со временем я и стану использовать бафферы чаще чем табы, а пока
"нет
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" У плагина выше ^ не работает почему-то автозакрытие тегов. Может быть
" происходит конфликт с YouCompleteMe?
Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs'
Plug 'valsorym/.del.vim-tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'alvan/vim-closetag'

call plug#end()

colorscheme gruvbox
let mapleader = "z"

inoremap <c-k> <up>
inoremap <c-j> <down>
"inoremap <C-H> <Nop>
"inoremap <C-H> <left> так же была забайнджена в after/delimitMate для разрешения кофликта
inoremap <c-l> <right>
vnoremap <c-k> <up>
vnoremap <c-j> <down>
vnoremap <c-h> <left>
vnoremap <c-l> <right>
nnoremap <Leader>f yiw:Ag <c-r>"<CR>
"nnoremap <Leader>F yiw:Ag <c-r>"<CR>
nnoremap <Leader>b yiw ?<c-r>"<CR>
" Следующие две команды должны скопиравать html тег и вставить его
" закрывающую версию на новой строке
nnoremap <Leader>n <Esc>yi<
nnoremap <Leader>m i</><Esc>lp
nnoremap <Leader>o :pu_<CR>
"n</oright>/ / map <c-/> p b i / <Esc>
" Следующие две команды дают переключение между вкладками vim
map <F5> :tabp <CR>
map <F6> :tabn <CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Вставляем пустые строки в нормальном режиме

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" Ребайндим CapsLock на Esc
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Следующие строки ребайндяд комбинации клавиш установленные плагинами
map <Leader>/ <plug>NERDCommenterInvert
nmap <F8> :TagbarToggle<CR>

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction
