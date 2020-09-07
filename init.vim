if &compatible
  set nocompatible  " Be iMproved
endif

" Required:
filetype plugin indent on
syntax enable

" Ruler
set number
set relativenumber

" path to python 3
let g:python3_host_prog = '/usr/bin/python3'
let g:ruby_host_prog = "~/.gem/ruby/2.7.0/bin/neovim-ruby-host"
