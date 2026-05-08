-- This needs the same name as the filetype. If the Global is not set 'ps1' will be the filetype
require("which-key").add({{ "<leader>p", group = "powershell" },})

vim.keymap.set({ 'n','v' }, '<Leader>pb', '<esc>i<#<cr>.SYNOPSIS<cr>.DESCRIPTION<cr>.PARAMETER $Param<cr>.INPUTS<cr>.OUTPUTS<cr>.EXAMPLE<cr>#><cr><esc>', { desc = 'Generate Powershell Usage', buffer = true } )
