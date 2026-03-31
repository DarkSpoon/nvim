-- return{
--     'nvim-treesitter/nvim-treesitter',
--     branch = 'master',
--     lazy = false,
--     build = ':TSUpdate'
--
-- }

vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ':TSUpdate'
    }
})
