set nocompatible
filetype off
" vundle{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'henrik/vim-indexed-search'
Plugin 'junegunn/fzf.vim'
Plugin 'lepture/vim-jinja'
Plugin 'pangloss/vim-javascript'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'w0rp/ale'
Plugin 'wincent/terminus'

Plugin 'SirVer/ultisnips'
Plugin 'ynotstartups/vim-snippets'
call vundle#end()
" }}}
" change leader to space, has to be in the beginning
nnoremap <SPACE> <nop>
let mapleader = " "
" personal

" color {{{
set t_Co=256
syntax on
set background=dark
colorscheme molokai
" MatchParen highlighting makes it look like cursor jumped to matching parenthesis
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
hi diffAdded ctermfg=34  cterm=NONE guifg=#2BFF2B gui=NONE
hi diffRemoved ctermfg=160 cterm=NONE guifg=#FF2B2B gui=NONE
highlight diffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight diffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight diffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight diffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" }}}
" indent {{{
filetype plugin indent on
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

" for code indented with tabs
" set list lcs=tab:\|\

" }}}
set shortmess+=IWA " ignore Intro, Written and swapfile exists
set laststatus=2 " status bar always on
set number
set colorcolumn=80
set wildmenu
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion
set updatetime=100 " how how long (in milliseconds) the plugin will wait for GitGutter
set autoread
au CursorHold * checktime
set hidden " no need to save when change buffer
" set timeout
" set timeoutlen=500
set cmdheight=2 " set command line height to 2
set backspace=indent,eol,start
set iskeyword+=-
set iskeyword+=_
set shada=!,'500,<50,s10,h " change v:oldfile from 100 to 500 for fzf history

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
" save {{{
nnoremap <leader>s :w<cr>
nnoremap <leader>S :wa<cr>
inoremap jk <esc>:w<cr>
" }}}

nnoremap Q @q
nnoremap Y y$
" concat without space
" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

" Map it to a key
nnoremap J :call JoinSpaceless()<CR>
map q: <silent>

inoremap jj <esc>
" upper case whole word for writing constant
inoremap <m-u> <esc>viwU<esc>ea
nnoremap <m-u> <esc>viwU<esc>e

" buffers {{{
set nostartofline
nnoremap <S-h> <esc>:bp<cr>
nnoremap <S-l> <esc>:bn<cr>
map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>.
nnoremap <leader>ba :%bd<cr>
nnoremap <leader>bo :BufOnly<cr>

nnoremap <m-w> :bd<cr>
" }}}
" windows {{{
" nnoremap <leader>ws  :split<cr><c-w><c-w>
" nnoremap <leader>wv  :vsplit<cr><c-w><c-w>
set splitbelow

nnoremap <leader>q  <C-w><C-w>
nnoremap <leader>o  :only<cr>
nnoremap <leader>=  :resize +5<cr>
nnoremap <leader>-  :resize -5<cr>
nnoremap <leader>v= :vertical resize +30<cr>
nnoremap <leader>v- :vertical resize -30<cr>

map <m-j> <C-W>j
map <m-k> <C-W>k
map <m-h> <C-W>h
map <m-l> <C-W>l

map <m-s> :split<cr>
" }}}
" arrow key map {{{
" nnoremap <up> <c-u>
nnoremap <up> <c-u>
nnoremap <down> <c-d>
nnoremap <left> <c-b>
nnoremap <right> <c-f>
vnoremap <up> 15k
vnoremap <down> 15j
vnoremap <left> 30k
vnoremap <right> 30j
" }}}
" quick reload/edit {{{
nnoremap <leader>lv :source $MYVIMRC<cr>
nnoremap <leader>lz :source ~/.zshrc<cr>
nnoremap <leader>lb :source ~/.bash_profile<cr>

" not working with nvim
" nnoremap <leader>ev :e $MYVIMRC<cr>

nnoremap <leader>ee :e#<cr>
nnoremap <leader>ea :e ~/Documents/applescript_learning/open_or_reload.scpt<cr>
nnoremap <leader>eb :e ~/Documents/BUGS<cr>
nnoremap <leader>en :e ~/Documents/NOTES<cr>
nnoremap <leader>ep :e ~/.tiger_profile<cr>
nnoremap <leader>et :e ~/Documents/TODO<cr>
nnoremap <leader>eu :e ~/Documents/USEFUL_COMMANDS<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

nnoremap <m-e> :e#<cr>
" }}}
" folding {{{
nnoremap \ za
" }}}
" copy/paste {{{
set clipboard=unnamed

" copy with indent and set cursor to the end of paste
nnoremap p p=`]`]

nnoremap <leader>yn :let @*=expand("#")<cr>
nnoremap <leader>yf :let @*=expand("%")<cr>
nmap <leader>ym [[wyw
function! CopyTestFunctionName()
    normal [[w"ayw
    let @*=expand('%').'::'.@a
endfunction
nnoremap <leader>yt :call CopyTestFunctionName()<cr>
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
" remember files & cursor position between vim sessions & buffer changes {{{
" Go to last file(s) if invoked without arguments
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
            \ call mkdir($HOME . "/.vim") |
            \ endif |
            \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
            \ execute "source " . $HOME . "/.vim/Session.vim"

" the following to have Vim jump to the last position when reopening a file
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

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
" ale {{{
let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_linters = {
            \   'python': ['flake8'],
            \}
let g:ale_linters_ignore = {
            \   'javascript': ['jshint'],
            \}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort'],
            \   'javascript': ['prettier'],
            \}
let g:ale_fix_on_save = 1

nnoremap [L :ALEFirst<cr>
nnoremap [l :ALEPrevious<cr>
nnoremap ]l :ALENext<cr>
nnoremap ]L :ALELast<cr>
"  }}}
" deocomplete {{{
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}
" commentary {{{
nmap <leader>c gcc
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
    call fzf#vim#files('.', {'options':'--query '.l:fileName})
endfunction

nnoremap <leader>jS :call JumpToType("stories.js")<cr><cr>
nnoremap <leader>jj :call JumpToType("jinja")<cr><cr>
nnoremap <leader>jp :call JumpToType("py")<cr><cr>
nnoremap <leader>js :call JumpToType("js")<cr><cr>
nnoremap <leader>jt :call JumpToType("test")<cr><cr>
nnoremap <leader>jl :call JumpToType("less")<cr><cr>
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
nnoremap <leader>P :FZF<cr>
nnoremap <leader>pb :Buffers<cr>
nnoremap <leader>pl :Commits<cr>
nnoremap <leader>pg :GFiles?<cr>
nnoremap <leader>pm :History<cr>
nnoremap <leader>pp :FZF<cr>
nnoremap <leader>pr :Rg<Space>
nnoremap <leader>pt :Tags<cr>
nnoremap <leader>ps :Snippets<cr>

" require alt sends Esc+, iterm2 preference->Profiles->Keys
nnoremap <m-p> :FZF<cr>
nnoremap <m-b> :Buffers<cr>
nnoremap <m-m> :History<cr>
nnoremap <m-r> :Rg<Space>
nnoremap <m-g> :Commits<Space>

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
" Git/Fugitive {{{
command! -bar -bang -nargs=* Gcv :Gcommit<bang> -v <args>

nnoremap <leader>gp :GitGutterPreviewHunk<cr>
nnoremap <leader>gu :GitGutterUndo<cr>
nnoremap <leader>gS :GitGutterStageHunk<cr>

" let g:gitgutter_sign_added = '∙'
" let g:gitgutter_sign_modified = '∙'
" let g:gitgutter_sign_removed = '∙'
" let g:gitgutter_sign_modified_removed = '∙'

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcv<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gL :Glog<cr>

nnoremap <leader>gl :Commits<cr>

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! BranchTicket()
    " return GitBranch()[:7]
    return GitBranch()
endfunction

" }}}
" indexed-search {{{
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1
let g:indexed_search_dont_move = 1
let g:indexed_search_center = 1
" }}}
" indentLine {{{
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit']
" }}}
" jedi {{{
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>Jd"
let g:jedi#goto_assignments_command = "<leader>Ja"
let g:jedi#usages_command = "<leader>Ju"
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
" fun! TrimWhitespace()
    " let l:save = winsaveview()
    " keeppatterns %s/\s\+$//e
    " call winrestview(l:save)
" endfun
" command! TrimWhitespace call TrimWhitespace()
" autocmd BufWritePre * :call TrimWhitespace()
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
" let g:prettier#autoformat = 0
" let g:prettier#config#print_width = 80
" autocmd BufWritePre *.js PrettierAsync
" }}}
" wiki {{{
let wiki = {}
let wiki.path = '~/Dropbox/vimwiki'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
" }}}
" YouCompleteMe {{{
set completeopt-=preview
let g:ycm_semantic_triggers = {
    \   'less': [ 're!^\s{4}', 're!:\s+' ],
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
" }}}
" Autoload {{{
function! Autoload()
    silent execute "!osascript /Users/tigerhuang/Documents/applescript_learning/open_or_reload.scpt"
endfunction
augroup autoload
    autocmd!
    autocmd FileType python autocmd! BufWritePost <buffer> call Autoload()
    autocmd FileType jinja autocmd! BufWritePost <buffer> call Autoload()
augroup END
" }}}
" file specific
" git {{{
nnoremap <leader>it 0"=BranchTicket()<cr>P
augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_gb
    autocmd FileType gitcommit set textwidth=72
    autocmd FileType gitcommit set colorcolumn=73

    " turn off Capital letter check for the first letter
    autocmd FileType gitcommit setlocal spellcapcheck=
augroup END
" }}}
" jinja {{{
augroup jinja
    autocmd!
    autocmd FileType jinja setlocal colorcolumn=100

    autocmd Syntax jinja syntax region BEM_element start=/\v__/ end=/\v\w*/ containedin=htmlString,htmlTag contained
    autocmd Syntax jinja syntax region BEM_modifier start=/\v--/ end=/\v\w*/ containedin=htmlString,htmlTag contained
    autocmd Syntax jinja highlight link BEM_element Function
    autocmd Syntax jinja highlight link BEM_modifier Conditional

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
    autocmd FileType python setlocal colorcolumn=100
augroup END
" }}}
" TODO {{{
augroup TODO
    autocmd!
    autocmd BufRead,BufNewFile ~/Documents/TODO set ft=TODO
    autocmd FileType TODO setlocal conceallevel=1
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
    autocmd Syntax TODO syntax match Life life conceal cchar=!

augroup END
" }}}
" NOTES {{{
augroup NOTES
    autocmd!
    autocmd BufRead,BufNewFile ~/Documents/NOTES set ft=markdown
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
" zshrc {{{
augroup filetype_zsh
    autocmd!
    autocmd FileType zsh setlocal foldmethod=marker
augroup END
" }}}
