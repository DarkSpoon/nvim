-- Relative and absolute line numbers combined
vim.opt.number = true
vim.opt.relativenumber = true

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- Set clipboard for pasting from anywhere
vim.opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = "unnamed"
-- vim.opt.clipboard = ""

-- Set tab width
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

--Default windows border
vim.opt.winborder = 'rounded'

--Set gui colors
vim.opt.termguicolors = true

-- Set backup, undo, and swp locations
-- vim.opt.undodir = "~/.nvim/.undo//"
-- vim.opt.backupdir = "~/.nvim/.backup//"
-- vim.opt.directory = "~/.nvim/.swp//"

-- Disable inlay_hints
-- vim.lsp.inlay_hint.enable(false)
