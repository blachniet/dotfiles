" General
set nocompatible              " be iMproved, required
set number
set backspace=indent,eol,start

" Key mappings
nnoremap ; :
inoremap jk <ESC>

" Plugins

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Colors
syntax on
set cursorline
set background=dark
colorscheme solarized

set encoding=utf-8
