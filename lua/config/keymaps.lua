local map = vim.keymap.set
local Snacks = require("snacks")

-- Snagged from LazyVim config --
--Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <alt> hjkl keys
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <alt> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- /Snagged from LazyVim config --

-- Files
map({ "i", "x", "n", "s"},  "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s"},  "<leader>fc", "<cmd>q<cr><esc>", { desc = "Close File" })

-- Quickly source current file / execute Lua code
map('n', '<leader>xx', '<cmd>source %<CR>', { desc = 'Source current file' })

-- Diagnostic keymaps
map('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Floaterm keymaps
map('n', '<F7>', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
map('t', '<F7>', '<C-n>:FloatermToggle<CR>', { desc = 'Toggle Floaterm' })

-- Black hole delete
map({ 'n', 'v' }, 'd', '"_d', { desc = 'Delete text forever' })
map({ 'n', 'v' }, '<S-d>', '"_d$', { desc = 'Delete to end of line forever' })
map({ 'n', 'v' }, '<Del>', '"_x', { desc = 'Delete character forever' })
map({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete character forever' })

-- Yank then Delete
map({ 'n', 'v' }, '<C-x>', 'd', { desc = 'Cut text' })

-- Search and Replace
map('n', '<Leader>sc', ':noh<CR>', {desc = "Clear search results"})
map('n', '<Leader>sl', function()
    local match = vim.fn.expand("<cword>")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Replace current word on current line"})

map('n', '<Leader>sa', function()
    local match = vim.fn.expand("<cword>")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':%s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Replace all instances of current word"})

map('n', '<Leader>sL', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Search and Replace on current line"})

map('n', '<Leader>sA', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':%s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Search and Replace all instances"})


-- Neowiki note taking
map('n','<Leader>n',"" ,{ desc = "NeoWiki notes" } )
map('n','<Leader>no', "<cmd>lua require('neowiki').open_wiki()<cr>", { desc = "Open wiki index" } )
map('n','<Leader>nO', "<cmd>lua require('neowiki').open_wiki_floating()<cr>", { desc = "Open Wiki in floating window" } )
map('n','<Leader>nT', "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", { desc = "Open Wiki in Tab" } )
map('n','<Leader>nt', "", { desc = "Toggle task" } )
map('n','<Leader>nr', "", { desc = "Rename wiki page" } )
map('n','<Leader>nd', "", { desc = "Delete wiki page" } )
map('n','<Leader>ni', "", { desc = "Insert wiki page" } )
map('n','<Leader>nc', "", { desc = "Cleanup links in wiki page" } )

-- Buffer stuff
map('n','<Leader>bd', ':bd<cr>', { desc = 'Delete current buffer' } )
map('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
map('n', '<leader>bp', ':bprevious<cr>', { desc = 'Previous buffer' })
map("n", '<leader>bf', ':bfirst<cr>', { desc = 'First Buffer' })
map("n", '<leader>bl', ':blast<cr>', { desc = "Last Buffer" })
map('n', '<leader>bw', ':w<cr>:bd<cr>', { desc = "Save and delete current buffer" } )
map('n','bd', ':bd<cr>', { desc = 'Delete current buffer' } )
map('n', 'bn', ':bnext<cr>', { desc = 'Next buffer' })
map('n', 'bp', ':bprevious<cr>', { desc = 'Previous buffer' })
map("n", 'bf', ':bfirst<cr>', { desc = 'First Buffer' })
map("n", 'bl', ':blast<cr>', { desc = "Last Buffer" })
map('n', 'bw', ':w<cr>:bd<cr>', { desc = "Save and delete current buffer" } )
map('n', 'bs', function() Snacks.picker.buffers() end, { desc = 'Search Open Buffers' })

-- Yazi <cmd>
map({ 'n', 'v' }, '<F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
map({ 'n', 'v' }, '<leader><F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })

-- LSP
map('i', '<C-Space>', '<C-x><C-o>', { desc = 'Omnicomplete Code' })

-- Packadd Update
map('n', '<leader>uu', ':lua vim.pack.update()<cr>', { desc = 'Update plugins' })

-- MiniStarter
map('n', '<leader>um', ':lua MiniStarter.open()<cr>', { desc = 'Start MiniStarter' })

-- Search
map("n", "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find nvim Config File" })
map('n', '<leader>sh', function() Snacks.picker.notifications() end, { desc = 'Search Notification History' })
map('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Search Keymaps' })
map('n', '<leader>sf', function() Snacks.picker.files() end, { desc = 'Search For File Names' })
map('n', '<leader>ss', function() Snacks.picker.smart() end, { desc = 'Smart Search' })
map('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Search Current Word' })
map('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Search Files with Grep' })
map('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = 'Search Diagnostics' })
map('n', '<leader>sR', function() Snacks.picker.resume() end, { desc = 'Search Resume' })
map('n', '<leader>sp', function() Snacks.picker.projects() end, { desc = 'Search Projects' })
map('n', '<leader>sr', function() Snacks.picker.recent() end, { desc = 'Search Recent Files' })
map('n', '<leader>sb', function() Snacks.picker.buffers() end, { desc = 'Search Open Buffers' })
map('n', '<leader>sB', function() Snacks.picker.lines() end, { desc = 'Search Buffer Lines' })
map('n', '<leader>bs', function() Snacks.picker.buffers() end, { desc = 'Search Open Buffers' })
map('n', '<leader>uc', function() Snacks.picker.colorschemes() end, { desc = 'Search existing Colorschemes' })

-- Git
map('n', "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map('n', "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map('n', "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map('n', "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map('n', "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map('n', "<leader>gp", function() Snacks.picker.git_diff() end, { desc = "Git Diff Picker (Hunks)" })
map('n', "<leader>gP", function() Snacks.picker.git_diff({ base = "origin" }) end, { desc = "Git Diff Picker(origin)" })
map('n', "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
map('n', "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map('n', "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })

-- fuck q
map({'n','v',}, 'Q', 'q', { desc = "Record macro with Q" })
map({'n','v',}, '<leader>q', 'q', { desc = "Record Macro" })
map({'n','v',}, 'q', '<Nop>', { desc = "disable macro recording with q" })
