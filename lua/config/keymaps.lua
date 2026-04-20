-- Snagged from LazyVim config --
local map = vim.keymap.set
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
map({ "i", "x", "n", "s"},  "<leader>fs", ":w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s"},  "<leader>fc", ":q<cr><esc>", { desc = "Close File" })

-- Quickly source current file / execute Lua code
map('n', '<leader>xx', '<Cmd>source %<CR>', { desc = 'Source current file' })

-- Diagnostic keymaps
map('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Floaterm keymaps
map('n', '<F7>', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
map('t', '<F7>', '<C-n>:FloatermToggle<CR>', { desc = 'Toggle Floaterm' })

-- Black hole delete
map('n', 'd', '"_d', { desc = 'Delete text forever' })
map('v', 'd', '"_d', { desc = 'Delete text forever' })
map('n', 'dd', '"_dd', { desc = 'Delete line forever' })
map('v', 'dd', '"_dd', { desc = 'Delete line forever' })
map('n', '<Del>', '"_x', { desc = 'Delete character forever' })
map('v', '<Del>', '"_x', { desc = 'Delete character forever' })
map('n', 'x', '"_x', { desc = 'Delete character forever' })
map('v', 'x', '"_x', { desc = 'Delete character forever' })

-- Yank then Delete
map({'n','v'}, '<C-x>', 'd', { desc = 'Cut text' })
map({'n','v'}, '<C-x><C-x>', 'dd', { desc = 'Cut text' })

-- Go keybinds
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    -- group = augroup("go"),
    callback = function()
        map('n', '<Leader>gl', ':GoLint<cr>', { desc = 'Go Linter', buffer = true } )
    end
})

-- Powershell keybinds
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ps1",
    callback = function()
        map({ 'n','v' }, '<Leader>gb', '<esc>i<#<cr>.SYNOPSIS<cr>.DESCRIPTION<cr>.PARAMETER $Param<cr>.INPUTS<cr>.OUTPUTS<cr>.EXAMPLE<cr>#><cr><esc>', { desc = 'Generate Powershell Usage', buffer = true } )
    end
})

-- Search
map('n', '<Leader>sc', ':noh<CR>', {desc = "Clear search results"})
map('n', '<Leader>sl', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Search and Replace on current line"})
map('n', '<Leader>sa', function()
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
-- bs set for buffer search in Telescope config
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

-- Yazi <cmd>
map('n', '<F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
map('v', '<F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
map('n', '<leader><F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
map('v', '<leader><F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })

-- LSP
map('i', '<C-Space>', '<C-x><C-o>', { desc = 'Omnicomplete Code' })

-- Packadd Update
map('n', '<leader>uu', ':lua vim.pack.update()<cr>', { desc = 'Update plugins' })

-- MiniStarter
map('n', '<leader>fm', ':lua MiniStarter.open()<cr>', { desc = 'Start MiniStarter' })

