return {
    'nvim-mini/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.ai').setup({
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
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

        require('mini.pairs').setup({
            -- In which modes mappings from this `config` should be created
            modes = { insert = true, command = false, terminal = false },

            -- Global mappings. Each right hand side should be a pair information, a
            -- table with at least these fields (see more in |MiniPairs.map()|):
            -- - <action> - one of "open", "close", "closeopen".
            -- - <pair> - two character string for pair to be used.
            -- By default pair is not inserted after `\`, quotes are not recognized by
            -- <CR>, `'` does not insert pair after a letter.
            -- Only parts of tables can be tweaked (others will use these defaults).
            -- Supply `false` instead of table to not map particular key.
            mappings = {
                ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][^)]' },
                ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][^]]' },
                ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][^}]' },
                [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

                ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\][^"]',   register = { cr = false } },
                ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].',   register = { cr = false } },
            },
            -- skip autopair when next character is one of these
            -- skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            -- skip_unbalanced = true,
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
                line_left = '<M-h>',
                line_right = '<M-l>',
                line_down = '<M-j>',
                line_up = '<M-k>',
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
