return {{
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "avante.md",
    -- Runs the Claude Agent SDK in-process via Agent Client Protocol.
    -- Requires: npm install -g @agentclientprotocol/claude-agent-acp
    provider = "claude-code",
    -- Generate the token with `claude setup-token` and export it as
    -- CLAUDE_CODE_OAUTH_TOKEN.
    acp_providers = {
      ["claude-code"] = {
        env = {
          HOME = os.getenv("HOME"),
          CLAUDE_CODE_OAUTH_TOKEN = os.getenv("CLAUDE_CODE_OAUTH_TOKEN"),
        },
      },
    },
    providers = {
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
  },
  dependencies = {
    -- ===== Required =====
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- ===== Optional =====
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "folke/snacks.nvim", -- for input provider snacks
    "echasnovski/mini.icons",
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}, {
  -- Wires avante's @mentions, /slash-commands, and @file picker into
  -- blink.cmp, via blink.compat's nvim-cmp source shim (see avante's
  -- README "Blink.cmp users" section).
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.compat" },
  opts = {
    sources = {
      default = { "avante_commands", "avante_mentions", "avante_files" },
      providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100,
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000,
          opts = {},
        },
      },
    },
  },
}}
