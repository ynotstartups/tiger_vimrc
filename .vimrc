set nocompatible
filetype off
" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.nvim/plugged')
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Yggdroot/indentLine' " hightlight indentations
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column
Plug 'google/vim-searchindex' " shows number of search
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'jremmen/vim-ripgrep' " add Rg to vim
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire'
Plug 'markonm/traces.vim' " Range, pattern and substitute preview for Vim
Plug 'tpope/vim-commentary' " add shortcut gc for making a line comment
Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-unimpaired' " adds mapping like [q ]q
Plug 'vim-scripts/ReplaceWithRegister' " gr{motion} go replace
Plug 'w0rp/ale' " linters
call plug#end()

" change leader to space, this setting needs to be in the beginning
nnoremap <SPACE> <nop>
let mapleader = " "

" better setting
set shortmess+=IWA " ignore Intro, Written and swapfile exists
set laststatus=2 " status bar always on
set wildmenu
set wildignore=*.class,*.o,*~,*.pyc,.git  " Ignore certain files when finding files
set autoread " automatically apply changes from outside of Vim
set hidden " files leave the screen become hidden buffer
set backspace=indent,eol,start
set number " add line number before each line in vim
" set tabstop=4
" set shiftwidth=4
set expandtab " In Insert mode: Use the appropriate number of spaces to insert a <Tab>

" finding files
set path+=**
nnoremap <tab> :find<SPACE>

" file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" find key binding with netrw-browse-maps
" D    Attempt to remove the file(s)/directory(ies)
" gh   Quick hide/unhide of dot-files
" o    Enter the file/directory under the cursor in a new browser window. A horizontal split is used.
" R    Rename the designated file(s)/directory(ies)
" p    Preview the file
" %    Open a new file in netrw's current directory
" :e.  Open netrw

" color
syntax on
colorscheme molokai

" search
set ignorecase
set smartcase

" qq to record, @q to replay

" Make Y behave like other capitals
nnoremap Y y$

" shortcuts to edit certain files
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.txt<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>

" copy/paste
set clipboard+=unnamed " vim uses system clipboard

" ctags
" ctags -R .    " create ctags
" <ctrl>]       " jump to tagjump to tags

" plugins
" ale
let g:ale_echo_msg_format = '[ale] %linter%: %s'
let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort', 'black'],
            \}
let g:ale_fix_on_save = 1

" fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber

" set rtp+=/usr/local/opt/fzf

" add Rg command to grep
" command! -bang -nargs=* Rg
"             \ call fzf#vim#grep(
"             \   'rg --column --line-number --no-heading --color=always --smart-case --sort=modified '.<q-args>, 1,
"             \   <bang>0 ? fzf#vim#with_preview('up:60%')
"             \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"             \   <bang>0)

" nnoremap <leader>rw :Rg -e '<c-r><c-w>' <cr>

" GitGutter
" see help (shortcut K) for gitgutter-mappings
set updatetime=100 " how long (in milliseconds) the plugin will wait for GitGutter
" <Leader>hp              Preview the hunk under the cursor.
" <Leader>hs              Stage the hunk under the cursor.
" <Leader>hu              Undo the hunk under the cursor.
" ]c                      Jump to the next [count] hunk.
" [c                      Jump to the previous [count] hunk.
" Hunk text object:
" 'ic' operates on the current hunk's lines.  'ac' does the same but also includes
" trailing empty lines.

" indentLine
let g:indentLine_fileTypeExclude = ['help', 'man', 'gitcommit', 'json']
