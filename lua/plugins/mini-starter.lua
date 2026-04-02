vim.pack.add({
    "https://github.com/nvim-mini/mini.starter",
});

local starter = require("mini.starter")
local builtin = require("telescope.builtin")
local pad = string.rep(" ", 22)
local version = vim.version().build

local new_section = function(name, action, section)
    return { name = name, action = action, section = pad .. section }
end

local DateTime = (function()
    local timer = vim.loop.new_timer()
    timer:start(0, 4100, vim.schedule_wrap(function()
        if vim.bo.filetype ~= 'ministarter' then
            timer:stop()
            return
        end
        starter.refresh()
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
    "                                                  " .. version .. "        "
    },  "\n"),
    evaluate_single = true,
    items = {
        new_section("files",        "Telescope find_files",                 "Find"),
        new_section("recent ",     "Telescope oldfiles",                    "Find"),
        new_section("text",        "Telescope live_grep",                   "Find"),
        new_section("config files",          function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,     "Config"),
        new_section("update plugins",            ":lua vim.pack.update()",      "Config"),
        new_section("new file",        "ene | startinsert",                 "File System"),
        new_section("explore",          "Yazi cwd",                         "File System"),
        new_section("quit",            "qa",                                "File System"),
    },
    footer = DateTime,
    content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
    },
})
