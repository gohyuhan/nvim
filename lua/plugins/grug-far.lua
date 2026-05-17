return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          require("grug-far").open { transient = true }
        end,
        desc = "Search & Replace (grug-far)",
      },
      {
        "<leader>sw",
        function()
          require("grug-far").open {
            prefills = { search = vim.fn.expand "<cword>" },
            transient = true,
          }
        end,
        desc = "Search & Replace word under cursor",
      },
      {
        "<leader>sr",
        function()
          require("grug-far").with_visual_selection { transient = true }
        end,
        mode = "v",
        desc = "Search & Replace selection",
      },
    },
    opts = {
      headerMaxWidth = 80,
      keymaps = {
        replace = { n = "<leader>rr" },
        syncLocations = { n = "<leader>S" },
      },
    },
  },
}
