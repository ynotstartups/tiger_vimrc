set nocompatible
filetype off

" vundle{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'lepture/vim-jinja'
Plugin 'Raimondi/delimitMate'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'henrik/vim-indexed-search'
Plugin 'pangloss/vim-javascript'
" Plugin 'prettier/vim-prettier'
" Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rhubarb'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'wincent/terminus'
Plugin 'junegunn/fzf.vim'

Plugin 'SirVer/ultisnips'
Plugin 'ynotstartups/vim-snippets'

if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
endif

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
" set list lcs=tab:\|\

" }}}

" color {{{
set t_Co=256
syntax on
set background=dark
colorscheme molokai
" MatchParen highlighting makes it look like cursor jumped to matching parenthesis
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
hi diffAdded ctermfg=34  cterm=NONE guifg=#2BFF2B gui=NONE
hi diffRemoved ctermfg=160 cterm=NONE guifg=#FF2B2B gui=NONE
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
    augroup END
endif
" bind K to grep word under cursor
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<cr>:cw<cr>

"  }}}

" try to open new line in bracket
inoremap {;<cr> {<cr>};<esc>O
inoremap (;<cr> (<cr>);<esc>O
inoremap {\<cr> {<cr>}<esc>O
inoremap (c<cr> (<cr>)<esc>O

" leader s to save
nnoremap <silent> <leader>s <esc>:w<cr>
nnoremap <silent> S <esc>:w<cr>
inoremap <silent> SS <esc>:w<cr>
" inoremap <silent> <c-s> <esc>:w<cr>
vmap <leader>s <esc>:w<cr>gv

inoremap jj <esc>
inoremap jk <esc>:w<cr>

" buffers {{{
set nostartofline
nnoremap <S-h> <esc>:bp<cr>
nnoremap <S-l> <esc>:bn<cr>
" leader d is taken by Jedi find definition
nnoremap <leader>bd :bd<cr>
nnoremap <leader>ba :%bd<cr>
nnoremap <leader>bo :BufOnly<cr>
" }}}

" windows {{{
" nnoremap <leader>ws  :split<cr><c-w><c-w>
" nnoremap <leader>wv  :vsplit<cr><c-w><c-w>
set splitbelow

nnoremap <leader>w  <C-w><C-w>
nnoremap <leader>o  :only<cr>
nnoremap <leader>c  :close<cr>
nnoremap <leader>q  :quit<cr>
nnoremap <leader>qa  :quitall<cr>
nnoremap <leader>=  :resize +5<cr>
nnoremap <leader>-  :resize -5<cr>
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
nnoremap <leader>lv :source $MYVIMRC<cr>
nnoremap <leader>lz :source ~/.zshrc<cr>
nnoremap <leader>lb :source ~/.bash_profile<cr>

" not working with nvim
" nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>et :e ~/Documents/TODO<cr>
nnoremap <leader>en :e ~/Documents/NOTES<cr>
nnoremap <leader>eu :e ~/Documents/USEFUL_COMMANDS<cr>
nnoremap <leader>eb :e ~/Documents/BUGS<cr>
nnoremap <leader>ep :e ~/.tiger_profile<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
" }}}

" the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

set backspace=indent,eol,start

set iskeyword+=-
set iskeyword+=_

nnoremap J gJ

" copy/paste {{{
set clipboard=unnamed

" copy with indent and set cursor to the end of paste
nnoremap p p=`]`]

nnoremap <leader>cf :let @*=expand("%")<cr>
nmap <leader>cm [[wyw
function! CopyTestFunctionName()
    normal [[w"ayw
    let @*=expand('%').'::'.@a
endfunction
nnoremap <leader>ct :call CopyTestFunctionName()<cr>
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

" Go to last file(s) if invoked without arguments {{{
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"
" }}}

" private
execute "source " . $HOME . "/.vim/private.vim"

" plugins
" util functions {{{
function! CleanWord(word)
    echom a:word
    return substitute(a:word, '[-_\.]', '', 'g')
endfunction
" }}}
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
" deocomplete {{{
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}
" django custom {{{
function! JumpToType(extension)
    let l:fileName = expand('%:t:r')
    let l:fileName = substitute(l:fileName, 'test_', '', '')
    let l:fileName = substitute(l:fileName, '\.stories', '', '')
    let l:fileName = CleanWord(l:fileName)

    if a:extension == "test"
        let l:fileName = "test" . l:fileName . "py"
    else
        let l:fileName = l:fileName . a:extension
    endif
    call fzf#vim#files('.', {'options':'--query '.l:fileName})<cr>
endfunction

nnoremap <leader>j :call JumpToType("stories.js")<cr>
nnoremap <leader>jj :call JumpToType("jinja")<cr>
nnoremap <leader>jp :call JumpToType("py")<cr>
nnoremap <leader>js :call JumpToType("js")<cr>
nnoremap <leader>jt :call JumpToType("test")<cr>
nnoremap <leader>jl :call JumpToType("less")<cr>
" }}}
" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" have to use nmap for whatever reason
nmap <leader><leader> <Plug>(easymotion-overwin-f2)
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
set rtp+=/usr/local/opt/fzf
nnoremap <leader>p :FZF<cr>
nnoremap <leader>pb :Buffers<cr>
nnoremap <leader>pc :BCommits<cr>
nnoremap <leader>pg :GFiles?<cr>
nnoremap <leader>pm :History<cr>
nnoremap <leader>pp :FZF<cr>
nnoremap <leader>pr :Rg<Space>
nnoremap <leader>pt :Tags<cr>
nnoremap <leader>ps :Snippets<cr>

" alt-p
nnoremap π :FZF<cr>

" alt-b
nnoremap ∫ :Buffers<cr>

" alt-r
nnoremap ® :Rg<space>

nnoremap <leader>pw :call fzf#vim#files('.', {'options':'--query '.CleanWord('<c-r><c-w>')})<cr>
nnoremap <leader>pf :call fzf#vim#files('.', {'options':'--query '.CleanWord(expand('%:t:r'))})<cr>

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

nnoremap <leader>rw :Rg <c-r><c-w><cr>
"  }}}
" Git {{{
nnoremap <leader>gp :GitGutterPreviewHunk<cr>
nnoremap <leader>gu :GitGutterUndo<cr>
nnoremap <leader>gsh :GitGutterStageHunk<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! BranchTicket()
    return GitBranch()[:7]
endfunction
" }}}
" indexed-search {{{
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1
let g:indexed_search_dont_move = 1
let g:indexed_search_center = 1
" }}}
" indentLine {{{
let g:indentLine_bufTypeExclude = ['help', 'man']
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
" deocomplete {{{
nnoremap <leader>t :terminal<cr>
" }}}
" nerdcommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
      \ 'python': { 'left': '#', 'right': '' },
      \ 'jinja': { 'left': '{#', 'right': '#}' },
      \ }
" }}}
" nerdtree {{{
" nnoremap <leader>n <esc>:NERDTreeToggle<cr>
" nnoremap <leader>f <esc>:NERDTreeFind<cr>
nnoremap <leader>n <esc>:NERDTreeFind<cr>
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
" terminal neovim {{{
tnoremap <leader><esc> <C-\><C-n>
"}}}
" trailing-whitespace {{{
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
autocmd BufWritePre * :call TrimWhitespace()
"}}}
" ultisnips {{{

let g:UltiSnipsExpandTrigger = "<NUL>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <silent> <return> <C-R>=Ulti_ExpandOrEnter()<cr>

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
" git {{{
nnoremap <leader>it 0"=BranchTicket()<cr>P
" }}}
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
augroup END
" }}}
" TODO {{{
augroup TODO
    autocmd!
    autocmd BufRead,BufNewFile ~/Documents/TODO set ft=TODO
    " autocmd BufRead,BufNewFile ~/Documents/TODO normal! ggO  i<cr>
    autocmd FileType TODO nnoremap <buffer> <leader>f <esc>0r*<esc>:sort <bar> :write<cr>
    autocmd FileType TODO nnoremap <buffer> <leader>n <esc>ggO()<space><left><left>
    autocmd FileType TODO nnoremap <buffer> <leader>c :setlocal conceallevel=0<cr>
    autocmd FileType TODO nnoremap <buffer> O <esc>O<space><space>
    autocmd FileType TODO nnoremap <buffer> o <esc>o<space><space>
    " change number in line
    autocmd FileType TODO onoremap 1 :<c-u>normal! ^viw<cr>
    autocmd FileType TODO onoremap ( :<c-u>normal! 0f(vi(<cr>
    autocmd FileType TODO onoremap ) :<c-u>normal! 0f(vi(<cr>

    autocmd Syntax TODO syntax match TODOLabel "\v^  \(.{-}\)"
    autocmd Syntax TODO highlight link TODOLabel Keyword

    autocmd Syntax TODO syntax match TODOLabel "\v^. \(life\).*" conceal cchar=☝
    " autocmd Syntax TODO syntax match Life life conceal cchar=!
    setlocal conceallevel=1

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
