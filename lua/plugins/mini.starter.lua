return {
    'nvim-mini/mini.starter',
    version = false,
    event = 'VimEnter',
    -- require('mini.starter').setup()
    opts = function()
    local logo = table.concat({
        "       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ",
        "       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ",
        "       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       ",
        "       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ",
        "       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ",
        "       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ",
    }, "\n")
    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end
    local builtin = require("telescope.builtin")
    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("files",        "Telescope find_files",                 "Find"),
        new_section("recent ",     "Telescope oldfiles",                    "Find"),
        new_section("text",        "Telescope live_grep",                   "Find"),
        new_section("config files",          function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,     "Config"),
        new_section("lazy",            "Lazy",                              "Config"),
        new_section("new file",        "ene | startinsert",                 "System"),
        new_section("explore",          "Yazi cwd",                         "System"),
        new_section("quit",            "qa",                                "System"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function(ev)
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        -- INFO: based on @nvim-mini's recommendation (thanks a lot!!!)
        if vim.bo[ev.buf].filetype == "ministarter" then
          pcall(starter.refresh)
        end
      end,
    })
  end,
}
