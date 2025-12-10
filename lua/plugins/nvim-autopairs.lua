return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    opts = {
        map_c_h = true -- Map the <C-h> key to delete a pair
    }
}
