call plug#begin('~/.local/share/nvim/plugged')
	Plug 'pangloss/vim-javascript'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'szw/vim-maximizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mhartington/oceanic-next'
  Plug 'trevordmiller/nova-vim'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
call plug#end()

set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=75
set cursorline

filetype plugin indent on


let mapleader = "\<space>"
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme nova

let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

" don't remap Arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Space> <Nop>

nnoremap <leader>w <C-W>
nnoremap <leader>bn :bn<cr>

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'nova',
      \ }

nnoremap <leader>v :e $MYVIMRC<CR>

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" sbdshd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>
