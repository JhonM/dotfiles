call plug#begin('~/.local/share/nvim/plugged')

" source ~/.dotfiles/vim/config/plugins/nerdtree/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-surround/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-repeat/plug.vim
source ~/.dotfiles/vim/config/plugins/conflict-marker/plug.vim
source ~/.dotfiles/vim/config/plugins/auto-pairs/plug.vim
source ~/.dotfiles/vim/config/plugins/fzf/plug.vim
source ~/.dotfiles/vim/config/plugins/fzf-vim/plug.vim
" source ~/.dotfiles/vim/config/plugins/vim-airline/plug.vim
" source ~/.dotfiles/vim/config/plugins/vim-airline-themes/plug.vim
source ~/.dotfiles/vim/config/plugins/powerline-fonts/plug.vim
source ~/.dotfiles/vim/config/plugins/undotree/plug.vim
" source ~/.dotfiles/vim/config/plugins/vim-indent-guides/plug.vim
source ~/.dotfiles/vim/config/plugins/restore-view/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-signify/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-fugitive/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-commentary/plug.vim
source ~/.dotfiles/vim/config/plugins/oceanic-next/plug.vim
" source ~/.dotfiles/vim/config/plugins/ncm2/plug.vim
source ~/.dotfiles/vim/config/plugins/neosnippet/plug.vim
source ~/.dotfiles/vim/config/plugins/neosnippet-snippets/plug.vim
" source ~/.dotfiles/vim/config/plugins/deoplete-ternjs/plug.vim
source ~/.dotfiles/vim/config/plugins/tern-for-vim/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-system-copy/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-polyglot/plug.vim
" source ~/.dotfiles/vim/config/plugins/ale/plug.vim
" source ~/.dotfiles/vim/config/plugins/vim-nerdtree-syntax-highlight/plug.vim
source ~/.dotfiles/vim/config/plugins/vimade/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-devicons/plug.vim
source ~/.dotfiles/vim/config/plugins/conoline-vim/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-tmux-focus-events/plug.vim
source ~/.dotfiles/vim/config/plugins/coc/plug.vim
source ~/.dotfiles/vim/config/plugins/lightline/plug.vim
source ~/.dotfiles/vim/config/plugins/markdown-preview/plug.vim
source ~/.dotfiles/vim/config/plugins/indent-line/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-maximizer/plug.vim
source ~/.dotfiles/vim/config/plugins/vimspector/plug.vim
source ~/.dotfiles/vim/config/plugins/dracula/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-test/plug.vim
" source ~/.dotfiles/vim/config/plugins/copilot/plug.vim
source ~/.dotfiles/vim/config/plugins/vim-material/plug.vim
source ~/.dotfiles/vim/config/plugins/auto-dark-mode/plug.vim
source ~/.dotfiles/vim/config/plugins/choose-win/plug.vim
source ~/.dotfiles/vim/config/plugins/dressing/plug.vim
" Load dependencies before Avante
source ~/.dotfiles/vim/config/plugins/nui/plug.vim
source ~/.dotfiles/vim/config/plugins/plenary/plug.vim
source ~/.dotfiles/vim/config/plugins/render-markdown/plug.vim
source ~/.dotfiles/vim/config/plugins/img-clip/plug.vim
source ~/.dotfiles/vim/config/plugins/nvim-cmp/plug.vim
source ~/.dotfiles/vim/config/plugins/nvim-treesitter/plug.vim
source ~/.dotfiles/vim/config/plugins/nvim-web-devicons/plug.vim
source ~/.dotfiles/vim/config/plugins/copilot-lua/plug.vim
" Load Avante after its dependencies
source ~/.dotfiles/vim/config/plugins/avante/plug.vim

call plug#end()


" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
