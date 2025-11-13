return {
    "A7Lavinraj/fyler.nvim",
    event="VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- dependencies = { "nvim-mini/mini.icons" },
    branch = "stable",
    opts = {
        icon_provider = "nvim_web_devicons",
        -- icon_provider = "mini_icons",
        close_on_select = true,
        delete_to_trash = true,
        default_explorer = true,
        confirm_simple = false,
        mappings = {
            ["<ESC>"] = "CloseView",
            ["<CR>"] = "Select",
            ["<Tab>"] = "SelectTab",
            ["|"] = "SelectVSplit",
            ["-"] = "SelectSplit",
            ["^"] = "GotoParent",
            ["="] = "GotoCwd",
            ["."] = "GotoNode",
            ["#"] = "CollapseAll",
            ["<BS>"] = "CollapseNode",
        },
        win = {
            border = "rounded",
            kind = "float",
            -- kind = "split_left_most",
            win_opts = {
                number = false,
                relativenumber = false,
            },
        },

    },
    init = function(opts)
        require("fyler").setup(opts)
    end,

}
