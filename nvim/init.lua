require("impatient")

-- python
vim.g.python3_host_prog = "~/.pyenv/shims/python3"

-- plugins
require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "preservim/nerdtree"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "drewtempelmeyer/palenight.vim"
  use "djoshea/vim-autoread"
  use {
    "neoclide/coc.nvim", branch="release", config=function()
      vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : '<cr>'", {expr=true})
      vim.api.nvim_set_keymap("i", "<esc>", "coc#pum#visible() ? coc#pum#cancel() : '<esc>'", {expr=true})
      vim.api.nvim_set_keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1) : '<tab>'", {expr=true})
      vim.api.nvim_set_keymap("i", "<S-tab>", "coc#pum#visible() ? coc#pum#prev(1) : '<S-tab>'", {expr=true})
    end
  }
  use "lewis6991/impatient.nvim"
  use "hashivim/vim-terraform"
  use {
    "tyru/open-browser-github.vim",
    requires = { "tyru/open-browser.vim" }
  }
  use "christoomey/vim-tmux-navigator"
  use "APZelos/blamer.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "itchyny/vim-cursorword"
  use "github/copilot.vim"
end)

-- theme and color
vim.g.airline_theme = "palenight"
vim.api.nvim_command("colorscheme palenight")

-- auto commands
local function set_number()
  vim.api.nvim_win_set_option(0, "number", true)
  vim.api.nvim_win_set_option(0, "relativenumber", true)
  vim.api.nvim_win_set_option(0, "colorcolumn", "120")
end

local function set_indent(n, hard_tab)
  vim.api.nvim_buf_set_option(0, "tabstop", n)
  vim.api.nvim_buf_set_option(0, "softtabstop", n)
  vim.api.nvim_buf_set_option(0, "shiftwidth", n)
  if not hard_tab then
    vim.api.nvim_buf_set_option(0, "expandtab", true)
  end
end

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern={"*.lua", "*.html", "*.json", "*.vue", "*.yaml", "*.css", "*.sql"},
    callback=function()
      set_number()
      set_indent(2)
    end,
  }
)

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern={"*.py", "*.js", "*.jsx", "*.swift", "*.dtml", "*Makefile*", "*.c", "*.h", "*.cpp", "*.hpp", "*.sh", "*.zsh",
             "*.bash", "*.rs"},
    callback=function()
      set_number()
      set_indent(4)
    end,
  }
)

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern={"*.go"},
    callback=function()
      set_number()
      set_indent(4, true)
    end,
  }
)

-- mouse support
vim.cmd [[set mouse=r]]

-- enable treesitter
require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
  },
}

-- shortcuts
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeToggle<cr>", {})
vim.api.nvim_set_keymap("v", "<leader>r", ":'<,'>OpenGithubFile<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>r", ":OpenGithubFile<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>g", ":BlamerToggle<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>o", ":Files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":Rg<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<Tab>", "<C-w>w", {})
vim.api.nvim_set_keymap("n", "<C-J>", "<C-w><C-J>", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-w><C-K>", {})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-w><C-L>", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-w><C-H>", {})
vim.api.nvim_set_keymap("n", "<leader>d", "<Plug>(coc-definition)", {})
vim.api.nvim_set_keymap("n", "<leader>u", "<Plug>(coc-references)", {})
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', {})
