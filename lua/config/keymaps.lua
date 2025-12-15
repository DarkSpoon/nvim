-- Snagged from LazyVim config --
local map = vim.keymap.set
--Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- /Snagged from LazyVim config --

-- Files
map({ "i", "x", "n", "s"},  "<leader>fs", ":w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s"},  "<leader>fc", ":q<cr><esc>", { desc = "Close File" })

--Move Lines 
-- vim.keymap.set('n', '<leader>md' , ':move +1<cr>==', { desc = 'Move Line Down' })
-- vim.keymap.set('v', '<leader>md' , ':move +1<cr>==', { desc = 'Move Line Down' })
-- vim.keymap.set('n', '<A-j>' , ':move +1<cr>==', { desc = 'Move Line Down' })
-- vim.keymap.set('v', '<A-j>' , ':move +1<cr>==', { desc = 'Move Line Down' })
-- vim.keymap.set('i', '<A-j>' , '<Esc>:move +1<cr>==gi', { desc = 'Move Line Down' })
--
-- vim.keymap.set('n', '<leader>mu', ':move -2<cr>==', { desc = 'Move Line Up' })
-- vim.keymap.set('v', '<leader>mu', ':move -2<cr>==', { desc = 'Move Line Up' })
-- vim.keymap.set('n', '<A-k>' , ':move -2<cr>==', { desc = 'Move Line Up' })
-- vim.keymap.set('v', '<A-k>' , ':move -2<cr>==', { desc = 'Move Line Up' })
-- vim.keymap.set('i', '<A-k>' , '<Esc>:move -2<cr>==gi', { desc = 'Move Line Up' })

-- Quickly source current file / execute Lua code
vim.keymap.set('n', '<leader>xx', '<Cmd>source %<CR>', { desc = 'Source current file' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Fyler keymaps
-- vim.keymap.set('n', '<F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })
-- vim.keymap.set('v', '<F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })
-- vim.keymap.set('n', '<leader><F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })

-- Floaterm keymaps
vim.keymap.set('n', '<F7>', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
vim.keymap.set('t', '<F7>', '<C-n>:FloatermToggle<CR>', { desc = 'Toggle Floaterm' })

-- Tab keymaps
vim.keymap.set('n', '<leader><Tab><Tab>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><Tab>p', ':tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader><Tab>n', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader><Tab>c', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader><Tab>o', ':tabonly<CR>', { desc = 'Close other tabs' })
vim.keymap.set('n', '<leader><Tab>-', ':tabmove -<CR>', { desc = 'Move tab left' })
vim.keymap.set('n', '<leader><Tab>+', ':tabmove +<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader><Tab>f', ':tabfind ', { desc = 'Find tab' })

-- Black hole delete
vim.keymap.set('n', 'd', '"_d', { desc = 'Delete text forever' })
vim.keymap.set('v', 'd', '"_d', { desc = 'Delete text forever' })
vim.keymap.set('n', 'dd', '"_dd', { desc = 'Delete line forever' })
vim.keymap.set('v', 'dd', '"_dd', { desc = 'Delete line forever' })
vim.keymap.set('n', '<Del>', '"_x', { desc = 'Delete character forever' })
vim.keymap.set('v', '<Del>', '"_x', { desc = 'Delete character forever' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete character forever' })
vim.keymap.set('v', 'x', '"_x', { desc = 'Delete character forever' })

-- Yank then Delete
-- vim.keymap.set('n', 'x', 'd', { desc = 'Cut text'})
-- vim.keymap.set('v', 'x', 'd', { desc = 'Cut text' })
-- vim.keymap.set('n', 'xx', 'd', { desc = 'Cut text' })
-- vim.keymap.set('v', 'xx', 'dd', { desc = 'Cut text' })
vim.keymap.set('n', '<C-x>', 'd', { desc = 'Cut text' })
vim.keymap.set('v', '<C-x>', 'd', { desc = 'Cut text' })
vim.keymap.set('n', '<C-x><C-x>', 'dd', { desc = 'Cut text' })
vim.keymap.set('v', '<C-x><C-x>', 'dd', { desc = 'Cut text' })

-- Go keybinds
vim.cmd("autocmd FileType go nmap <Leader><Leader>l GoLint")
vim.keymap.set('n', '<Leader>gc', ':lua require(\'go.comment\').gen()<CR>', { desc = 'Generate Go Comment' })

-- Search
vim.keymap.set('n', '<Leader>sl', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Search and Replace on current line"})
vim.keymap.set('n', '<Leader>sa', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':%s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "Search and Replace all instances"})
vim.keymap.set('n', '<Leader>st', ':set hlsearch!<cr><C-l>', {desc ="Toggle Search hilighting"})

-- Neowiki note taking
vim.keymap.set('n','<Leader>n',"" ,{ desc = "NeoWiki notes" } )
vim.keymap.set('n','<Leader>no', "<cmd>lua require('neowiki').open_wiki()<cr>", { desc = "Open wiki index" } )
vim.keymap.set('n','<Leader>nO', "<cmd>lua require('neowiki').open_wiki_floating()<cr>", { desc = "Open Wiki in floating window" } )
vim.keymap.set('n','<Leader>nT', "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", { desc = "Open Wiki in Tab" } )
vim.keymap.set('n','<Leader>nt', "", { desc = "Toggle task" } )
vim.keymap.set('n','<Leader>nr', "", { desc = "Rename wiki page" } )
vim.keymap.set('n','<Leader>nd', "", { desc = "Delete wiki page" } )
vim.keymap.set('n','<Leader>ni', "", { desc = "Insert wiki page" } )
vim.keymap.set('n','<Leader>nc', "", { desc = "Cleanup links in wiki page" } )

-- Buffer stuff
vim.keymap.set('n','<Leader>bd', ":bd<CR>", { desc = "Delete current buffer" } )
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'Previous buffer' })

-- Yazi <cmd>
vim.keymap.set('n', '<F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
vim.keymap.set('v', '<F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
vim.keymap.set('n', '<leader><F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })
vim.keymap.set('v', '<leader><F6>', ':Yazi<CR>', { desc = 'Launch Yazi' })

-- LSP
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Omnicomplete Code' })

