return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    config = function(_, opts)
      vim.api.nvim_create_user_command("GrugFarOpenFloat", function()
        local w = math.floor(vim.o.columns * 0.9)
        local h = math.floor(vim.o.lines * 0.9)
        local buf = vim.api.nvim_create_buf(false, true)
        vim.bo[buf].bufhidden = "wipe"
        vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = w,
          height = h,
          row = math.floor((vim.o.lines - h) / 2),
          col = math.floor((vim.o.columns - w) / 2),
          style = "minimal",
          border = "rounded",
        })
      end, {})
      require("grug-far").setup(opts)
    end,
    keys = {
      {
        "<leader>sr",
        function()
          require("grug-far").open { windowCreationCommand = "GrugFarOpenFloat" }
        end,
        desc = "Search & Replace (grug-far)",
      },
      {
        "<leader>sw",
        function()
          require("grug-far").open { windowCreationCommand = "GrugFarOpenFloat", prefills = { search = vim.fn.expand "<cword>" } }
        end,
        desc = "Search & Replace word under cursor",
      },
      {
        "<leader>sR",
        function()
          require("grug-far").with_visual_selection { windowCreationCommand = "GrugFarOpenFloat" }
        end,
        mode = "v",
        desc = "Search & Replace selection",
      },
    },
    opts = {
      headerMaxWidth = 80,
    },
  },
}
