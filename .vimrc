execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

let g:ycm_path_to_python_interpreter="/usr/bin/python"

" --- Settings ---
syntax on
" colorsbox-stnight oceandeep lucario
colorscheme lucario

" Tabs
" show existing tab with 4 spaces width
set tabstop=4 shiftwidth=4 expandtab

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set cursorline
set mouse=a
set scrolloff=3
set autoread

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "jhonmajoor\n"
        set guifont=Inconsolata\ for\ Powerline:h15
    endif
endif

" set hightlight for handlebars templates
au BufReadPost *.hbs set syntax=mustache

" no .swp files wile editing file
" set nobackup
" set swapfile
if !isdirectory(expand("~/.vim/backupdir/"))
    silent !echo "Creating backup dir..."
    silent !mkdir -p ~/.vim/backupdir
endif
if !isdirectory(expand("~/.vim/swap/"))
    silent !echo "Creating swap dir..."
    silent !mkdir -p ~/.vim/swap
endif
if !isdirectory(expand("~/.vim/undo/"))
    silent !echo "Creating undo dir..."
    silent !mkdir -p ~/.vim/undo
endif

" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//
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

" Alias for Bdelete delete buffer
:nnoremap <Leader>q :Bdelete<CR>

" Start NERDtree automatically
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl + n toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
