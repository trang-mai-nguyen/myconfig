" call plug#begin('~/.vim/plugged')

" Plug 'ctrlpvim/ctrlp.vim' 

" call plug#end()

let g:ctrlp_map = '<c-p>'

set nocompatible

syntax on 

" Show line number
set number
set relativenumber

" Show the status line at the bottom 
set laststatus=2

" Buffers 
set hidden

" Search 

set ignorecase
set smartcase
set incsearch " set search at you type

" Disable audible bell 
set noerrorbells visualbell t_vb=

