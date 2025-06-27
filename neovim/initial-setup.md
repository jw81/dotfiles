:# 🧪 Minimal Neovim Setup with Navigation, Search, and Syntax Highlighting

This guide walks through setting up a **modern, minimal Neovim environment** using Lua. It includes:

- 📁 File tree navigation (`nvim-tree.lua`)
- 🔍 Fuzzy finder (`telescope.nvim`)
- 🌈 Syntax highlighting (`nvim-treesitter`)
- 🧠 Relative line numbers for fast motion

---

## ✅ Prerequisites

Install Neovim (v0.9+ recommended):

```sh
brew install neovim
```

Install `ripgrep` (required for Telescope’s live grep):

```sh
brew install ripgrep
```

---

## 📁 Setup

### 1. Create Config Folder

```sh
mkdir -p ~/.config/nvim
```

### 2. Install Plugin Manager: `lazy.nvim`

```sh
git clone https://github.com/folke/lazy.nvim \
  ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim
```

---

## 🧩 3. `init.lua` Configuration

Save this as `~/.config/nvim/init.lua`:

```lua
vim.g.mapleader = " "

-- Load plugin manager
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/lazy/start/lazy.nvim")

require("lazy").setup({
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        open_on_setup_file = true,
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
    end,
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({})
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    end,
  },

  -- Treesitter for Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
})

-- Visual & Movement Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Optional: Toggle relative numbers with <space>rn
vim.keymap.set("n", "<leader>rn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle Relative Line Numbers" })

-- Auto open file tree on launch (optional)
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
```

---

## 🧪 Usage

| Command         | Action                                |
|----------------|----------------------------------------|
| `<space>e`     | Toggle file tree (`nvim-tree`)         |
| `<space>ff`    | Fuzzy find files (Telescope)           |
| `<space>fg`    | Search project for string (live grep)  |
| `<space>rn`    | Toggle relative line numbers on/off    |

---

## ✅ What’s Installed

- **nvim-tree.lua**: File browser in a sidebar
- **telescope.nvim**: File finder + project grep
- **nvim-treesitter**: Fast, accurate syntax highlighting
- **lazy.nvim**: Plugin manager
- **ripgrep**: Required CLI for fast text search

---

## 💡 Tips

- Use `:Lazy` to view/update plugins
- Press `q` to close plugin screens
- Add LSP, Git signs, and autocompletion later as needed

---

