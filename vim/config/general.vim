" cSpell:disable
filetype off

filetype plugin indent on    " required
" Normal settings
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set runtimepath^=~/.fzf
set backspace=indent,eol,start
set laststatus=2
set cursorline
set smarttab
set mouse=a
set scrolloff=3
set autoread
" set tabstop=2 shiftwidth=2 expandtab
set number
set hlsearch
set relativenumber
set lazyredraw
set cursorline!

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set statusline+=%F


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" swap files dest
set dir=/tmp

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

" don't remap Arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Space> <Nop>

set clipboard+=unnamedplus

let mapleader = "\<space>"

nnoremap <leader>w <C-W>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>tn gt

" CTRL-SHIFT-Right is next tab
" noremap <C-S-Right> :<C-U>bnext<CR>
" inoremap <C-S-Right> <C-\><C-N>:bnext<CR>
" cnoremap <C-S-Right> <C-C>:bnext<CR>
" CTRL-SHIFT-Left is previous tab
" noremap <C-S-Left> :<C-U>bprevious<CR>
" inoremap <C-S-Left> <C-\><C-N>:bprevious<CR>
" cnoremap <C-S-Left> <C-C>:bprevious<CR>

" Ignore these directories
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/.git/**
set wildignore+=*/tmp/**

" Alias for Bdelete delete buffer
nnoremap <leader>q :Bdelete<CR>

"//////////////// ALE ////////////////
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

"Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"Open terminal on <leader>+n
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction

nnoremap <leader>n :call OpenTerminal() <CR>

" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.hbs set filetype=handlebars
" augroup END
