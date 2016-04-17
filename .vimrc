execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" --- Settings ---
syntax on
" colorsbox-stnight oceandeep
colorscheme colorsbox-stnight

" Tabs
" show existing tab with 4 spaces width
set tabstop=4 shiftwidth=4 expandtab

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set cursorline
set mouse=a
set scrolloff=3

" no .swp files wile editing file
set nobackup
set swapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" set dir=~/tmp

set hlsearch
" Line numbers
set number

" Ctrl-p settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" map Ctrl+c to insert text in function
imap <C-c> <CR><Esc>O
