execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" --- Settings ---
syntax on
" colorsbox-stnight oceandeep
colorscheme colorsbox-stnight
set runtimepath^=~/.vim/bundle/ctrlp.vim
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set cursorline
set mouse=a
set scrolloff=3

set hlsearch
" Line numbers
set number

" Tabs
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Ctrl-p settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" map Ctrl+c to insert text in function
imap <C-c> <CR><Esc>
