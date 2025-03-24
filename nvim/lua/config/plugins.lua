-- Plugin management with packer.nvim

-- Bootstrap packer.nvim if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Plugins from vim-plug configuration
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'rhysd/conflict-marker.vim'
  use 'jiangmiao/auto-pairs'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'
  use 'powerline/fonts'
  use 'mbbill/undotree'
  use 'vim-scripts/restore_view.vim'
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'mhartington/oceanic-next'
  use 'Shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'
  use 'ternjs/tern_for_vim'
  use 'christoomey/vim-system-copy'
  use 'sheerun/vim-polyglot'
  use 'TaDaa/vimade'
  use 'ryanoasis/vim-devicons'
  use 'miyakogi/conoline.vim'
  use 'tmux-plugins/vim-tmux-focus-events'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'itchyny/lightline.vim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'Yggdroot/indentLine'
  use 'szw/vim-maximizer'
  use 'puremourning/vimspector'
  use 'dracula/vim'
  use 'vim-test/vim-test'
  use 'marko-cerovac/material.nvim'
  use 'f-person/auto-dark-mode.nvim'
  use 't9md/vim-choosewin'
  use 'stevearc/dressing.nvim'
  use 'hzchirs/vim-material'
  
  -- Dependencies for Avante
  use 'MunifTanjim/nui.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'yetone/render-markdown.nvim'
  use 'img-clip/img-clip.nvim'
  use 'hrsh7th/nvim-cmp'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-tree/nvim-web-devicons'
  use 'zbirenbaum/copilot.lua'
  
  -- Avante plugin
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = function() vim.fn['avante#build']('source=true') end,
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'yetone/render-markdown.nvim',
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim'
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
