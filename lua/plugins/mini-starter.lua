vim.pack.add({
    "https://github.com/nvim-mini/mini.starter",
    -- "https://github.com/nvim-telescope/telescope.nvim"
});

local osname = vim.loop.os_uname().sysname
local starter = require("mini.starter")
local builtin = require("telescope.builtin")
local pad = string.rep(" ", 22)
local confDir = ""

-- Dumb hack. In Windows, when a file is picked from the list after the CWD is set by anything except a hardcoded string, the C: drive changes to U:
if osname == 'Windows_NT' then
    confDir = "C:/Users/jpayne/AppData/Local/nvim/"
else
    confDir = vim.fn.stdpath 'config'
end

local new_section = function(name, action, section)
    return { name = name, action = action, section = pad .. section }
end

local DateTime = (function()
    local timer = vim.loop.new_timer()
    -- timer:start(0, 1000, vim.schedule_wrap(function()
    timer:start(0, 5000, vim.schedule_wrap(function()
        if vim.bo.filetype ~= 'ministarter' then
            timer:stop()
            return
        end
        MiniStarter.refresh()
    end))

    return function()
        return pad .. os.date("%x") .. "  " .. os.date("%I") .. ":" .. os.date("%M") .. " " .. os.date("%p")
    end
end)()

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
        -- new_section("config files",          function() builin.find_files { cwd = vim.fn.stdpath 'config' } end,     "Config"),
        -- new_section("config files",          function() builtin.find_files { cwd = os.getenv("NVIMCONFIG") } end,     "Config"),
        new_section("config files",          function() builtin.find_files { cwd = confDir} end,     "Config"),
        new_section("update",            ":lua vim.pack.update()",      "Config"),
        new_section("new file",        "ene | startinsert",                 "System"),
        new_section("explore",          "Yazi cwd",                         "System"),
        new_section("quit",            "qa",                                "System"),
    },
    footer = DateTime,
    content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
    },
})
