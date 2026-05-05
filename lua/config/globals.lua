-- Set <space> as leader key
-- NOTE: Must happen before loading plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set netrw stuff for fidget
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Setup Windows terminal for powershell
if vim.loop.os_uname().sysname == 'Windows_NT' then
    -- Set terminal to Powershell Core
    vim.o.shell = 'pwsh'

    -- Setting shell command flags
    vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';'

    -- Setting shell redirection
    vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

    -- Setting shell pipe
    vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
end
-- Setting shell quote options
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Prevent PS1 files being referred to as "ps1" filetype instead of "powershell"
vim.filetype.add({
    extension = {
        ps1 = 'powershell',
    }
})
