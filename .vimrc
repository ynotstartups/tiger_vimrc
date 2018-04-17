set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'evidens/vim-twig'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'StanAngeloff/php.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

call vundle#end()
filetype plugin indent on

" line number
set tabstop=4
set shiftwidth=4
set expandtab

set t_Co=256

syntax on

" status bar
set laststatus=2

" line number
set number

set colorcolumn=80

let g:indentLine_leadingSpaceEnabled = 1

" ctrlp
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_files = 0
" let g:ctrlp_clear_cache_on_exit = 0

" nerdcommenter
let g:NERDSpaceDelims = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set wildignore+=*.cache.php

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set ignorecase
set hlsearch

colorscheme molokai
let g:rehash256 = 1
hi MatchParen cterm=none ctermbg=none ctermfg=blue


let g:airline#extensions#tabline#enabled = 1

inoremap <leader>c <CR><Esc>O
" leader s to save
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <leader>s :<C-u>Update<CR>
inoremap <leader>s <Esc>:Update<CR>
vmap <leader>s <esc>:w<CR>gv

inoremap jj <Esc>

let g:javascript_plugin_jsdoc = 1

inoremap jj <Esc>
nnoremap <leader>j <Esc>:set syntax=javascript<CR>
nnoremap <leader>h <Esc>:set syntax=html<CR>
nnoremap <S-h> <Esc>:bp<CR>
nnoremap <S-l> <Esc>:bn<CR>

nnoremap Q @q
nnoremap Y y$

set list lcs=tab:\|\ 

" nerdtree
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>
nnoremap <leader>f <Esc>:NERDTreeFind<CR>
nnoremap <leader>d :bp<cr>:bd #<cr>
