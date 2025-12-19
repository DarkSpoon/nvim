return {
    'nvim-mini/mini.surround',
    version = false,
    event = 'VeryLazy',
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
}
