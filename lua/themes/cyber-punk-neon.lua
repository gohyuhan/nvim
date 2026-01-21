---@type Base46Table
local M = {}

M.base_30 = {
  white = "#f0f0f0", -- light text
  darker_black = "#050c14", -- ~6% darker than black
  black = "#091833", -- core bg (from palette #091833)
  black2 = "#0f1e38", -- subtle panels
  one_bg = "#133e7c", -- selection/hover
  one_bg2 = "#1a4e99",
  one_bg3 = "#255ea6",
  grey = "#3a4a5f",
  grey_fg = "#5a6a7f",
  grey_fg2 = "#6a7a8f",
  light_grey = "#7a8a9f",

  red = "#ff2a6d", -- bright neon red/pink accents
  baby_pink = "#ff70a6",
  pink = "#ea00d9", -- signature neon magenta/pink
  line = "#133e7c", -- splits/borders
  green = "#00ff9c", -- neon green (brighter than your old #00ff00)
  vibrant_green = "#39ff14",
  blue = "#0abdc6", -- cyan/teal (core accent)
  nord_blue = "#133e7c",
  seablue = "#0abdc6",
  yellow = "#f9e200", -- neon yellow
  sun = "#ffdd00",
  purple = "#bb9af7",
  dark_purple = "#711c91", -- dark purple
  teal = "#0abdc6",
  orange = "#ff5e3a",
  cyan = "#0abdc6",

  statusline_bg = "#0f1e38", -- statusline (slightly lighter black2)
  lightbg = "#1a4e99", -- light popup bg
  pmenu_bg = "#133e7c", -- completion menu
  folder_bg = "#0abdc6", -- folder icons (cyan for neon pop)
}

M.base_16 = {
  base00 = "#091833", -- default bg
  base01 = "#0f1e38", -- gutter / lighter bg
  base02 = "#133e7c", -- selection
  base03 = "#5a6a7f", -- comments / line nr (muted grey)
  base04 = "#7a8a9f", -- line nr active, borders
  base05 = "#e0e0e0", -- foreground text
  base06 = "#f0f0f0", -- lighter text
  base07 = "#ffffff", -- white
  base08 = "#ff2a6d", -- variables, diff delete (red-pink)
  base09 = "#ff5e3a", -- numbers, constants (orange-ish)
  base0A = "#f9e200", -- types/classes (yellow)
  base0B = "#00ff9c", -- strings (neon green)
  base0C = "#0abdc6", -- regex/support (cyan)
  base0D = "#0abdc6", -- functions (cyan)
  base0E = "#ea00d9", -- keywords/operators (magenta)
  base0F = "#bb9af7", -- punctuation/tags (dark purple)
}

M.type = "dark"

-- Optional: theme-specific polish (e.g. make comments more visible with transparency)
M.polish_hl = {
  defaults = {
    Comment = { fg = M.base_30.grey_fg, italic = true },
  },
  treesitter = {
    ["@variable"] = { fg = M.base_16.base05 },
    ["@function"] = { fg = M.base_16.base0D },
    ["@keyword"] = { fg = M.base_16.base0E },
    ["@string"] = { fg = M.base_16.base0B },
    ["@number"] = { fg = M.base_16.base09 },
    ["@type"] = { fg = M.base_16.base0A },
  },
}

-- Allow chadrc overrides (string MUST match filename without .lua)
M = require("base46").override_theme(M, "cyberpunk-neon")

return M
