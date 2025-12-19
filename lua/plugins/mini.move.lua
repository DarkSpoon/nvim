return {
    'nvim-mini/mini.move',
    version = false,
    event = 'VeryLazy',
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
}
