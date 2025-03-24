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
