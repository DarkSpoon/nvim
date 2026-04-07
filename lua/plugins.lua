-- install plugins
vim.pack.add({
    -- Dependencies
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/windwp/nvim-autopairs",

    -- Colorschemes
    "https://github.com/catppuccin/nvim",
    "https://github.com/ellisonleao/gruvbox.nvim",

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/edte/blink-go-import.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.x"),
    },

    -- Mini Stuffs
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.move",
    "https://github.com/nvim-mini/mini.starter",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.nvim",

    -- Treesitter
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        build = ':TSUpdate'
    },

    -- Telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",

    "https://github.com/yuukiflow/Arduino-Nvim",

    "https://github.com/nvim-lualine/lualine.nvim",

    "https://github.com/echaya/neowiki.nvim",

    "https://github.com/sphamba/smear-cursor.nvim",

    "https://github.com/folke/todo-comments.nvim",

    "https://github.com/voldikss/vim-floaterm",

    "https://github.com/folke/which-key.nvim",

    "https://github.com/mikavilpas/yazi.nvim",
})

--configure plugins
require("plugins.catppuccin")
require("plugins.gruvbox")
require("plugins.fidget")
require("plugins.arduino-nvim")
require("plugins.built-ins")
require("plugins.LSP")
require("plugins.lualine")
require("plugins.mini")
require("plugins.mini-ai")
require("plugins.mini-move")
require("plugins.mini-surround")
require("plugins.neowiki")
require("plugins.nvim-autopairs")
require("plugins.nvim-treesitter")
require("plugins.smear-cursor")
require("plugins.telescope")
require("plugins.todo-comments")
require("plugins.vim-floaterm")
require("plugins.which-key")
require("plugins.yazi")
require("plugins.mini-starter")
