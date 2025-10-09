" cSpell:disable
language en_US

filetype off

filetype plugin indent on    " required
" Normal settings
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
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
set lazyredraw
set cursorline!
set signcolumn=yes

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set statusline+=%F

" swith between abosolut and relativen line numbers
augroup numberToggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" swap files dest
set dir=/tmp

set fillchars+=vert:\ 
hi vertsplit guifg=fg guibg=bg

" Specify a directory for plugin
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

" Next buffer
nnoremap <leader>bn :bn<cr>

" Previous buffer
nnoremap <leader>bp :bp<cr>

" Delete current buffer and go to next buffer in window
nnoremap <leader>bnd :bn\|bd#<cr>

" Delete current buffer and go to previous buffer in window
nnoremap <leader>bpd :bp\|bd#<cr>

" Show changed files in git
nnoremap <leader>gf :GitFiles?<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>

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
" tnoremap <Esc> <C-\><C-n>

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

" Custom Eslint Fix
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx call EslintFix()

function! EslintFix()
  let l:eslint = executable('eslint_d') ? 'eslint_d' : 'eslint'
  let l:filename = expand('%:p')

  " Find the nearest package.json upwards from the current file
  let l:root = finddir('node_modules', '.;')
  if empty(l:root)
    echo "No node_modules directory found in parent directories."
    return
  endif

  let l:cwd = fnamemodify(l:root, ':h')
  let l:cmd = printf('cd %s && %s --fix %s', shellescape(l:cwd), l:eslint, shellescape(l:filename))

  call system(l:cmd)
endfunction
