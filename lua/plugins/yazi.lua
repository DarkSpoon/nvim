require('yazi').setup{
    -- open_for_directories = true,
    -- change_neovim_cwd_on_close = true,
    integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker"
    },
    keymaps = {
        show_help = "<f1>",
    }
}
