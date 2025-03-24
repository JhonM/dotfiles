-- General Neovim settings and options
vim.cmd('language en_US')

-- Enable filetype detection and plugin/indent loading
vim.cmd('filetype plugin indent on')

-- UI settings
vim.opt.guifont = "Inconsolata\\ for\\ Powerline:h15"
vim.g.Powerline_symbols = 'fancy'
vim.opt.encoding = 'utf-8'
vim.opt.fillchars = { stl = ' ', stlnc = ' ', vert = ' ' }
-- vim.opt.termencoding = 'utf-8'
vim.opt.runtimepath:append('~/.fzf')
vim.opt.backspace = 'indent,eol,start'
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.smarttab = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 3
vim.opt.autoread = true
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.lazyredraw = true
vim.opt.cursorline = false
vim.opt.signcolumn = 'yes'

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Status line
vim.opt.statusline:append('%F')

-- True color support
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Swap files destination
vim.opt.dir = '/tmp'

-- Clipboard settings
vim.opt.clipboard:append('unnamedplus')

-- Ignore directories for wildmenu
vim.opt.wildignore:append({
  '*/node_modules/**',
  '*/bower_components/**',
  '*/.git/**',
  '*/tmp/**'
})

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable termguicolors if supported
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- Enable syntax highlighting
vim.cmd('syntax enable')
