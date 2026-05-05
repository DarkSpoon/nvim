-- FIX: For Windows:
-- Download latest GCC (with POSIX threads) + MinGW-w64 (MSVCRT) from www.winlibs.com
-- Extract to a directory ie: C:\ProgramData\mingw64\
-- Add System Environment variable "CC" with path to mingw64\bin\x86_64-w64-mingw32-gcc.exe 
-- OR
-- winget install BrechtSanders.WinLibs.POSIX.MSVCRT.LLVM
-- Add System Environment variable "CC" with path to ~\AppData\Local\Microsoft\WinGet\Packages\BrechtSanders.WinLibs.POSIX.MSVCRT.LLVM...\mingw64\bin\x86_64-w64-mingw32-gcc.exe
local langs = {
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
}

-- Install treesitter for list of langs
require("nvim-treesitter").install(langs)

-- Autocommand to enable folding, indents, and start treesitter for installed langs
vim.api.nvim_create_autocmd('FileType', {
    pattern = langs,
    callback = function()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.opt.fillchars = { fold = " ", foldopen = "▾", foldclose = "▸", foldinner = " ", foldsep = " ", }
        vim.treesitter.start()
    end,
})
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "*" } ,
--     callback = function()
--         local filetype = vim.bo.filetype
--         if filetype and filetype ~= "" then
--             local success = pcall(function()
--                 vim.treesitter.start()
--             end)
--             if not success then
--                 return
--             end
--         end
--     end,
-- })
