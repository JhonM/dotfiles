# Neovim DAP Configuration for 9292 Frontend Project

This repository contains a debug adapter protocol (DAP) configuration for the 9292 Frontend project, which is primarily an Astro/React application with TypeScript.

## Prerequisites

Before using this configuration, make sure you have the following installed:

1. [Neovim](https://neovim.io/) (version 0.7.0 or higher)
2. [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim
3. [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - UI for nvim-dap
4. [Mason.nvim](https://github.com/williamboman/mason.nvim) - Package manager for Neovim that can install debug adapters

## Installation

### Install Required Debug Adapters

Using Mason, install the necessary debug adapters:

```lua
:MasonInstall node-debug2-adapter chrome-debug-adapter
```

### Setup Configuration

1. Copy the `nvim-dap-config.lua` file to your Neovim configuration directory, for example:

   ```
   cp nvim-dap-config.lua ~/.config/nvim/lua/dap-config.lua
   ```

2. In your `init.lua` or equivalent configuration file, require and set up the configuration:

   ```lua
   require('dap-config').setup()
   ```

3. Set up keybindings for debugging (examples are provided in the configuration file).

## Features

This configuration includes:

- Debugging JavaScript and TypeScript files
- React application debugging in Chrome
- Astro application debugging
- Vitest test debugging
- Playwright E2E test debugging
- Custom commands for debugging the Astro app and web app

## Custom Commands

The configuration adds these Neovim commands:

- `:DebugAstro` - Start debugging the Astro application
- `:DebugWeb` - Debug the web app with a specified command (dev/test/build)

## Keybinding Examples

Add these to your keymaps configuration:

```lua
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)
```

## Project-Specific Notes

This configuration is tailored for the 9292 Frontend project, which uses:

- Astro as the main framework
- React for components
- TypeScript for type safety
- Vitest for unit testing
- Playwright for E2E testing
- pnpm as the package manager

## Troubleshooting

If you encounter issues:

1. Ensure debug adapters are correctly installed via Mason
2. Check that the paths in the configuration match your system
3. For browser debugging, make sure the application is running before starting the debugger
4. For Node.js debugging, ensure the correct version of Node.js is in your PATH

## Customization

You can modify the configuration to better suit your workflow:

- Adjust the port numbers if your development servers use different ports
- Add additional configurations for other file types
- Modify the UI layout in the dapui.setup section
