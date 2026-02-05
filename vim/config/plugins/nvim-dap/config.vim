lua << EOF
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

require('mason').setup()
require('mason-nvim-dap').setup({
  ensure_installed = { 'python', 'js-debug-adapter' },
  automatic_setup = true,
})

-- Use pwa-node from js-debug-adapter instead of node2
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      -- NOTE: if this path doesn't exist on your machine, switch to:
      -- ~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/dist/src/dapDebugServer.js
      os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    }
  }
}

-- ? Use pwa-chrome from js-debug-adapter (recommended for Vite/Astro/TanStack)
dap.adapters["pwa-chrome"] = dap.adapters["pwa-node"]

-- Node.js
dap.configurations.javascript = {
  {
    name = "Launch Node.js",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to Node Process",
    type = "pwa-node",
    request = "attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}

-- TypeScript
dap.configurations.typescript = {
  {
    name = "Launch TypeScript",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    runtimeExecutable = "node",
    runtimeArgs = { "--loader", "ts-node/esm" },
  },
  {
    name = "Attach to TypeScript Process",
    type = "pwa-node",
    request = "attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
  },
}

-- ? Removed legacy chrome-debug-adapter (deprecated / flaky with Vite sourcemaps)
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" }
-- }

-- ? React (browser) via pwa-chrome (works well with Vite/Astro/TanStack)
dap.configurations.javascriptreact = {
  {
    name = "Chrome (pwa): Debug UI (Vite/Astro)",
    type = "pwa-chrome",
    request = "launch",
    url = "https://localhost:4321", -- change to :3000 if your UI runs there
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    resolveSourceMapLocations = {
      "${workspaceFolder}/**",
      "!**/node_modules/**",
    },
    skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
    userDataDir = false,
  }
}

dap.configurations.typescriptreact = dap.configurations.javascriptreact

-- ? Astro: prefer Node (server) + pwa-chrome (client UI)
dap.configurations.astro = {
  {
    name = "Astro: dev server (node --inspect)",
    type = "pwa-node",
    request = "launch",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "node",
    runtimeArgs = {
      "--inspect",
      "${workspaceFolder}/node_modules/astro/astro.js",
      "dev",
    },
    console = "integratedTerminal",
    internalConsoleOptions = "neverOpen",
    sourceMaps = true,
    resolveSourceMapLocations = {
      "${workspaceFolder}/**",
      "!**/node_modules/**",
    },
    skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
  },
  {
    name = "Astro UI: Chrome (pwa)",
    type = "pwa-chrome",
    request = "launch",
    url = "https://localhost:4321",
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    resolveSourceMapLocations = {
      "${workspaceFolder}/**",
      "!**/node_modules/**",
    },
    skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
    userDataDir = false,
  },
}

-- Jest
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Jest Tests",
  program = "${workspaceFolder}/node_modules/.bin/jest",
  args = { "--runInBand" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- Vite
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Vite Dev Server",
  program = "${workspaceFolder}/node_modules/.bin/vite",
  args = {},
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- Vitest
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Vitest",
  program = "${workspaceFolder}/node_modules/.bin/vitest",
  args = { "run" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- Playwright
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Playwright Tests",
  program = "${workspaceFolder}/node_modules/.bin/playwright",
  args = { "test" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- pnpm scripts
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Debug pnpm Script",
  runtimeExecutable = "pnpm",
  runtimeArgs = function()
    local script_name = vim.fn.input("Script name: ")
    return { "run", script_name }
  end,
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- ? debug astro (9292) - fixed scheme + adapter
vim.api.nvim_create_user_command("DebugAstro", function()
  dap.run({
    name = "Astro UI: Chrome (pwa)",
    type = "pwa-chrome",
    request = "launch",
    url = "https://localhost:4321",
    webRoot = vim.fn.getcwd(),
    sourceMaps = true,
    resolveSourceMapLocations = {
      vim.fn.getcwd() .. "/**",
      "!" .. vim.fn.getcwd() .. "/node_modules/**",
    },
    userDataDir = false,
  })
end, {})

-- debug astro web (9292)
vim.api.nvim_create_user_command("DebugWeb", function()
  local cmd = vim.fn.input("Command to debug (dev/test/build): ", "dev")
  dap.run({
    type = "pwa-node",
    request = "launch",
    name = "Debug Web App",
    runtimeExecutable = "pnpm",
    runtimeArgs = { "--filter", "web", "run", cmd },
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",
    sourceMaps = true,
  })
end, {})

vim.api.nvim_create_user_command("DebugWeb2", function()
  local cmd = vim.fn.input("Command to debug (dev/test/build): ", "dev")
  dap.run({
    type = "pwa-node",
    request = "launch",
    name = "Debug Web App",
    runtimeExecutable = "pnpm",
    runtimeArgs = { "run", cmd },
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",
    sourceMaps = true,
  })
end, {})


-- debug web (9292) with required env vars
vim.api.nvim_create_user_command("DebugWeb9292", function()
  local secret = vim.fn.inputsecret("PUBLIC_HMAC_SECRET: ")
  if secret == "" then
    vim.notify("DebugWeb9292 cancelled: no secret provided", vim.log.levels.WARN)
    return
  end

  local root = vim.fn.getcwd()
  local web = root .. "/apps/web"

  dap.run({
    type = "pwa-node",
    request = "launch",
    name = "Debug Web (9292) - dev server",
    runtimeExecutable = "pnpm",
    runtimeArgs = {
      "run",
      "--filter",
      "web",
      "dev",
      "--",
      "--host",
    },

    -- ? important: point cwd to the app when in monorepo
    cwd = web,

    console = "integratedTerminal",
    sourceMaps = true,
    autoAttachChildProcesses = true,

    env = {
      WEB_API_PROXY_URL = "https://web-api-acc-001.9292.nl",
      PUBLIC_HMAC_SECRET = secret,
      NODE_OPTIONS = "--enable-source-maps",
    },
  })
end, {})

vim.api.nvim_create_user_command("DebugWebUI", function()
  local root = vim.fn.getcwd()
  local web = root .. "/apps/web"

  dap.run({
    name = "Web UI: Chrome (pwa) - apps/web",
    type = "pwa-chrome",
    request = "launch",

    -- Use the actual URL you browse to
    url = "https://localhost:4321",

    -- ? webRoot should be the app root that contains src/public/index.html (Vite)
    webRoot = web,

    sourceMaps = true,

    -- ? allow sourcemaps from both apps/web AND packages/*
    resolveSourceMapLocations = {
      web .. "/**",
      root .. "/packages/**",
      "!" .. root .. "/**/node_modules/**",
    },

    -- Optional: helps when a monorepo produces �weird� paths
    -- (especially if you notice breakpoints bind to wrong file)
    sourceMapPathOverrides = {
      ["webpack:///./*"] = web .. "/*",
      ["webpack:///*"] = web .. "/*",
      ["vite:///*"] = root .. "/*",
      ["@fs/*"] = "/*",
    },

    userDataDir = false,
  })
end, {})

vim.api.nvim_create_user_command("DebugUI", function()
  local root = vim.fn.getcwd()
  local web = root

  -- Accept:
  --   localhost:5173
  --   http://localhost:5173
  --   https://localhost:5173
  --   5173
  local input = vim.fn.input("Host/port (e.g. localhost:5173 or 3000): ", "localhost:5173")

  local url = input
  if input:match("^%d+$") then
    url = "http://localhost:" .. input
  elseif not input:match("^https?://") then
    url = "http://" .. input
  end

  dap.run({
    name = "UI: Chrome (pwa) " .. url,
    type = "pwa-chrome",
    request = "launch",
    url = url,

    -- ? for Vite/Astro this should be the app root
    webRoot = web,

    sourceMaps = true,
    resolveSourceMapLocations = {
      web .. "/**",
      root .. "/packages/**",
      "!" .. root .. "/**/node_modules/**",
    },

    -- Helpful in monorepos / Vite
    sourceMapPathOverrides = {
      ["webpack:///./*"] = web .. "/*",
      ["webpack:///*"] = web .. "/*",
      ["vite:///*"] = root .. "/*",
      ["@fs/*"] = "/*",
    },

    userDataDir = false,
  })
end, {})

dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Configure breakpoint icons
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "Prevent colorscheme clearing self-defined DAP marker colors",
  callback = function()
      -- Reuse current SignColumn background (except for DapStoppedLine)
      local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
      -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
      -- convert to 6 digit hex value starting with #
      local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
      local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#c23127', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#888ca6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
  end
})

-- reload current color scheme to pick up colors override if it was set up in a lazy plugin definition fashion
vim.cmd.colorscheme(vim.g.colors_name)

vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint'})
vim.fn.sign_define('DapBreakpointCondition', {text='○', texthl='DapBreakpointCondition', linehl='DapBreakpointCondition', numhl='DapBreakpointCondition'})
vim.fn.sign_define('DapBreakpointRejected', {text='✕', texthl='DapBreakpointRejected', linehl='DapBreakpointRejected', numhl='DapBreakpointRejected'})
vim.fn.sign_define('DapLogPoint', {text='✎', texthl='DapLogPoint', linehl='DapLogPoint', numhl='DapLogPoint'})
vim.fn.sign_define('DapStopped', {text='▶︎', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped'})

-- Floating DAP UI panels
vim.keymap.set("n", "<leader>dw", function()
  dapui.float_element("watches", { enter = true })
end, { desc = "DAP: Show Watches (Float)" })

vim.keymap.set("n", "<leader>ds", function()
  dapui.float_element("scopes", { enter = true })
end, { desc = "DAP: Show Scopes (Float)" })

vim.keymap.set("n", "<leader>dc", function()
  dapui.float_element("console", { enter = true })
end, { desc = "DAP: Show Console (Float)" })

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI Panels" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
EOF

