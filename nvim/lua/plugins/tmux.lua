return {
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      -- don't let the plugin install its default <C-h/j/k/l> mappings;
      -- we define them explicitly below and keep <C-l> for clear-highlight
      vim.g.tmux_navigator_no_mappings = 1
    end,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left (tmux)" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down (tmux)" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up (tmux)" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (tmux)" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate to previous (tmux)" },
      { "<leader>l", "<cmd>nohlsearch<cr>", desc = "Clear search highlight" },
    },
  },
}
