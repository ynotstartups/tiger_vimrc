set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'shougo/deoplete.nvim'
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
" Plugin 'easymotion/vim-easymotion' " doesn't work on Mac
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'mxw/vim-jsx'
" Plugin 'mattn/emmet-vim'
" Plugin 'ddrscott/vim-side-search'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'justinmk/vim-sneak'
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
set background=dark
" let g:solarized_termtrans = 1
" let g:solarized_termcolors=256
colorscheme molokai

" brighter comment color
" hi Comment ctermfg=245
" hi Visual ctermbg=240
" hi MatchParen cterm=none ctermbg=green ctermfg=blue


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
" let g:NERDSpaceDelims = 1
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
nnoremap <Leader>g <esc>:grep -ir<space>

set ignorecase
set smartcase
set hlsearch
set incsearch

"""""""""""""""""""""" airline
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

function! LastCommit()
    let bufferName = expand('%')
    " this system call has bug
    " let output = system('git log -1 --pretty="%ar" -p '.bufferName.' | head -1')
    let output = system("git log -1 --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short ".bufferName)

     if !v:shell_error
         "if len(output) >= 1
             " let output = split(output, "\n")[0]
         echom output
         "endif
     else
        echom "Not Git"
     endif
endfunction

" augroup LastCommit
    " autocmd!
    " autocmd BufNewFile,BufRead * call LastCommit()
" augroup END

" call airline#parts#define_function('lastcommit', 'LastCommit')

let g:airline#extensions#tabline#fnamemod = ':t'

" let g:airline_section_x = airline#section#create([]) " file type
" let g:airline_section_y = airline#section#create(['Modified ', 'lastcommit'])
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = airline#section#create(['%3p%%'])

let g:airline_powerline_fonts = 1

" function! AirlineInit()
" endfunction
" autocmd User AirlineAfterInit call AirlineInit()

augroup Airline
    autocmd!
    autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
augroup END

" inoremap <leader>c <CR><esc>O

" try to open new line in bracket
inoremap {;<CR> {<CR>};<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap {\<CR> {<CR>}<ESC>O
inoremap (\<CR> (<CR>)<ESC>O

" leader s to save
nnoremap <silent> <leader>s <esc>:w<CR>
" inoremap <silent> <leader>ss <esc>:w<CR>
vmap <leader>s <esc>:w<CR>gv

inoremap jj <esc>

let g:javascript_plugin_jsdoc = 1

" leader syntax
nnoremap <leader><leader>j <esc>:set syntax=javascript<CR>
nnoremap <leader><leader>h <esc>:set syntax=html<CR>

""""""""""""""""""""" windows and taps
nnoremap <S-h> <esc>:bp<CR>
nnoremap <S-l> <esc>:bn<CR>
nnoremap <leader>w <esc><C-w><C-w>
nnoremap <leader>q <esc>:q<CR>
nnoremap <leader>= <esc>:resize +5<CR>
nnoremap <leader>- <esc>:resize -5<CR>

nnoremap Q @q
nnoremap Y y$

set list lcs=tab:\|\

" nerdtree
nnoremap <leader>t <esc>:NERDTreeToggle<CR>
nnoremap <leader>f <esc>:NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']

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

" GitGutter
" nnoremap <Leader>gp <esc>:GitGutterPreviewHunk<CR>
" nnoremap <Leader>gu <esc>:GitGutterUndo<CR>
" nnoremap <Leader>ga <esc>:GitGutterAll<CR>

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

set cmdheight=2

" upper case whole word for writing constant
inoremap <c-u> <esc>viwU<esc>i
" nnoremap <c-u> <esc>viwU<esc>


"""""""""""""""""""" quick reload
nnoremap <leader>rv :source $MYVIMRC<cr>

"""""""""""""""""""" quick edit
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>et :split ~/Documents/TODO<cr>

iabbrev clog console.log(<esc><Right>i

" if !exists("*Eatchar")
    " func Eatchar(pat)
       " let c = nr2char(getchar(0))
       " return (c =~ a:pat) ? '' : c
    " endfunc
    " command! Recfg call Eatchar()
" endif

" iabbr clog console.log()<Left><c-r>=Eatchar('\s')<cr>

" force myself to stop use these keys at insert mode
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

augroup CommentLine
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <leader>l I//<space><esc>
    autocmd FileType python     nnoremap <buffer> <leader>l I#<space><esc>
augroup END

" different folder for swap files (doesn't work)
" set directory=~/.vim/tmp/swap/   " swap files

"""""""""""""""""""""" search
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"""""""""""""""""""""" TODO
augroup TODO
    au!
    au BufRead,BufNewFile ~/Documents/TODO set ft=TODO
    " au BufRead,BufNewFile ~/Documents/TODO normal! ggO  i<cr>
    au FileType TODO nnoremap <buffer> <leader>f <esc>0r*<esc>:sort<cr>
    au FileType TODO nnoremap <buffer> <leader>n <esc>ggO<space><space>
    au FileType TODO nnoremap <buffer> O <esc>O<space><space>
    au FileType TODO nnoremap <buffer> o <esc>o<space><space>
    " change number in line
    au FileType TODO onoremap 1 :<c-u>normal! ^viw<cr>
    au FileType TODO onoremap ( :<c-u>normal! 0f(vi(<cr>
    au FileType TODO onoremap ) :<c-u>normal! 0f(vi(<cr>
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" xterm
set t_BE=

" pymode
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length=100
autocmd FileType python set colorcolumn=100

" sneak
let g:sneak#use_ic_scs = 1

" jedi
let g:jedi#completions_enabled = 0

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
