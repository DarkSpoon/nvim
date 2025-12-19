return {
    'nvim-mini/mini.ai',
    version = false,
    event = 'VeryLazy',
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
}
