lua << EOF

require('CopilotChat').setup({
  -- Optional: Override the default OpenAI API endpoint
  -- api_endpoint = "https://api.openai.com/v1/chat/completions",

  -- Optional: Set a custom model for Copilot Chat
  model = "gpt-5-mini",
  window = {
    layout = 'vertical', -- 'vertical', 'float' or 'horizontal'
    width = 80, -- Fixed width in columns
    border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
    title = '🤖 AI Assistant',
  },

  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool',
  },

  separator = '--',
  auto_fold = true, -- Automatically folds non-assistant messages

  -- Optional: Customize the chat window appearance
  -- window = {
  --   border = "rounded",
  --   width = 80,
  --   height = 20,
  -- },

  -- Optional: Enable or disable automatic suggestions
  auto_suggestions = false,
})

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

-- Keybinding to open Copilot Chat
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<CR>', { noremap = true, silent = true  })

-- Keybinding to reset Copilot Chat
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { noremap = true, silent = true  })

-- Keybinding to toggle Copilot Chat
vim.keymap.set('n', '<leader>ct', '<cmd>CopilotChatToggle<CR>', { noremap = true, silent = true  })

-- Keybinding to send a message in Copilot Chat
vim.keymap.set('n', '<leader>cs', '<cmd>CopilotChatSend<CR>', { noremap = true, silent = true  })

-- Keybinding to add visual selection to Copilot Chat
vim.keymap.set('v', '<leader>ca', '<cmd>CopilotChatAddSelection<CR>', { noremap = true, silent = true  })

EOF
