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
