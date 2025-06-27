-- Set leader key
vim.g.mapleader = " "

-- Plugin manager: lazy.nvim bootstrap
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/lazy/start/lazy.nvim")

require("lazy").setup({

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
    end,
  },

  -- Telescope Fuzzy Finder
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

  -- Treesitter
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

  -- Theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "main",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "rose-pine",
        },
      })
    end,
  },

})

-- Basic UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Tabs & indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Reapply line number highlight
vim.api.nvim_set_hl(0, "LineNr", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })

-- Yank entire file to clipboard
vim.keymap.set("n", "<leader>y", ":%y+", { desc = "Yank entire file to clipboard" })

