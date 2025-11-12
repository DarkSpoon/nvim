-- Move Lines
vim.keymap.set({ 'n', 'x' }, '<M-S-Up>', ':move -2<cr>', { desc = 'Move Line Up' })
vim.keymap.set({ 'n', 'x' }, '<M-S-Down>', ':move +1<cr>', { desc = 'Move Line Down' })
vim.keymap.set('i', '<M-S-Up>', '<C-o>:move -2<cr>', { desc = 'Move Line Up' })
vim.keymap.set('i', '<M-S-Down>', '<C-o>:move +1<cr>', { desc = 'Move Line Down' })

-- Quickly source current file / execute Lua code
vim.keymap.set('n', '<leader>xx', '<Cmd>source %<CR>', { desc = 'Source current file' })

-- Ctrl-L redraws the screen by default. Now it will also toggle search highlighting.
vim.keymap.set('n', '<C-l>', ':set hlsearch!<cr><C-l>', { desc = 'Toggle search highlighting' })

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- nvim-tree keymaps
-- vim.keymap.set('n', '<F6>', ':NvimTreeToggle<CR>', { desc = '[T]oggle Nvim-Tree' })

-- Fyler keymaps
vim.keymap.set('n', '<F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })
vim.keymap.set('v', '<F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })
vim.keymap.set('n', '<leader><F6>', ':Fyler<CR>', { desc = 'Launch Fyler' })

-- nvim-Floaterm keymaps
vim.keymap.set('n', '<F7>', ':FloatermToggle<CR>', { desc = 'Toggle [F]loaterm' })
vim.keymap.set('t', '<F7>', '<C-n>:FloatermToggle<CR>', { desc = 'Toggle [F]loaterm' })

-- Tab keymaps
vim.keymap.set('n', '<leader><Tab><Tab>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><Tab>p', ':tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader><Tab>n', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader><Tab>c', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader><Tab>-', ':tabmove -<CR>', { desc = 'Move tab left' })
vim.keymap.set('n', '<leader><Tab>+', ':tabmove +<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader><Tab>f', ':tabfind ', { desc = 'Find tab' })

-- Black hole delete
vim.keymap.set('n', 'd', '"_d', { desc = 'Delete text forever' })
vim.keymap.set('v', 'd', '"_d', { desc = 'Delete text forever' })
vim.keymap.set('n', 'dd', '"_dd', { desc = 'Delete line forever' })
vim.keymap.set('v', 'dd', '"_dd', { desc = 'Delete line forever' })
vim.keymap.set('n', 'x', 'd', { desc = 'Cut text' })
vim.keymap.set('v', 'x', 'd', { desc = 'Cut text' })
vim.keymap.set('n', 'xx', 'dd', { desc = 'Cut entire line' })
vim.keymap.set('v', 'xx', 'dd', { desc = 'Cut entire line' })

-- Go keybinds
vim.cmd("autocmd FileType go nmap <Leader><Leader>l GoLint")
vim.keymap.set('n', '<Leader>gc', ':lua require(\'go.comment\').gen()<CR>', { desc = 'Generate Go Comment' })

-- Search
vim.keymap.set('n', '<Leader>sl', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "[S]earch and Replace on current [l]ine"})
vim.keymap.set('n', '<Leader>sa', function()
    local match = vim.fn.input("Find: ")
    local replace = vim.fn.input("Replace with: ")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':%s/'..match..'/'..replace..'<CR>',true,false,true), 'n', false)
end
, {desc = "[S]earch and Replace [a]ll instances"})
vim.keymap.set('n', '<Leader>sc', ':set hlsearch!<cr><C-l>', {desc ="[C]lear [S]earch results"})

-- Neowiki note taking
vim.keymap.set('n','<Leader>n',"" ,{ desc = "NeoWiki notes" } )
vim.keymap.set('n','<Leader>no', "<cmd>lua require('neowiki').open_wiki()<cr>", { desc = "[o]pen wiki index" } )
vim.keymap.set('n','<Leader>nO', "<cmd>lua require('neowiki').open_wiki_floating()<cr>", { desc = "[O]pen Wiki in floating window" } )
vim.keymap.set('n','<Leader>nT', "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", { desc = "Open Wiki in [T]ab" } )
vim.keymap.set('n','<Leader>nt', "", { desc = "[t]oggle task" } )
vim.keymap.set('n','<Leader>nr', "", { desc = "[r]ename wiki page" } )
vim.keymap.set('n','<Leader>nd', "", { desc = "[d]elete wiki page" } )
vim.keymap.set('n','<Leader>ni', "", { desc = "[i]nsert wiki page" } )
vim.keymap.set('n','<Leader>nc', "", { desc = "[c]leanup links in wiki page" } )

