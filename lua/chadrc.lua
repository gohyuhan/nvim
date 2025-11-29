-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@class ChadrcConfig
local M = {}

M.base46 = {
	theme = "yoru",
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}
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
