set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ternjs/tern_for_vim'
" Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

syntax enable
colorscheme molokai
" molokai 256 colors
let g:rehash256 = 1

" highlight search
set hlsearch

set number
set ruler

set ignorecase
set smartcase

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

