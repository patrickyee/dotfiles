# Neovim Cheat Sheet

Leader key: `Space`

## Core movement

- `h` `j` `k` `l`: move left/down/up/right
- `w` / `b`: next / previous word
- `0` / `$`: start / end of line
- `gg` / `G`: top / bottom of file
- `%`: jump to matching pair
- `<C-o>` / `<C-i>`: jump back / forward
- `<C-f>` / `<C-b>`: page down / up
- `<C-d>` / `<C-u>`: half-page down / up
- `zz`: center current line

## Insert and edit

- `i` / `a`: insert before / after cursor
- `o` / `O`: new line below / above
- `x`: delete character
- `dd`: delete line
- `yy`: yank line
- `p` / `P`: paste after / before
- `u` / `<C-r>`: undo / redo

## Clipboard

- `yy`, `y`, `p`: use system clipboard because `unnamedplus` is enabled
- `"+y` / `"+p`: explicit system clipboard yank / paste

## Files and search

- `<leader>ff`: find files
- `<leader>fg`: grep project text
- `<leader>fb`: show open buffers
- `<leader>fr`: recent files
- `<leader>fh`: help tags
- `<leader>sr`: project-wide search and replace
- `<leader>o`: open file explorer

## Buffers and windows

- `<leader>bd`: close current buffer
- `<C-h>` `<C-j>` `<C-k>` `<C-l>`: move between windows
- `<leader>w`: save file
- `<leader>q`: quit current window

## LSP and code

- `gd`: go to definition
- `gD`: go to declaration
- `gr`: references
- `gi`: implementation
- `K`: hover docs
- `<leader>ca`: code action
- `<leader>rn`: rename symbol
- `<leader>ds`: document symbols
- `<leader>ws`: workspace symbols
- `<leader>a`: toggle code outline
- `[d` / `]d`: previous / next diagnostic
- `<leader>e`: show line diagnostics

## Git

- `<leader>gb`: toggle inline blame for current line
- `<leader>gs`: open Fugitive git status
- `<leader>gl`: git log
- `<leader>gc`: git commit
- In Fugitive status: `q` closes the window

## Copilot

- `<C-l>`: accept suggestion
- `<M-]>`: next suggestion
- `<M-[>`: previous suggestion
- `<C-]>`: dismiss suggestion

## Commenting

- `gcc`: toggle comment on current line
- `gc` in visual mode: toggle comment on selection

## Oil file explorer

- `Enter`: open file or directory
- `-`: go to parent directory
- `g.`: toggle hidden files
- `<C-s>`: open in vertical split
- `<C-h>`: open in horizontal split

## Search tool behavior

- Telescope (`<leader>ff`, `<leader>fg`, `<leader>fb`):
  - `Esc` or `<C-c>` closes
  - `<C-j>` / `<C-k>` moves selection
- Grug Far (`<leader>sr`):
  - `q` or `:q` closes

## Treesitter and updates

- `:TSInstall bash css html javascript json lua markdown python regex tsx typescript vim vimdoc yaml`
- `:TSUpdate`: update Treesitter parsers
- `:Mason`: install language servers
- `:UpdateTools`: run `Lazy sync`, `MasonUpdate`, and `TSUpdate`

## Tmux

- Tmux copy mode:
  1. `<prefix>` then `[`
  2. `v` to start selection
  3. move with Vim keys
  4. `y` to copy to macOS clipboard

## Macro warning

- `q{register}` starts recording a macro
- `q` stops recording
- `@{register}` replays a macro
- `@@` replays the last macro again
