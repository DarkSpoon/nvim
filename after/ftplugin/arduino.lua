-- Need to comment out keymaps in \nvim-data\site\pack\core\opt\Arduino-Nvim\lua\Arduino-Nvim\remap.lua

require("which-key").add({{ "<leader>a", group = "arduino" }})
local map = vim.keymap.set
map("n", "<Leader>au", ":InoUpload<CR>", { buffer = true,  desc = 'Compile and Upload code' })  -- Upload code
map("n", "<Leader>ac", ":InoCheck<CR>", { buffer = true,  desc = 'Compile code' })   -- Compile/check code
map("n", "<Leader>as", ":InoStatus<CR>", { buffer = true, desc = 'Show board and port status' })  -- Show current board and port status
map("n", "<Leader>ag", ":InoGUI<CR>", { buffer = true, desc = 'Set board and port' })     -- Open GUI for setting board and port
map("n", "<Leader>am", ":InoMonitor<CR>", { buffer = true, desc = 'Serial monitor' })     -- Open Serial monitor with default port and baud rate
map("n", "<Leader>al", ":InoLib<CR>", { buffer = true, desc = 'Library manager' })
map("n", "<Leader>ab", ":InoSelectBoard<CR>", { buffer = true, desc = 'Select board' })     -- open board selection gui
map("n", "<Leader>ap", ":InoSelectPort<CR>", { buffer = true, desc = 'Select port' }) -- open port selection gui
map("n", "<Leader>ar", ":InoUploadReset<CR>", { buffer = true, desc = 'Upload with manual reset' }) -- Upload with manual reset for UNO R4 WiFi
