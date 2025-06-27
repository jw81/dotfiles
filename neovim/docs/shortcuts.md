# 🎯 Handy Neovim Shortcuts (with Plugins)

This cheat sheet lists useful keybindings and shortcuts for your **Neovim setup** using:

- `nvim-tree` (file explorer)
- `telescope.nvim` (fuzzy finder + search)
- `nvim-treesitter` (syntax highlighting)
- Core Neovim motions and leader mappings

Updated: 2025-06-27

---

## 🧭 Navigation (nvim-tree)

| Shortcut      | Action                        |
|---------------|-------------------------------|
| `<space>e`    | Toggle file explorer          |
| `a`           | Add file/folder (in tree)     |
| `d`           | Delete selected file          |
| `r`           | Rename file                   |
| `o` or `<CR>` | Open file or folder           |
| `C`           | Change root to node           |
| `u`           | Go up a directory             |

---

## 🔍 Search (telescope.nvim)

| Shortcut      | Action                          |
|---------------|----------------------------------|
| `<space>ff`   | Find files                      |
| `<space>fg`   | Live grep (search file content) |
| `/`           | Search within file (normal mode)|
| `:`           | Command-line mode               |

---

## 🧠 Line Numbers & Movement

| Shortcut       | Action                             |
|----------------|------------------------------------|
| `<space>rn`    | Toggle relative line numbers       |
| `5j`, `3k`     | Move down/up 5 or 3 lines           |
| `d2j`, `c3k`   | Delete/change 2–3 lines down/up     |
| `gg` / `G`     | Jump to top / bottom of file        |
| `^` / `$`      | Move to start / end of line         |

---

## 🧰 Core Neovim Motions

| Shortcut     | Action                          |
|--------------|----------------------------------|
| `:w`         | Save file                        |
| `:q`         | Quit Neovim                      |
| `:wq`        | Save and quit                    |
| `u`          | Undo                             |
| `<C-r>`      | Redo                             |
| `yy`         | Yank (copy) line                 |
| `dd`         | Delete (cut) line                |
| `p`          | Paste                            |

---

## 🧩 Plugin Management (lazy.nvim)

| Command       | Action                            |
|---------------|------------------------------------|
| `:Lazy`       | Open plugin manager UI             |
| `:Lazy sync`  | Install or update plugins          |
| `:Lazy clean` | Remove unused plugins              |

---

## 🌈 Treesitter (syntax highlighting)

> Mostly passive, but enables:
- Accurate syntax highlighting
- Smarter indentation
- Optional text objects and code folding

---

Let me know if you’d like to expand this cheat sheet with Git signs, LSP, or autocompletion.
