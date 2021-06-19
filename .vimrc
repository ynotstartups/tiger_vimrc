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
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Shougo/denite.nvim'
Plug 'Yggdroot/indentLine' " hightlight indentations
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column
" Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-table-mode' " use :TableModeToggle to input ascii table
Plug 'farmergreg/vim-lastplace' " Intelligently reopen files at your last edit position.
Plug 'google/vim-searchindex' " shows number of search
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline' | Plug 'maximbaz/lightline-ale' | Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire' | Plug 'sgur/vim-textobj-parameter' | Plug 'jeetsukumaran/vim-pythonsense'
Plug 'markonm/traces.vim' " Range, pattern and substitute preview for Vim
Plug 'mbbill/undotree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete and language server
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeFind'} " directory sidebar
Plug 'stephpy/vim-yaml'
Plug 'tomasr/molokai' " molokai theme
Plug 'tpope/vim-commentary' " add shortcut for making a line comment
Plug 'tpope/vim-fugitive' " Gbrowse
Plug 'tpope/vim-git' " git syntax highlight
Plug 'tpope/vim-repeat' " . to repeat
Plug 'tpope/vim-rhubarb' " github extension for fugitive
Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-unimpaired' " adds mapping like [q ]q
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
" filetype plugin indent on
" set smartindent

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
"  }}}
" save {{{
" nnoremap <leader>s :w<cr>
" nnoremap <leader>S :wa<cr>
" inoremap jk <esc>:w<cr>
" }}}
" important mappings {{{
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
nnoremap J <c-d>
nnoremap K <c-u>

" jump backward and forward
nnoremap <c-o> <c-o>zz
nnoremap <c-p> <c-i>zz


" apply . on each selected line, from vim training course
xnoremap . :normal .<CR>

" nnoremap <leader>h :nohlsearch<cr>

" remove other windows
" nnoremap <leader>o  :only<cr>

" nnoremap <leader>gb :Gblame<cr>
" nnoremap <leader>gp :GitGutterPreviewHunk<cr>
" nnoremap <leader>gu :GitGutterUndo<cr>
" }}}
" buffers {{{
set nostartofline
nnoremap <silent> <S-h> <esc>:bp<cr>
nnoremap <silent> <S-l> <esc>:bn<cr>
" map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>bo :BufOnly<cr>
" }}}
" windows management {{{
set splitbelow
" nnoremap <leader>q  <C-w><C-w>
" }}}
" quick reload/edit {{{
nnoremap <silent> <leader>ee :e#<cr>
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.txt<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>
" }}}
" folding text {{{
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

" }}}
" private {{{
" use for setting github enterpirce
execute "source " . $HOME . "/.vim/private.vim"
" }}}
" plugins
" ale {{{
let g:ale_echo_msg_format = '[ale] %linter%: %s'
let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort', 'black'],
            \}
let g:ale_fix_on_save = 1
"  }}}
" fzf {{{
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber

set rtp+=/usr/local/opt/fzf
nnoremap <tab> :FZF<cr>

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
nnoremap [c :GitGutterPrevHunk<cr>
nnoremap ]c :GitGutterNextHunk<cr>
" }}}
" indentLine {{{
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit', 'json']
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
" nerdtree {{{
nnoremap <leader>n <esc>:NERDTreeFind<cr>
let NERDTreeIgnore = ['\.pyc$']
" }}}
" sessions {{{
" make sure the color still works after opening session
set sessionoptions-=options  " Don't save options
" }}}
" lastplace {{{
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
" }}}
" unimpaired {{{
let g:nremap = {
            \ "[l": "",
            \ "]l": "",
            \ "[L": "",
            \ "]L": "",
            \ }

nnoremap <silent> [L :ALEFirst<cr>
nnoremap <silent> [l :ALEPrevious<cr>
nnoremap <silent> ]l :ALENext<cr>
nnoremap <silent> ]L :ALELast<cr>
" }}}
" python-syntax {{{
let g:python_highlight_all = 1
" }}}
" file specific
" python {{{
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
augroup END
" }}}
" Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Yaml {{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }}}
