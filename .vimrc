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
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'henrik/vim-indexed-search'

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

" ctrlp
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_files = 0

" nerdcommenter
let g:NERDSpaceDelims = 1

set ignorecase
set smartcase
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

let g:javascript_plugin_jsdoc = 1

nnoremap p ]p
nnoremap <c-p> p
