local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.dotfiles/nvim/lua/?.lua;" .. home .. "/.dotfiles/nvim/lua/?/init.lua"

-- Main Neovim configuration file

-- Load general options
require("config.options")

-- Load keymaps
require("config.keymaps")

-- Load plugins
require("config.plugins")

-- Load autocommands
require("config.autocmds")

-- Load plugin configurations
require("config.plugin_loader").setup()

require("config.fzf").setup()

require("auto-dark-mode").setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.o.background = "dark"
  end,
  set_light_mode = function()
    vim.o.background = "light"
  end,
})
