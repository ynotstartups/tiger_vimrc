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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-syntastic/syntastic'
Plugin 'google/vim-searchindex'
Plugin 'easymotion/vim-easymotion'
" Plugin 'mxw/vim-jsx'
" Plugin 'mattn/emmet-vim'
Plugin 'ddrscott/vim-side-search'
Plugin 'vim-scripts/BufOnly.vim'

call vundle#end()

" change leader to space
nnoremap <SPACE> <Nop>
let mapleader = " "

filetype plugin indent on

" line number
set tabstop=4
set shiftwidth=4
set expandtab

" color
set t_Co=256
syntax on

colorscheme molokai
let g:rehash256 = 1
" brighter comment color
hi Comment ctermfg=245
hi Visual ctermbg=240


" status bar
set laststatus=2

" line number
set number


set colorcolumn=80

" http://vim.wikia.com/wiki/Example_vimrc
set wildmenu

" how how long (in milliseconds) the plugin will wait
" after you stop typing before it updates the signs
set updatetime=100

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

" bind K to grep word under cursor
nnoremap <Leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>g <Esc>:grep -ir<space>

set ignorecase
set smartcase
set hlsearch
set incsearch

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_x = airline#section#create([])
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = airline#section#create(['%3p%%'])
let g:airline_powerline_fonts = 1
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" inoremap <leader>c <CR><Esc>O

" try to open new line in bracket
inoremap {;<CR> {<CR>};<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap {\<CR> {<CR>}<ESC>O
inoremap (\<CR> (<CR>)<ESC>O

" leader s to save
nnoremap <silent> <leader>s <Esc>:w<CR>
inoremap \s <Esc>:w<CR>
vmap <leader>s <esc>:w<CR>gv

inoremap jj <Esc>

let g:javascript_plugin_jsdoc = 1

" leader syntax
nnoremap <leader><leader>j <Esc>:set syntax=javascript<CR>
nnoremap <leader><leader>h <Esc>:set syntax=html<CR>
nnoremap <S-h> <Esc>:bp<CR>
nnoremap <S-l> <Esc>:bn<CR>
" toggle next window
nnoremap <leader>w <Esc><C-w><C-w>

nnoremap Q @q
nnoremap Y y$

set list lcs=tab:\|\

" nerdtree
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>
nnoremap <leader>f <Esc>:NERDTreeFind<CR>

nnoremap <leader>d :bp<cr>:bd #<cr>

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = "/usr/bin/python3"

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader><space> <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" GitGutter
" nnoremap <Leader>gp <Esc>:GitGutterPreviewHunk<CR>
" nnoremap <Leader>gu <Esc>:GitGutterUndo<CR>
" nnoremap <Leader>ga <Esc>:GitGutterAll<CR>

" YouCompleteMe
set completeopt-=preview

" Emmet
let g:user_emmet_leader_key='\'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let emmet_html5 = 0

" make sure the color still works after opening session
set sessionoptions-=options  " Don't save options

" trying to add git
function! LastLog()
    " let shellcmd = 'git log -1'

    " let output=system(shellcmd)
    " if !v:shell_error
        " return 0
    " endif
    echom "HelloWorld"

    return 1
endfunction
