set nocompatible
filetype off

" vundle{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'henrik/vim-indexed-search'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'wincent/terminus'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()
" }}}

" change leader to space
nnoremap <SPACE> <nop>
let mapleader = " "

" indent {{{
filetype plugin indent on
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

" for code indented with tabs
set list lcs=tab:\|\ 

" }}}

" color {{{
set t_Co=256
syntax on
set background=dark
colorscheme molokai
" MatchParen highlighting makes it look like cursor jumped to matching parenthesis
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
hi diffAdded ctermfg=46  cterm=NONE guifg=#2BFF2B gui=NONE
hi diffRemoved ctermfg=196 cterm=NONE guifg=#FF2B2B gui=NONE
" }}}

" ignore Intro and Written
set shortmess+=IW

" status bar
set laststatus=2

set number

set colorcolumn=80

set wildmenu

" how how long (in milliseconds) the plugin will wait
" after you stop typing before it updates the signs
" I used it for fast update on GitGutter
set updatetime=100

" autoread
set autoread
au CursorHold * checktime

" search {{{
set ignorecase
set smartcase
set hlsearch
set incsearch

" permanent very magic mode
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
" nnoremap :g/ :g/\v
" nnoremap :g// :g//

" Keep search matches in the middle of the window.
" the following are not necessary because of indexed-search plugin
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap * *N

if executable('rg')
    " Use rg over grep
    augroup rg
    autocmd!
        set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
        " command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
        nnoremap <leader>g :Rg<SPACE>
    augroup END
endif
" bind K to grep word under cursor
nnoremap <Leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"  }}}

" try to open new line in bracket
inoremap {;<CR> {<CR>};<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap {\<CR> {<CR>}<ESC>O
inoremap (c<CR> (<CR>)<ESC>O

" leader s to save
nnoremap <silent> <leader>s <esc>:w<CR>
nnoremap <silent> S <esc>:w<CR>
inoremap <silent> SS <esc>:w<CR>
" inoremap <silent> <c-s> <esc>:w<CR>
vmap <leader>s <esc>:w<CR>gv

inoremap jj <esc>

" buffers {{{
set nostartofline
nnoremap <S-h> <esc>:bp<CR>
nnoremap <S-l> <esc>:bn<CR>
" leader d is taken by Jedi find definition
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bo :BufOnly<cr>
" }}}

" windows {{{
" nnoremap <leader>ws  :split<cr><c-w><c-w>
" nnoremap <leader>wv  :vsplit<cr><c-w><c-w>
nnoremap <leader>w  <C-w><C-w>
nnoremap <leader>o  :only<CR>
nnoremap <leader>c  :close<CR>
nnoremap <leader>q  :quit<CR>
nnoremap <leader>qa  :quitall<CR>
nnoremap <leader>=  :resize +5<CR>
nnoremap <leader>-  :resize -5<CR>
nnoremap <leader>v= :vertical resize +30<cr>
nnoremap <leader>v- :vertical resize -30<cr>
" }}}

nnoremap Q @q
nnoremap Y y$

" arrow key map {{{
" nnoremap <up> <c-u>
nnoremap <up> <c-u>
nnoremap <down> <c-d>
nnoremap <left> <c-b>
nnoremap <right> <c-f>

" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>
" }}}

set cmdheight=2

" upper case whole word for writing constant
nnoremap <c-u> <esc>viwU<esc>ea
nnoremap <c-u> <esc>viwU<esc>e

" quick reload/edit {{{
nnoremap <leader>rv :source $MYVIMRC<cr>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>et :e ~/Documents/TODO<cr>
nnoremap <leader>en :e ~/Documents/NOTES<cr>
nnoremap <leader>eu :e ~/Documents/USEFUL_COMMANDS<cr>
nnoremap <leader>eb :e ~/Documents/BUGS<cr>
nnoremap <leader>ep :e ~/.tiger_profile<cr>
" }}}

" the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

set backspace=indent,eol,start

set iskeyword+=-
set iskeyword+=_

" copy/paste {{{
set clipboard=unnamed
nnoremap <leader>cf :let @*=expand("%")<cr>
" }}}

" undo/swap extra dir {{{
" Persistent undo, remember to mkdir ~/.vim/undo
set undofile
set undodir=~/.vim/undo

set undolevels=1000
set undoreload=10000

" swap file in a diff directory
set directory=~/.vim/swap//
" }}}

" plugins
" airline {{{
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
"  }}}
" django custom {{{
function! JumpToType(extension)
    let l:fileName = expand('%:t:r')
    let l:fileName = substitute(l:fileName, 'test_', '', '')
    let l:fileName = substitute(l:fileName, '\.stories', '', '')
    let l:fileName = substitute(l:fileName, '[-_]', '.', '')

    if a:extension == "test"
        let l:fileName = "test." . l:fileName . "." . "py"
    else
        let l:fileName = l:fileName . "." . a:extension
    endif

    let l:filePath = system('ag -w -g "'.  l:fileName .'"')
    execute "edit ".l:filePath
endfunction

nnoremap <leader>j :call JumpToType("stories.js")<CR>
nnoremap <leader>jj :call JumpToType("jinja")<CR>
nnoremap <leader>jp :call JumpToType("py")<CR>
nnoremap <leader>js :call JumpToType("js")<CR>
nnoremap <leader>jt :call JumpToType("test")<CR>
nnoremap <leader>jl :call JumpToType("less")<CR>
" }}}
" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" have to use nmap for whatever reason
nmap <Leader><Leader> <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" }}}
" Emmet {{{
let g:user_emmet_leader_key='\'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let emmet_html5 = 0
" }}}
" fzf {{{
nnoremap <leader>p :FZF<cr>
nnoremap <leader>pm :History<cr>
nnoremap <leader>pb :Buffers<cr>

nnoremap <leader>pw :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<cr>
nnoremap <leader>pf :call fzf#vim#files('.', {'options':'--query '.expand('%:t:r')})<cr>
"  }}}
" Git {{{
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gu :GitGutterUndo<CR>
nnoremap <Leader>gsh :GitGutterStageHunk<CR>

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
" }}}
" indexed-search {{{
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1
let g:indexed_search_dont_move = 1
let g:indexed_search_center = 1
" }}}
" indentLine {{{
let g:indentLine_bufTypeExclude = ['help']
" }}}
" jedi {{{
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#usages_command = "<leader>u"
" }}}
" last commits {{{
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
" }}}
" nerdcommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
      \ 'python': { 'left': '#', 'right': '' },
      \ 'jinja': { 'left': '{#', 'right': '#}' },
      \ }
" }}}
" nerdtree {{{
" nnoremap <leader>n <esc>:NERDTreeToggle<CR>
" nnoremap <leader>f <esc>:NERDTreeFind<CR>
nnoremap <leader>n <esc>:NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']
" }}}
" pymode {{{
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length=100
" }}}
" startify {{{
let g:startify_custom_header = []
" }}}
" sessions {{{
" make sure the color still works after opening session
set sessionoptions-=options  " Don't save options

nnoremap <leader>m <esc>:mks ~/Documents/vim_sessions/
" }}}
" surround {{{
autocmd FileType jinja let b:surround_{char2nr("v")} = "{{ \r }}"
autocmd FileType jinja let b:surround_{char2nr("{")} = "{{ \r }}"
autocmd FileType jinja let b:surround_{char2nr("%")} = "{% \r %}"
autocmd FileType jinja let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
autocmd FileType jinja let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
autocmd FileType jinja let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
autocmd FileType jinja let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
autocmd FileType jinja let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips"]
" }}}
" vim-prettier {{{
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
autocmd BufWritePre *.js PrettierAsync
" }}}
" YouCompleteMe {{{
set completeopt-=preview
let g:ycm_semantic_triggers = {
    \   'less': [ 're!^\s{4}', 're!:\s+' ],
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
" }}}

" file specific
" jinja {{{
augroup jinja
    autocmd!
    autocmd FileType jinja set colorcolumn=100
augroup END
" }}}
" javascript {{{
augroup javascript
    autocmd!
    autocmd FileType javascript execute "UltiSnipsAddFiletypes jinja2"
augroup END
" }}}
" less {{{
augroup less
    autocmd!
    autocmd FileType less setlocal iskeyword+=@-@
    autocmd FileType less setlocal iskeyword+=&
    " css selector wonder whether this will be useful
    autocmd FileType less setlocal iskeyword+=.
    autocmd FileType less setlocal iskeyword+=#
augroup END
" }}}
" tiger_profile {{{
augroup tiger_profile
    autocmd!
    autocmd BufRead,BufNewFile .tiger_profile setfiletype sh
augroup END
" }}}
" python {{{
augroup python
    autocmd FileType python set colorcolumn=100
    " pymode has leader.b to pdb
    " autocmd FileType python :iabbrev <buffer> pdb import pdb; pdb.set_trace()
augroup END
" }}}
" TODO {{{
augroup TODO
    autocmd!
    autocmd BufRead,BufNewFile ~/Documents/TODO set ft=TODO
    " autocmd BufRead,BufNewFile ~/Documents/TODO normal! ggO  i<cr>
    autocmd FileType TODO nnoremap <buffer> <leader>f <esc>0r*<esc>:sort<cr>
    autocmd FileType TODO nnoremap <buffer> <leader>n <esc>ggO()<space><left><left>
    autocmd FileType TODO nnoremap <buffer> O <esc>O<space><space>
    autocmd FileType TODO nnoremap <buffer> o <esc>o<space><space>
    " change number in line
    autocmd FileType TODO onoremap 1 :<c-u>normal! ^viw<cr>
    autocmd FileType TODO onoremap ( :<c-u>normal! 0f(vi(<cr>
    autocmd FileType TODO onoremap ) :<c-u>normal! 0f(vi(<cr>

    autocmd Syntax TODO syntax match TODOLabel "\v^  \(.{-}\)"
    autocmd Syntax TODO highlight link TODOLabel Keyword
augroup END
" }}}
" Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <leader>fn o"<space>{{{<esc>o}}}<esc>k0lli
    autocmd FileType vim nnoremap <buffer> <leader>fs A<space>{{{<esc>
    autocmd FileType vim nnoremap <buffer> <leader>fe o"<space>}}}<esc>
augroup END
" }}}
