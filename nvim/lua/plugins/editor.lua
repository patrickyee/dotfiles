return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "ayu_mirage",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 200,
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      vim.keymap.set("n", "]h", function()
        require("gitsigns").next_hunk()
      end, { desc = "Next Git hunk" })
      vim.keymap.set("n", "[h", function()
        require("gitsigns").prev_hunk()
      end, { desc = "Previous Git hunk" })
      vim.keymap.set("n", "<leader>hp", function()
        require("gitsigns").preview_hunk()
      end, { desc = "Preview Git hunk" })
      vim.keymap.set("n", "<leader>hs", function()
        require("gitsigns").stage_hunk()
      end, { desc = "Stage Git hunk" })
      vim.keymap.set("n", "<leader>hr", function()
        require("gitsigns").reset_hunk()
      end, { desc = "Reset Git hunk" })
      vim.keymap.set("n", "<leader>hd", function()
        require("gitsigns").diffthis()
      end, { desc = "Diff this" })
      vim.keymap.set("n", "<leader>gb", function()
        require("gitsigns").toggle_current_line_blame()
      end, { desc = "Toggle inline Git blame" })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
}
