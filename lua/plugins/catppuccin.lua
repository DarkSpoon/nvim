return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha'.
    -- vim.cmd.colorscheme('catppuccin-macchiato')

    -- You can configure highlights by doing something like:
    vim.cmd.hi('Comment gui=none')
  end,
}
