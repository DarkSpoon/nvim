-- Enable UI2
require('vim._core.ui2').enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = { -- Options related to the message module.
        ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
        ---or table mapping |ui-messages| kinds, triggers and IDs to a target.
        ---Table keys are matched as a Lua pattern to the message ID. 'default'
        ---mapping applies to any omitted kind: { default = 'cmd', progress = 'msg' }.
        targets = 'cmd',
        dialog = { -- Options related to dialog window.
            height = 0.5, -- Maximum height.
        },

        msg = { -- Options related to msg window.

            height = 0.5, -- Maximum height.

        },

        pager = { -- Options related to message window.

            height = 0.999, -- Maximum height.

        },

    },

})

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
    vim.o.shellredir = '2>&1 | Out-File %s; exit $LastExitCode'
    -- vim.opt.shellredir = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"

    -- Setting shell pipe
    vim.o.shellpipe = '2>&1 | Tee-Object %s; exit $LastExitCode'
    -- vim.opt.shellpipe = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
end
-- Setting shell quote options
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Add file extensions to powershell filetype to fix LSP issues
vim.filetype.add({
    extension = {
        ps1 = 'powershell',
        psd1 = 'powershell',
        psm1 = 'powershell',
    }
})
