return {
    'voldikss/vim-floaterm',
    event = 'VeryLazy',
    init = function()
        -- Use Catppuccin Macchiatto Crust for background color
        -- vim.cmd.hi('Floaterm guibg=#181926 guifg=gray') 
        -- Use GruvBox Dark for background color
        vim.cmd.hi('Floaterm guibg=#282828 guifg=gray')
        end,
    }
