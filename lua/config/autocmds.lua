-- autocmd
-------------------------
local function augroup(name)
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
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

-- Disable line hilight on Insert mode
vim.cmd("set cursorline")
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = augroup("HiCursor"),
  callback = function()
    vim.cmd("set cursorline")
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
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

-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then return end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then return end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })
