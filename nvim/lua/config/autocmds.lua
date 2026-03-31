local group = vim.api.nvim_create_augroup("patrick_nvim", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("UpdateTools", function()
  vim.cmd("Lazy sync")
  vim.cmd("MasonUpdate")
  vim.cmd("TSUpdate")
end, {
  desc = "Update plugins, Mason registry, and Treesitter parsers",
})

vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold", "CursorHoldI" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
  desc = "Reload file if changed outside of Neovim",
})

