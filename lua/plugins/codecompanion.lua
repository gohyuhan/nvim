return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  priority = 1,
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
    require("codecompanion").setup {
      display = {
        chat = {
          window = {
            layout = "vertical", -- Options: float, vertical, horizontal
            width = 0.45, -- 0.45 represents 45% of the total editor width
            relative = "editor", -- Ensures the percentage is based on the whole window
            border = "rounded", -- Makes it look much cleaner in NvChad
          },
          auto_scroll = false,
          icons = {
            chat_context = "📎️", -- You can also apply an icon to the fold
          },
          show_intro_message = false,
          fold_context = true,
          show_reasoning = true,
          show_context = true, -- Show context (from slash commands and variables) in the chat buffer?
          show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
          show_settings = true, -- Show LLM settings at the top of the chat buffer?
          show_token_count = true, -- Show the token count for each response?
          show_tools_processing = true, -- Show the loading message when tools are being executed?
          show_token_count = false,
        },
      },
      interactions = {
        chat = {
          adapter = "gemini_cli",
          opts = {
            ---Decorate the user message before it's sent to the LLM
            ---@param message string
            ---@param adapter CodeCompanion.Adapter
            ---@param context table
            ---@return string
            prompt_decorator = function(message, adapter, context)
              return string.format([[<prompt>%s</prompt>]], message)
            end,
          },
          tools = {
            ["cmd_runner"] = {
              opts = {
                allowed_in_yolo_mode = false,
                auto_submit_errors = true, -- Send any errors to the LLM automatically?
                auto_submit_success = true, -- Send any successful output to the LLM automatically?
              },
            },
          },
          roles = {
            ---The header name for the LLM's messages
            ---@type string|fun(adapter: CodeCompanion.Adapter): string
            llm = function(adapter)
              return "  CodeCompanion (" .. adapter.formatted_name .. ")"
            end,

            ---The header name for your messages
            ---@type string
            user = " YH",
          },
          variables = {
            ["buffer"] = {
              opts = {
                -- Always sync the buffer by sharing its "diff"
                -- Or choose "all" to share the entire buffer
                default_params = "all",
              },
            },
          },
        },
      },
      extensions = {
        spinner = {},
      },
      opts = {
        log_level = "DEBUG",
        send_code = true,
        use_default_prompt_library = true,
      },

      adapters = {
        acp = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              defaults = {
                auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
              },
              opts = {
                stream = true,
              },
              env = {
                GEMINI_API_KEY = "GEMINI_API_KEY",
                CHECK_UPDATE = "false",
              },
            })
          end,
        },
      },
    }
  end,
}
