return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  build = 'make',
  opts = {
    provider = 'claude',
    claude = {
      endpoint = os.getenv 'AVANTE_ANTHROPIC_ENDPOINT' or 'https://api.anthropic.com',
      model = 'claude-3-5-sonnet-20240620',
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
      ['local'] = false,
    },
    openai = {
      endpoint = os.getenv 'AVANTE_OPENAI_ENDPOINT' or 'https://api.openai.com/v1', -- Set the correct endpoint for chat completions
      -- model = 'gpt-4', -- Use GPT-4 model
      model = 'gpt-3.5-turbo', -- Use GPT-4 model:  gpt-4
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0, -- Adjust the creativity level of responses
      max_tokens = 4096, -- Maximum number of tokens in the response
      ['local'] = false, -- Set to false if you want to use the OpenAI API
    },
    -- huggingface = {
    --   endpoint = os.getenv 'AVANTE_OPENAI_ENDPOINT' or 'https://api-inference.huggingface.co/models/codellama-7b-hf', -- Set the correct endpoint for chat completions
    --   model = 'codellama-7b-hf', -- Use GPT-4 model:  gpt-4
    --   timeout = 30000, -- Timeout in milliseconds
    --   temperature = 0, -- Adjust the creativity level of responses
    --   max_tokens = 4096, -- Maximum number of tokens in the response
    --   ['local'] = false, -- Set to false if you want to use the OpenAI API
    -- },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = 'right', -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        align = 'center', -- left, center, right for title
        rounded = true,
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = 'DiffText',
        incoming = 'DiffAdd',
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = 'copen',
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
}
