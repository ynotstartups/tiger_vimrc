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
Plug 'Yggdroot/indentLine' " hightlight indentations
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column
Plug 'google/vim-searchindex' " shows number of search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire'
Plug 'markonm/traces.vim' " Range, pattern and substitute preview for Vim
Plug 'tomasr/molokai' " molokai theme
Plug 'tpope/vim-commentary' " add shortcut for making a line comment
Plug 'tpope/vim-git' " git syntax highlight for interative rebase
Plug 'tpope/vim-repeat' " . to repeat
Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-unimpaired' " adds mapping like [q ]q
Plug 'vim-python/python-syntax'
" Plug 'vim-scripts/BufOnly.vim'
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
set wildmenu
" set wildignore=*.class,*.o,*~,*.pyc,.git  " Ignore certain files in tab-completion
set updatetime=100 " how long (in milliseconds) the plugin will wait for GitGutter
set autoread " automatically apply changes from outside of Vim
" disable for command line window
au CursorHold * checktime
set hidden " no need to save when change buffer
set cmdheight=2 " set command line height to 2
set backspace=indent,eol,start
set iskeyword+=-
set iskeyword+=_
set iskeyword+=%
set number
" }}}
" finding files {{{
set path+=**
nnoremap <tab> :find<SPACE>
" }}}
" file browsing {{{
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" find key binding with netrw-browse-maps
" D	   Attempt to remove the file(s)/directory(ies)         |netrw-D|
" gh   Quick hide/unhide of dot-files                       |netrw-gh|
" o    Enter the file/directory under the cursor in a new   netrw-o
"      browser window.  A horizontal split is used.
" R    Rename the designated file(s)/directory(ies)


" }}}
" color {{{
set t_Co=256
syntax on
set background=dark
colorscheme molokai
" MatchParen highlighting makes it look like cursor jumped to matching parenthesis
" hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold

" less offensive hlsearch color
" hi Search cterm=NONE ctermfg=0 ctermbg=3
" }}}
" indent {{{
" filetype plugin indent on
" set smartindent

set tabstop=4
set shiftwidth=4
set expandtab " In Insert mode: Use the appropriate number of spaces to insert a <Tab>

" }}}
" search {{{
set ignorecase
set smartcase
" set hlsearch
" set incsearch

" permanent very magic mode
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
"  }}}
" important mappings {{{
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" qq to record, Q to replay
nnoremap Q @q

" Make Y behave like other capitals
nnoremap Y y$

" apply . on each selected line, from vim training course
xnoremap . :normal .<CR>
" }}}
" quick reload/edit {{{
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.txt<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>
" }}}
" copy/paste {{{
set clipboard=unnamed

" copy with indent and set cursor to the end of paste
nnoremap p p=`]`]
" }}}
" undo/swap extra dir {{{
" Persistent undo, remember to mkdir ~/.vim/undo
" set undofile
" set undodir=~/.vim/undo

" set undolevels=1000
" set undoreload=10000

" swap file in a diff directory
" set directory=~/.vim/swap//
" }}}
" private {{{
" use for setting github enterpirce
" execute "source " . $HOME . "/.vim/private.vim"
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
" nnoremap <tab> :FZF<cr>

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case --sort=modified '.<q-args>, 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

nnoremap <leader>rw :Rg -e '<c-r><c-w>' <cr>
"  }}}
" GitGutter  {{{
let g:gitgutter_map_keys = 0
nnoremap [c :GitGutterPrevHunk<cr>
nnoremap ]c :GitGutterNextHunk<cr>
" }}}
" indentLine {{{
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit', 'json']
" }}}
" python-syntax {{{
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
" }}}
