vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.catppuccin")
require("plugins.gruvbox")
require("config.colorscheme")

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.lualine")
require("plugins.arduino-nvim")
require("plugins.LSP")
require("plugins.mini")
require("plugins.mini-ai")
require("plugins.mini-move")
-- require("plugins.mini-starter")
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

