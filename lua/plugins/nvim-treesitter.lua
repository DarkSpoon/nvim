-- return{
--     'nvim-treesitter/nvim-treesitter',
--     branch = 'master',
--     lazy = false,
--     build = ':TSUpdate'
--
-- }

-- vim.pack.add({
--     {
--         src = "https://github.com/nvim-treesitter/nvim-treesitter",
--         branch = "master",
--         build = ':TSUpdate'
--     }
-- })
vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        -- build = ':TSUpdate'
    }
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
    "arduino",
    "bash",
    "gitcommit",
    "gitignore",
    "ini",
    "json", "jsonc",
    "lua",
    "make",
    "markdown", "markdown_inline",
    "powershell",
    "python",
    "toml",
    "vim",
    "yaml"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" } ,
    callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= "" then
            local success = pcall(function()
                vim.treesitter.start()
            end)
            if not success then
                return
            end
        end
    end,
})
