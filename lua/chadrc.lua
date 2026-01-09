-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  -- Add this block to fix comment visibility under transparency
  hl_override = {
    Comment = { fg = "#9399b2", italic = true },
    ["@comment"] = { fg = "#9399b2", italic = true },
  },
}

-- M.nvdash = { load_on_startup = true }
M.term = {
  sizes = {
    sp = 0.45, -- horizontal split height (0.45 = 45%)
    vsp = 0.45, -- vertical split width (0.45 = 45%)
  },

  -- winopts is for vim window settings, NOT sizing
  winopts = {
    number = false,
    relativenumber = false,
  },
}

M.plugins = {
  user = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        -- Your Core Languages
        "python",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "html",
        "css",
        "rust",
        "go",

        -- NEW: Added common data & config languages
        "json",
        "yaml",
        "dockerfile",
        "bash",

        -- Always good to have
        "lua",
        "vim",
        "markdown",
        "markdown_inline",
      },
    },
    -- ... other user plugins ...
  },
}

return M
