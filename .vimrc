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
Plug 'FooSoft/vim-argwrap'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'epilande/vim-es2015-snippets' | Plug 'epilande/vim-react-snippets'
Plug 'Yggdroot/indentLine' " hightlight indentations
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'farmergreg/vim-lastplace'
Plug 'google/vim-searchindex'
Plug 'guns/xterm-color-table.vim'
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline' | Plug 'maximbaz/lightline-ale' | Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire' | Plug 'sgur/vim-textobj-parameter' | Plug 'fvictorio/vim-textobj-backticks' | Plug 'poetic/vim-textobj-javascript' | Plug 'kana/vim-textobj-function' | Plug 'haya14busa/vim-textobj-function-syntax' | Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'keith/swift.vim'
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " autocomplete and language server
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeFind'} " directory sidebar
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git' " git syntax highlight
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb' " github extension for fugitive
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/ReplaceWithRegister' " gr{motion} go replace
Plug 'w0rp/ale' " linters
call plug#end()
" }}}
" change leader to space, has to be in the beginning
nnoremap <SPACE> <nop>
let mapleader = " "
" sane settings {{{
set shortmess+=IWA " ignore Intro, Written and swapfile exists
set laststatus=2 " status bar always on
set colorcolumn=80
set wildmenu
set wildignore=*.class,*.o,*~,*.pyc,.git  " Ignore certain files in tab-completion
set updatetime=100 " how how long (in milliseconds) the plugin will wait for GitGutter
set autoread
" disable for command line window
au CursorHold * checktime
set hidden " no need to save when change buffer
set cmdheight=2 " set command line height to 2
set backspace=indent,eol,start
set iskeyword+=-
set iskeyword+=_
set iskeyword+=%
set noshowmode
let maplocalleader="`"
set foldmethod=marker
set number
" }}}
" color {{{
set t_Co=256
syntax on
set background=dark
colorscheme molokai
" MatchParen highlighting makes it look like cursor jumped to matching parenthesis
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold

" less offensive hlsearch color
hi Search cterm=NONE ctermfg=0 ctermbg=3
" }}}
" indent {{{
filetype plugin indent on
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

" }}}
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

" Keep search matches in the middle of the window.
nmap n nzzzv<Plug>SearchIndex
nmap N Nzzzv<Plug>SearchIndex
nnoremap * *N

nnoremap <leader>k K
"  }}}
" save {{{
nnoremap <leader>s :w<cr>
nnoremap <leader>S :wa<cr>
inoremap jk <esc>:w<cr>
" }}}
" sane mappings {{{
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

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

inoremap jj <esc>
cnoremap jj <c-c>

" upper case whole word for writing constant
inoremap <m-u> <esc>viwU<esc>ea
nnoremap <m-u> <esc>viwU<esc>e

" jump backward and forward
nnoremap <c-o> <c-o>zz
nnoremap <c-p> <c-i>zz

nnoremap <leader>h :noh<cr>

nnoremap <leader>wq :wq<cr>

" apply . on each selected line, from vim training course
xnoremap . :normal .<CR>

nnoremap <c-p> <c-i>
" }}}
" buffers {{{
set nostartofline
nnoremap <silent> <S-h> <esc>:bp<cr>
nnoremap <silent> <S-l> <esc>:bn<cr>
map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>bo :BufOnly<cr>

nnoremap <m-w> :bd<cr>
" }}}
" windows {{{
nnoremap <leader>x  :split<cr><c-w><c-w>
set splitbelow

nnoremap <leader>q  <C-w><C-w>
nnoremap <leader>o  :only<cr>
nnoremap <leader>=  :resize +5<cr>
nnoremap <leader>-  :resize -5<cr>
nnoremap <leader>v= :vertical resize +30<cr>
nnoremap <leader>v- :vertical resize -30<cr>

map <m-s> :split<cr>
" }}}
" quick reload/edit {{{
nnoremap <silent> <leader>ee :e#<cr>
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.txt<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>
" }}}
" folding {{{
nnoremap \ za
xnoremap iz :<C-U>silent!normal![zV]z<CR>
onoremap iz :normal viz<CR>
" https://gist.github.com/sjl/3360978
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart
    return line[:-4].'('.foldedlinecount.')'.repeat(" ",9999)
endfunction
set foldtext=MyFoldText()
" }}}
" copy/paste {{{
set clipboard=unnamed

" copy with indent and set cursor to the end of paste
nnoremap p p=`]`]

nnoremap <leader>cf :let @*=expand("%:t")<cr>
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
nnoremap U <c-r>

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
" if has("autocmd")
"     autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"                 \| exe "normal! g`\"" | endif
" endif

" }}}
" private {{{
" use for setting github enterpirce
execute "source " . $HOME . "/.vim/private.vim"
" }}}
" plugins
" argwrap {{{
let g:argwrap_tail_comma = 1
let g:autotagTagsFile="TAGS"
" }}}
" ale {{{
let g:ale_echo_msg_format = '[ale] %linter%: %s'
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort', 'black'],
            \   'rust': ['rustfmt'],
            \}
let g:ale_fix_on_save = 1
"  }}}
" coc {{{

" set completeopt-=preview " for disabling the autocomplete preview
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)

" nnoremap <silent> <leader>R :call <Plug>(coc-rename)<cr>

" Use K for show documentation in preview window
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" }}}
"
" django custom {{{
function! JumpToType(extension)
    let l:fileName = expand('%:t:r')

    let l:fileName = substitute(l:fileName, 'test_', '', '')
    let l:fileName = substitute(l:fileName, '\.stories', '', '')
    let l:fileName = substitute(l:fileName, '[-_]', '.', 'g')

    if a:extension == "test"
        let l:fileName = "/test." . l:fileName . ".py"
    else
        let l:fileName = "/".l:fileName .".". a:extension
    endif
    " TODO error when ag gives back more than 1 result
    execute "edit ".system("ag -g ".l:fileName)
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
nmap a <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" }}}
" fzf {{{
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber

set rtp+=/usr/local/opt/fzf
nnoremap <tab> :FZF<cr>
nnoremap <leader><space> :FZF<cr>
nnoremap <leader>pb :Buffers<cr>
nnoremap <leader>pl :Commits<cr>
nnoremap <leader>pg :GFiles?<cr>
nnoremap <leader>pm :History<cr>
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
            \ 'source': 'rg -n ^ --color always -g *.'.expand('%:e'),
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

command! -bang -nargs=* History call fzf#vim#history({'options': '--no-sort'})

nnoremap <leader>rw :Rg -e '<c-r><c-w>' <cr>
"  }}}
" Git/Fugitive {{{
let g:gitgutter_map_keys = 0

command! -bar -bang -nargs=* Gcv :Gcommit<bang> -v <args>

nnoremap <leader>gp :GitGutterPreviewHunk<cr>
nnoremap <leader>gu :GitGutterUndo<cr>
nnoremap <leader>gS :GitGutterStageHunk<cr>
nnoremap <leader>gU :let gitgutter_diff_base='upstream/master' <bar> GitGutterAll<cr>
nnoremap [c :GitGutterPrevHunk<cr>
nnoremap ]c :GitGutterNextHunk<cr>

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
" }}}
" indentLine {{{
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit', 'json']
" }}}
" jedi {{{
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>Jd"
let g:jedi#goto_assignments_command = "<leader>Ja"
let g:jedi#usages_command = "<leader>Ju"
let g:jedi#documentation_command = "<leader>k"
" }}}
" LanguageClient-neovim {{{
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'python': ['/Users/tigerhuang/Documents/env/lyst3/bin/pyls'],
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ }
" let g:LanguageClient_diagnosticsEnable=0
" " let g:LanguageClient_hasSnippetSupport=0

" nnoremap <leader>pc :call LanguageClient_contextMenu()<CR>

" function! LC_maps()
"     if has_key(g:LanguageClient_serverCommands, &filetype)
"         nnoremap <buffer> <silent> <leader>k :call LanguageClient#textDocument_hover()<cr>
"         nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"         " nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"     endif
" endfunction

" autocmd FileType * call LC_maps()
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
            \              [ 'gitbranch' ],
            \              [ 'readonly', 'relativepath', 'modified' ]
            \            ],
            \   'right': [
            \              [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'filetype' ],
            \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
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
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
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
            \   'buffers': 'lightline#bufferline#buffers',
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel',
            \   'linter_checking': 'left',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left',
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

" require otherwise it will replace tab in insert mode
let g:UltiSnipsExpandTrigger = "<NUL>"
" let g:UltiSnipsJumpForwardTrigger="<cr>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" " Expand snippet or return
" let g:ulti_expand_res = 0
" function! Ulti_ExpandOrEnter()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res
"         return ''
"     else
"         return "\<return>"
" endfunction

" " Set <return> as primary trigger
" inoremap <silent> <return> <C-R>=Ulti_ExpandOrEnter()<cr>

let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]
" }}}
" unimpaired {{{
let g:nremap = {
            \ "[t": "",
            \ "]t": "",
            \ "[T": "",
            \ "]T": "",
            \ "[l": "",
            \ "]l": "",
            \ "[L": "",
            \ "]L": "",
            \ }
nnoremap <silent> [t :tabprevious<cr>
nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [T :tabfirst<cr>
nnoremap <silent> ]T :tablast<cr>

nnoremap <silent> [L :ALEFirst<cr>
nnoremap <silent> [l :ALEPrevious<cr>
nnoremap <silent> ]l :ALENext<cr>
nnoremap <silent> ]L :ALELast<cr>
" }}}
" Autoload {{{
let g:use_autoload=0
function! Autoload()
    if g:use_autoload
        silent execute "!osascript /Users/tigerhuang/Documents/applescript_learning/open_or_reload.scpt"
    endif
endfunction
augroup autoload
    autocmd!
    autocmd FileType python autocmd! BufWritePost <buffer> call Autoload()
    autocmd FileType jinja autocmd! BufWritePost <buffer> call Autoload()
augroup END
" }}}
" file specific
" git {{{
source $HOME/Documents/tiger_vimrc/python/jira.py

augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_gb
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal colorcolumn=73

    " turn off Capital letter check for the first letter
    autocmd FileType gitcommit setlocal spellcapcheck=
    autocmd FileType gitcommit map <buffer> <localleader>t :py3 branch_ticket()<cr>
    autocmd FileType gitcommit map <buffer> <localleader>j :py3 jira_link()<cr>
augroup END
" }}}
" Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
