local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to install lazy.nvim.\n", "ErrorMsg" },
      { result .. "\n", "WarningMsg" },
      { "Run: git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath, "None" },
    }, true, {})
    return
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  rocks = {
    enabled = false,
  },
})
