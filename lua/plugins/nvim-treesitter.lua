-- FIX: For Windows:
-- Download latest GCC (with POSIX threads) + MinGW-w64 (MSVCRT) from winlibs.com
-- Extract to a directory ie: C:\ProgramData\mingw64\
-- Add System Environment variable "CC" with path to mingw64\bin\x86_64-w64-mingw32-gcc.exe 

require("nvim-treesitter").install({
    "arduino",
    "bash",
    "gitcommit",
    "gitignore",
    "ini",
    "json",
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
