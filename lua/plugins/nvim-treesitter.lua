-- FIX: For Windows:
-- Download latest GCC 15.2.0 (with POSIX threads) + MinGW-w64 14.0.0 (MSVCRT) from winlibs.com
-- Extract to a directory ie: C:\ProgramData\mingw64\
-- Add System Environment variable "CC" with path to mingw64\bin\x86_64-w64-mingw32-gcc.exe 

vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        build = ':TSUpdate'
    }
})
--

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
