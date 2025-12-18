return {
    'nvim-mini/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.ai').setup({
            mappings = {
                -- Better Around/Inside textobjects
                --
                -- Examples:
                --  - va)  - [V]isually select [A]round [)]paren
                --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
                --  - ci'  - [C]hange [I]nside [']quote
                around = 'a',
                inside = 'i',
                around_next = 'an',
                inside_next = 'in',
                around_last = 'al',
                inside_last = 'il',

                goto_left = 'g[',
                goto_right = 'g]',

            },
            n_lines = 500
        })

        require('mini.surround').setup({
            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            -- {}}
            -- Examples:
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            -- Default module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = 'sa', -- Add surrounding in Normal and Visual modes
                delete = 'sd', -- Delete surrounding
                find = 'sf', -- Find surrounding (to the right)
                find_left = 'sF', -- Find surrounding (to the left)
                highlight = 'sh', -- Highlight surrounding
                replace = 'sr', -- Replace surrounding

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
        })

        require('mini.move').setup({
            -- Default module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '<M-h>',
                right = '<M-l>',
                down = '<M-j>',
                up = '<M-k>',

                -- Move current line in Normal mode
                line_left = '<C-h>',
                line_right = '<C-l>',
                line_down = '<C-j>',
                line_up = '<C-k>',
            },

            -- Options which control moving behavior
            options = {
                -- Automatically reindent selection during linewise vertical move
                reindent_linewise = true,
            },
        })

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}
