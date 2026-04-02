vim.pack.add({
    "https://github.com/nvim-mini/mini.starter",
    -- "https://github.com/nvim-telescope/telescope.nvim"
});

-- local builtin = require("telescope.builtin")
local osname = vim.loop.os_uname().sysname
local starter = require("mini.starter")
local pad = string.rep(" ", 22)
local confDir = ""

if osname == 'Windows_NT' then
    confDir = "C:/Users/jpayne/AppData/Local/nvim/"
else
    confDir = vim.fn.stdpath 'config'
end
local new_section = function(name, action, section)
    return { name = name, action = action, section = pad .. section }
end
require('mini.starter').setup({
    header = table.concat({
    "       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ",
    "       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ",
    "       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       ",
    "       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ",
    "       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ",
    "       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ",
    }, "\n"),
    evaluate_single = true,
    items = {
        new_section("files",        "Telescope find_files",                 "Find"),
        new_section("recent ",     "Telescope oldfiles",                    "Find"),
        new_section("text",        "Telescope live_grep",                   "Find"),
        -- new_section("config files",          function() require("telescope.builtin").find_files { cwd = vim.fn.stdpath 'config' } end,     "Config"),
        -- new_section("config files",          function() require("telescope.builtin").find_files { cwd = os.getenv("NVIMCONFIG") } end,     "Config"),
        new_section("config files",          function() require("telescope.builtin").find_files { cwd = confDir} end,     "Config"),
        new_section("update",            ":lua vim.pack.update()",      "Config"),
        new_section("new file",        "ene | startinsert",                 "System"),
        new_section("explore",          "Yazi cwd",                         "System"),
        new_section("quit",            "qa",                                "System"),
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
    },
})
