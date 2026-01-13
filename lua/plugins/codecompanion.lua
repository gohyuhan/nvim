return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  priority = 100,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    { "stevearc/dressing.nvim", opts = {} },
    "franco-ruggeri/codecompanion-spinner.nvim",
    -- Optional: Add "rcarriga/nvim-notify" for better "Thinking" notifications
  },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          render_headers = false,
          show_role_names = true, -- Crucial to see "YH" vs "Gemini"
          roles = {
            user = "YH",
            llm = "Gemini",
          },
        },
      },

      opts = {
        log_level = "INFO",
        send_code = true,
        use_default_prompt_library = true,
        extensions = {
            spinner = {},
        },
      },

      strategies = {
        chat = {
          adapter = "gemini_cli",
          opts = {
            system_prompt = "You are an expert developer using Gemini CLI agent mode. "
              .. "You have access to file system, terminal commands, Google Search, etc. "
              .. "Think step-by-step. Use tools when needed. "
              .. "Always ask for confirmation and approval before writing files or running dangerous commands.",
          },
        },
        inline = {
          adapter = "gemini", 
        },
      },

      adapters = {
        acp = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              defaults = {
                auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
              },
            })
          end,
        },
      },
    })
  end,
}