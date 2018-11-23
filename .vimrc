set nocompatible
filetype off
" Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
" vim-plug {{{
call plug#begin('~/.nvim/plugged')
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips' | Plug 'ynotstartups/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'google/vim-searchindex'
Plug 'groenewege/vim-less'
Plug 'guns/xterm-color-table.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'lepture/vim-jinja'
Plug 'mbbill/undotree'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mgedmin/python-imports.vim'
Plug 'pangloss/vim-javascript'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeFind'}
Plug 'tmhedberg/matchit'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
call plug#end()
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
highlight diffAdd    ctermfg=none ctermbg=22
highlight diffDelete ctermfg=52 ctermbg=52
highlight diffChange ctermfg=none ctermbg=22
highlight diffText ctermfg=none ctermbg=235
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
" set number
set relativenumber
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
set noshowmode
" set shada=!,'500,<50,s10,h " change v:oldfile from 100 to 500 for fzf history
let maplocalleader="`"

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
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *N
"  }}}
" save {{{
nnoremap <leader>s :w<cr>
nnoremap <leader>S :wa<cr>
inoremap jk <esc>:w<cr>
" }}}

" qq to record, Q to replay
nnoremap Q @q

" Make Y behave like other capitals
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

nnoremap gj :call JoinSpaceless()<cr>

" Map it to a key
nnoremap <m-j> :call JoinSpaceless()<CR>
nnoremap <m-k> K
nnoremap J <c-d>
nnoremap K <c-u>

map q: <silent>

inoremap jj <esc>
cnoremap jj <c-c>

" upper case whole word for writing constant
inoremap <m-u> <esc>viwU<esc>ea
nnoremap <m-u> <esc>viwU<esc>e

nnoremap <c-o> <c-o>zz

" buffers {{{
set nostartofline
nnoremap <silent> <S-h> <esc>:bp<cr>
nnoremap <silent> <S-l> <esc>:bn<cr>
map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>ba :%bd<cr>
nnoremap <leader>bo :BufOnly<cr>

nnoremap <m-w> :bd<cr>
" }}}
" windows {{{
nnoremap <leader>x  :split<cr><c-w><c-w>
" nnoremap <leader>wv  :vsplit<cr><c-w><c-w>
set splitbelow

nnoremap <leader>q  <C-w><C-w>
nnoremap <leader>o  :only<cr>
nnoremap <leader>=  :resize +5<cr>
nnoremap <leader>-  :resize -5<cr>
nnoremap <leader>v= :vertical resize +30<cr>
nnoremap <leader>v- :vertical resize -30<cr>

map <m-s> :split<cr>
" }}}
" arrow key map {{{
vnoremap <up> 15k
vnoremap <down> 15j
vnoremap <left> 30k
vnoremap <right> 30j
" }}}
" quick reload/edit {{{
nnoremap <leader>lv :source $MYVIMRC<cr>
nnoremap <leader>lz :source ~/.zshrc<cr>
nnoremap <leader>lb :source ~/.bash_profile<cr>

nnoremap <silent> <leader>ee :e#<cr>
nnoremap <silent> <leader>ea :e ~/Documents/applescript_learning/open_or_reload.scpt<cr>
nnoremap <silent> <leader>eb :e ~/Dropbox/vimwiki/BUGS.wiki<cr>
nnoremap <silent> <leader>en :e ~/Dropbox/vimwiki/NOTES.wiki<cr>
nnoremap <silent> <leader>ep :e ~/.tiger_profile<cr>
nnoremap <silent> <leader>et :e ~/Documents/TODO<cr>
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.wiki<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>
nnoremap <silent> <leader>ez :e ~/Documents/tiger_zshrc/.zshrc<cr>

nnoremap <m-e> :e#<cr>
" }}}
" folding {{{
nnoremap \ za
xnoremap iz :<C-U>silent!normal![zV]z<CR>
onoremap iz :normal viz<CR>
" }}}
" copy/paste {{{
set clipboard=unnamed

" copy with indent and set cursor to the end of paste
nnoremap p p=`]`]

nnoremap <leader>cf :let @*=expand("#")<cr>
nnoremap <leader>cp :let @*=expand("%")<cr>
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
    return substitute(a:word, '[-_\.]', '', 'g')
endfunction
" }}}
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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
let g:deoplete#ignore_sources._ = ['tag']
" }}}
" django custom {{{
function! JumpToType(extension)
    let l:fileName = expand('%:t:r')
    let l:fileName = substitute(l:fileName, 'test_', '', '')
    let l:fileName = substitute(l:fileName, '\.stories', '', '')
    let l:fileName = substitute(l:fileName, '[-_\.]', '.', 'g')

    if a:extension == "test"
        let l:fileName = ".test." . l:fileName . ".py"
    else
        let l:fileName = "/".l:fileName .".". a:extension
    endif
    execute "e ".system("ag -g ".l:fileName)
endfunction

nnoremap <silent> <leader>jS :call JumpToType("stories.js")<cr>
nnoremap <silent> <leader>jj :call JumpToType("jinja")<cr>
nnoremap <silent> <leader>jp :call JumpToType("py")<cr>
nnoremap <silent> <leader>js :call JumpToType("js")<cr>
nnoremap <silent> <leader>jt :call JumpToType("test")<cr>
nnoremap <silent> <leader>jl :call JumpToType("less")<cr>
" }}}
" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" have to use nmap for whatever reason
nmap <leader><leader> <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" }}}
" fzf {{{
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber

set rtp+=/usr/local/opt/fzf
nnoremap <tab> :FZF<cr>
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

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

command! -bang -nargs=* History call fzf#vim#history({'options': '--no-sort'})

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

nnoremap <leader>gL :Glog<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcv<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>

nnoremap <leader>gl :Commits<cr>

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! BranchTicket()
    return GitBranch()[:7]
endfunction

" }}}
" indentLine {{{
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit']
" }}}
" jedi {{{
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>Jd"
let g:jedi#goto_assignments_command = "<leader>Ja"
let g:jedi#usages_command = "<leader>Ju"
let g:jedi#documentation_command = "<leader>k"
" }}}
" lightline {{{
set showtabline=2
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left':  [
            \              [ 'mode', 'paste' ],
            \              [ 'readonly', 'relativepath', 'modified' ]
            \            ],
            \   'right': [
            \              [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'filetype' ]
            \            ],
            \ },
            \ 'inactive': {
            \   'left':  [
            \              [ 'relativepath', 'modified' ]
            \            ],
            \   'right': [
            \              [ 'filetype' ]
            \            ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B'
            \ },
            \ 'tabline': {
            \   'left':  [
            \              ['buffers']
            \            ],
            \   'right': [
            \             ['tabs']
            \            ]
            \ },
            \ 'tabline_subseparator': {
            \   'left': '',
            \   'right': ''
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers'
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ },
            \ }
" }}}
" terminal {{{
nnoremap <leader>t :terminal<cr>
" }}}
" nerdtree {{{
nnoremap <leader>n <esc>:NERDTreeFind<cr>
let NERDTreeIgnore = ['\.pyc$']
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
" wiki {{{
let wiki = {}
let wiki.path = '~/Dropbox/vimwiki'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
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
" diff {{{
autocmd FilterWritePre * if &diff | execute 'windo set wrap' | endif
autocmd FilterWritePre * if &diff | execute 'IndentLinesDisable' | endif
" }}}
" git {{{
augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_gb
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal colorcolumn=73

    " turn off Capital letter check for the first letter
    autocmd FileType gitcommit setlocal spellcapcheck=
    autocmd FileType gitcommit nnoremap <buffer> <localleader>t 0"=BranchTicket()<cr>P
augroup END
" }}}
" jinja {{{
augroup jinja
    autocmd!
    autocmd FileType jinja setlocal colorcolumn=100
    autocmd FileType jinja setlocal commentstring={#%s#}

    " for preventing typing classname with _ instead of - by autocomplete
    autocmd Syntax jinja syntax region BEM_error start=/\v\w_[^_]/ end=/\v\w/me=e-1 containedin=htmlString,htmlTag contained

    autocmd Syntax jinja syntax region BEM_element start=/\v__/ end=/\v--/me=e-2 end=/\v"|\s/me=e-1 containedin=htmlString,htmlTag contained
    autocmd Syntax jinja syntax region BEM_modifier start=/\v--/ end=/\v"|\s/me=e-1 containedin=htmlString,htmlTag contained
    autocmd Syntax jinja highlight link BEM_element Label
    autocmd Syntax jinja highlight link BEM_modifier Conditional
    autocmd Syntax jinja highlight link BEM_error Error
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

    autocmd Syntax less syntax region BEM_element start=/\v__/ end=/\v--/me=e-2 end=/\v"|\s|:/me=e-1 containedin=lessClass contained
    autocmd Syntax less syntax region BEM_modifier start=/\v--/ end=/\v"|\s|:/me=e-1 containedin=lessClass contained
    autocmd Syntax less highlight def link BEM_element Label
    autocmd Syntax less highlight def link BEM_modifier Conditional

    autocmd FileType less execute "syntax sync fromstart"
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
augroup END
" }}}
" zshrc {{{
augroup filetype_zsh
    autocmd!
    autocmd FileType zsh setlocal foldmethod=marker
augroup END
" }}}
