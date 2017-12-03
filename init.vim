
" call deoplete#enable()
"set nocompatible              " be iMproved, required
filetype off                  " required

" Normal settings
colorscheme nova
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
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
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set statusline+=%F

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Use deoplete
let g:deoplete#enable_at_startup = 1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
set termguicolors

" swap files dest
set dir=/tmp

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number relativenumber         " relative line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set "backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/restore_view.vim'
Plug 'mhinz/vim-signify'
Plug 'osyo-manga/vim-over'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'gcmt/wildfire.vim'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-wordy'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
" Plug 'Shougo/neocomplete.vim.git'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim'

Plug 'honza/vim-snippets'
Plug 'spf13/PIV'
Plug 'klen/python-mode'
Plug 'yssource/python.vim'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'hail2u/vim-css3-syntax'
Plug 'sangwook/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-markdown'
Plug 'spf13/vim-preview'
Plug 'cespare/vim-toml'
Plug 'saltstack/salt-vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mxw/vim-jsx'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mustache/vim-mustache-handlebars'
Plug 'dkprice/vim-easygrep'
Plug 'trevordmiller/nova-vim'
Plug 'Lokaltog/powerline'
Plug 'blueyed/vim-diminactive'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'w0rp/ale'
Plug 'mhartington/oceanic-next'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

" /////////// Deoplete //////////////////
" let g:deoplete#enable_at_startup = 1

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
" let g:ctrlp_max_files = 0
" Search from current directory instead of project root
" let g:ctrlp_working_path_mode = 0

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

"//////////////// ALE ////////////////
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.hbs set filetype=handlebars
augroup END

" subset of linters to run
let g:ale_linters = { 'jsx': ['stylelint', 'eslint'],  'javascript': ['eslint'], 'handlebars': ['ember-template-lint'], 'scss': ['scss', 'sass'], 'vim': ['vim'] }
let g:ale_linter_aliases = {'jsx': 'css'}

" :ALEFix will try and fix your JS code with ESLint.
"let g:ale_fixers = {
"\   'javascript': ['eslint'],
"\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
"let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1


"///////////////// Pymode //////////////////
let g:pymode_options = 0
let g:pymode_lint_signs = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0

"//////////////// Airline ////////////////
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"//////////////// Undotree ////////////////
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif
"//////////////// Diminactive ////////////////
let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']
let g:diminactive_enable_focus = 1
let g:diminactive_use_syntax = 1

"///////////////// FZF /////////////////////
" fzf buffers
"
map <c-p> :FZF<CR>
let s:fzf_buffers = []

function! FzfBufEntered()
  " move the current buffer to the top of the list
  let l:name = resolve(expand("<afile>"))
  if name != "" && name !~ "NERD_tree_.*"
    let l:i = index(s:fzf_buffers, name)
    if i != -1
      call remove(s:fzf_buffers, i)
    endif
    let s:fzf_buffers = insert(s:fzf_buffers, name)
  endif
endfunction

function! FzfBufDeleted()
  " remove the buffer being deleted from the list
  let l:name = resolve(expand("<afile>"))
  if name != ""
    let l:idx = index(s:fzf_buffers, name)
    if idx != -1
      call remove(s:fzf_buffers, idx)
    endif
  endif
endfunction

augroup fzfbuf
  autocmd!
  autocmd BufAdd,BufEnter * call FzfBufEntered()
  autocmd BufDelete * call FzfBufDeleted()
augroup END

command! FZFBuffers call fzf#run({
  \'source': s:fzf_buffers,
  \'sink' : 'e ',
  \'options' : '-m',
  \'tmux_height' : 8,
  \})

" fzf search lines
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

" fzf ag
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag git ls-files --nogroup --column --color --smart-case --exclude-standard --others --cached "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '100%'
\ })

