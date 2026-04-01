-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)

-- clear search highlight on insert
vim.cmd("packadd nohlsearch")
