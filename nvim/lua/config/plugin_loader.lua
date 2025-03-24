-- Plugin loader to initialize all plugin configurations

local M = {}

-- Load all plugin configurations
function M.setup()
  -- Load CoC configuration
  require('plugins.coc')()
  
  -- Load Avante configuration
  require('plugins.avante')()
  
  -- Add more plugin configurations here as you convert them
  -- Example: require('plugins.fzf')()
end

return M
