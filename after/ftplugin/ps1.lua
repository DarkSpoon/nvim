require("which-key").add({{ "<leader>p", group = "powershell" },})

vim.keymap.set({ 'n','v' }, '<Leader>pb', '<esc>i<#<cr>.SYNOPSIS<cr>.DESCRIPTION<cr>.PARAMETER $Param<cr>.INPUTS<cr>.OUTPUTS<cr>.EXAMPLE<cr>#><cr><esc>', { desc = 'Generate Powershell Usage', buffer = true } )
