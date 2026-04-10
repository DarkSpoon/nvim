
local wk = require("which-key")
wk.setup({
        preset = "helix",
        defaults = {},
        spec = {
            {
                mode = { "n", "v" },
                { "<leader><tab>", group = "tabs" },
                { "<leader>c", group = "code" },
                { "<leader>d", group = "debug" },
                { "<leader>dp", group = "profiler" },
                { "<leader>f", group = "file" },
                -- { "<leader>g", group = "go" },
                { "<leader>gh", group = "hunks" },
                { "<leader>m", group = "move" },
                { "<leader>s", group = "search" },
                { "<leader>u", group = "ui" },
                { "<leader>x", group = "diagnostics/quickfix" },
                -- { "<leader>y", group = "yazi" },
                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                -- { "gs", group = "surround" },
                { "z", group = "fold" },
                {
                    "<leader>b",
                    group = "buffer",
                    expand = function()
                        return require("which-key.extras").expand.buf() -- which-key.extras?
                    end,
                },
                {
                    "<leader>w",
                    group = "windows",
                    proxy = "<c-w>",
                   expand = function()
                        return require("which-key.extras").expand.win()
                    end,
                },
                -- better descriptions
                { "gx", desc = "Open with system app" },
            },
        },
})


--arduino bind descriptions
wk.add({
    { "<leader>a", group = "arduino" },
    { "<Leader>au", desc = 'Compile and Upload code' },
    { "<Leader>as", desc = 'Show board and port status' },
    { "<Leader>ag", desc = 'Set board and port' },
    { "<Leader>am", desc = 'Serial monitor' },
    { "<Leader>al", desc = 'Library manager' },
    { "<Leader>ab", desc = 'Select board' },
    { "<Leader>ap", desc = 'Select port' },
    { "<Leader>ar", desc = 'Upload with reset' },
    { "<Leader>ac", desc = 'Compile/Check code' },
})
