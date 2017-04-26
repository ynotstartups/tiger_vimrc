set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

syntax enable
colorscheme molokai

set tabstop=4
