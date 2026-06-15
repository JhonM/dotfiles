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

EOF
