# Neovim setup

This config is aimed at a Zed + Vim workflow:

- Completion via `nvim-cmp`
- Go to definition with `gd`
- Jump back with `<C-o>` and forward with `<C-i>`
- Project search with `<leader>ff` and `<leader>fg`
- Project replace with `<leader>sr`
- File explorer with `<leader>o`
- Diagnostics with `[d`, `]d`, and `<leader>e`
- AI suggestions with GitHub Copilot
- Tmux pane navigation via `Ctrl-h/j/k/l`

After starting `nvim`, run:

```vim
:Lazy sync
:Mason
:TSInstall bash css html javascript json lua markdown python regex tsx typescript vim vimdoc yaml
```

Install the language servers and formatters you care about in Mason. The config already expects common ones such as `lua_ls`, `pyright`, and `ts_ls`.

For routine maintenance, run:

```vim
:UpdateTools
```

That runs `:Lazy sync`, `:MasonUpdate`, and `:TSUpdate`.

For Copilot, run:

```vim
:Copilot setup
```

Copilot keymaps:

- Accept suggestion: `<C-l>` in insert mode
- Next suggestion: `<M-]>`
- Previous suggestion: `<M-[>`
- Dismiss suggestion: `<C-]>`
