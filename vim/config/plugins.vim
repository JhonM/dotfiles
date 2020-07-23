call plug#begin('~/.local/share/nvim/plugged')
" set runtimepath=~/.dotfiles/vim/config/plugins
" runtime! **/plug.vim
" Plug 'scrooloose/nerdtree' V
" Plug 'tpope/vim-surround' V
" Plug 'tpope/vim-repeat' V
" Plug 'rhysd/conflict-marker.vim' V
" Plug 'jiangmiao/auto-pairs' X
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } V
" Plug 'junegunn/fzf.vim' V
" " Plug 'terryma/vim-multiple-cursors'
" Plug 'vim-scripts/sessionman.vim' X
" Plug 'vim-airline/vim-airline' V
" Plug 'vim-airline/vim-airline-themes' V
" Plug 'powerline/fonts' V
" Plug 'bling/vim-bufferline' X
" Plug 'easymotion/vim-easymotion' X
" Plug 'jistr/vim-nerdtree-tabs' X
" " Plug 'flazz/vim-colorschemes'
" Plug 'mbbill/undotree' V
" Plug 'nathanaelkane/vim-indent-guides' V
" Plug 'vim-scripts/restore_view.vim' V
" Plug 'mhinz/vim-signify' V
" Plug 'osyo-manga/vim-over' X
" Plug 'kana/vim-textobj-user' X
" Plug 'kana/vim-textobj-indent' X
" Plug 'gcmt/wildfire.vim' X
" Plug 'reedes/vim-litecorrect' X
" Plug 'reedes/vim-textobj-sentence' X
" Plug 'reedes/vim-textobj-quote' X
" Plug 'reedes/vim-wordy' X
" Plug 'tpope/vim-fugitive' x
" Plug 'mattn/webapi-vim' X
" Plug 'mattn/gist-vim' X
" Plug 'scrooloose/nerdcommenter' X
" Plug 'tpope/vim-commentary' V
" Plug 'godlygeek/tabular' X
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'wokalski/autocomplete-flow'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" " Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/context_filetype.vim'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" " Plug 'spf13/PIV'
" Plug 'klen/python-mode'
" Plug 'yssource/python.vim'
" Plug 'elzr/vim-json'
" " Plug 'groenewege/vim-less'
" " Plug 'sangwook/vim-coloresque'
" " Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-markdown'
" " Plug 'spf13/vim-preview'
" " Plug 'cespare/vim-toml'
" " Plug 'saltstack/salt-vim'
" Plug 'joukevandermaas/vim-ember-hbs'
" Plug 'mxw/vim-jsx'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'dkprice/vim-easygrep'
" " Plug 'trevordmiller/nova-vim'
" Plug 'Lokaltog/powerline'
" " Plug 'blueyed/vim-diminactive'
" Plug 'TaDaa/vimade'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'w0rp/ale'
" Plug 'mhartington/oceanic-next'
" " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'matze/vim-move'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'othree/yajs.vim'
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx']  }
" " Plug 'othree/html5.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'sheerun/vim-polyglot'
" Plug 'iamcco/markdown-preview.vim'
" " Plug 'Skywind3000/vim-preview'
" Plug 'junegunn/goyo.vim'
" Plug 'tpope/vim-obsession'
" " Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" " Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'majutsushi/tagbar'
" Plug 'christoomey/vim-sort-motion'
" Plug 'christoomey/vim-system-copy'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx']}
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install','for': ['javascript', 'javascript.jsx']  }
" Plug 'ncm2/float-preview.nvim'
" Plug 'voldikss/vim-translator'
" " Plug '907th/vim-auto-save'
" " Plug 'mg979/vim-visual-multi'


source ~/.dotfiles/vim/config/plugins/nerdtree/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-surround/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-repeat/plug.vim
source ~/.dotfiles/vim/config/plugins/conflict-marker/plug.vim
source ~/.dotfiles/vim/config/plugins/fzf/plug.vim
source ~/.dotfiles/vim/config/plugins/fzf-vim/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-airline/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-airline-themes/plug.vim
source ~/.dotfiles/vim/config/plugins/powerline-fonts/plug.vim
source ~/.dotfiles/vim/config/plugins/undotree/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-indent-guides/plug.vim
source ~/.dotfiles/vim/config/plugins/restore-view/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-signify/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-fugitive/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-commentary/plug.vim
source ~/.dotfiles/vim/config/plugins/oceanic-next/plug.vim

call plug#end()
