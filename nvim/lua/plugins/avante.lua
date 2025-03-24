-- Avante plugin configuration

return function()
  -- Explicitly load all dependencies first
  local dependencies = {
    'nvim-treesitter',
    'dressing',
    'plenary',
    'nui.popup',
    'render-markdown'
  }

  local missing_deps = {}
  for _, dep in ipairs(dependencies) do
    local ok, _ = pcall(require, dep)
    if not ok then
      table.insert(missing_deps, dep)
      vim.notify('Failed to load dependency: ' .. dep, vim.log.levels.WARN)
    end
  end

  if #missing_deps > 0 then
    vim.notify('Avante is missing dependencies: ' .. table.concat(missing_deps, ', '), vim.log.levels.ERROR)
  else
    -- All dependencies loaded, now try to load avante
    local ok, avante = pcall(require, 'avante')
    if ok then
      avante.setup()
    else
      vim.notify('Failed to load avante: ' .. tostring(avante), vim.log.levels.ERROR)
    end
  end
end
