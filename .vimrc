set nocompatible              " be iMproved, required
filetype off                  " required

" Normal settings
colorscheme nova
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set runtimepath^=~/.vim/bundle/ctrlp.vim
set backspace=indent,eol,start
set laststatus=2
set cursorline
set smarttab
set mouse=a
set scrolloff=3
set autoread
" set tabstop=2 shiftwidth=2 expandtab
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" swap files dest
set dir=/tmp

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "jhonmajoor\n"
        set guifont=Inconsolata\ for\ Powerline:h15
    endif
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'spf13/vim-colors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'matchit.zip'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'bling/vim-bufferline'
Plugin 'easymotion/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-abolish.git'
Plugin 'osyo-manga/vim-over'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'gcmt/wildfire.vim'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-wordy'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'luochen1990/rainbow'
" Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'spf13/PIV'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'
Plugin 'klen/python-mode'
Plugin 'yssource/python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'sangwook/vim-coloresque'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-markdown'
Plugin 'spf13/vim-preview'
Plugin 'tpope/vim-cucumber'
Plugin 'cespare/vim-toml'
Plugin 'quentindecock/vim-cucumber-align-pipes'
Plugin 'saltstack/salt-vim'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'mxw/vim-jsx'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'dkprice/vim-easygrep'
Plugin 'trevordmiller/nova-vim'
Plugin 'neovim/neovim'
Plugin 'Lokaltog/powerline'
Plugin 'blueyed/vim-diminactive'
Plugin 'tmux-plugins/vim-tmux-focus-events'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" CTRL-SHIFT-Right is next tab
noremap <C-S-Right> :<C-U>bnext<CR>
inoremap <C-S-Right> <C-\><C-N>:bnext<CR>
cnoremap <C-S-Right> <C-C>:bnext<CR>
" CTRL-SHIFT-Left is previous tab
noremap <C-S-Left> :<C-U>bprevious<CR>
inoremap <C-S-Left> <C-\><C-N>:bprevious<CR>
cnoremap <C-S-Left> <C-C>:bprevious<CR>

set hlsearch
" Line numbers
set number

" Ctrl-p settings
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" Ignore these directories
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/.git/**
set wildignore+=*/tmp/**

" Alias for Bdelete delete buffer
:nnoremap <Leader>q :Bdelete<CR>

" Start NERDtree automatically
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl + n toggle nerd tree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

"//////////////// Syntastic ////////////////
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers= ['python']
let g:pymode_rope = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"//////////////// Neocomplete ////////////////
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"//////////////// Easymotion ////////////////
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"//////////////// Airline ////////////////
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"//////////////// Undotree ////////////////
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif
