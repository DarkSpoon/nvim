-- autocmd
-------------------------
local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroup("highlight-yank"),
    callback = function()
        -- vim.highlight.on_yank()
        vim.hl.on_yank()
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    desc = "Wrap text and check spelling for text files",
    group = augroup("wrap_spell"),
    pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Hilight the line on insert mode only
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = augroup("HiCursor"),
  callback = function()
    vim.cmd("set cursorline")
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = augroup("NoHiCursor"),
  callback = function()
    vim.cmd("set nocursorline")
  end,
})

-- Move cursor forward one character when leaving Insert mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = augroup("MoveCursor"),
  callback = function()
    vim.cmd(":normal! `^")
  end,
})
