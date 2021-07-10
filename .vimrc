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
Plug 'jremmen/vim-ripgrep' " add :Rg command to vim
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire'
Plug 'markonm/traces.vim' " Range, pattern and substitute preview for Vim
Plug 'tpope/vim-commentary' " add shortcut gc for making a line comment
Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-unimpaired' " adds mapping like [q ]q
Plug 'vim-scripts/ReplaceWithRegister' " gr{motion} go replace
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
set expandtab " In Insert mode: Use the appropriate number of spaces to insert a <Tab>

" finding files
set path+=** " recursive by default when using :find

" file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" find key binding with netrw-browse-maps
" :e .  Open netrw
" D    Attempt to remove the file(s)/directory(ies)
" gh   Quick hide/unhide of dot-files
" o    Enter the file/directory under the cursor in a new browser window. A horizontal split is used.
" R    Rename the designated file(s)/directory(ies)
" p    Preview the file
" %    Open a new file in netrw's current directory

" color
syntax on
colorscheme molokai

" search
set ignorecase
set smartcase

" qq to record, @q to replay

" Y to yank to the end of the line, mimic other capital commands
nnoremap Y y$

" shortcuts to edit certain files
nnoremap <silent> <leader>eu :e ~/Dropbox/vimwiki/USEFUL COMMANDS.txt<cr>
nnoremap <silent> <leader>ev :e ~/Documents/tiger_vimrc/.vimrc<cr>

" copy/paste
set clipboard+=unnamed " vim uses system clipboard

" ctags
" ctags -R .    " create ctags
" <ctrl>]       " jump to tagjump to tags

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
let g:indentLine_fileTypeExclude = ['help']
" let g:indentLine_fileTypeExclude = ['help', 'gitcommit', 'json']
