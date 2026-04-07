-- vim.pack.add({
--     "https://github.com/neovim/nvim-lspconfig",
--     "https://github.com/mason-org/mason.nvim",
--     "https://github.com/mason-org/mason-lspconfig.nvim",
--     "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
--     "https://github.com/edte/blink-go-import.nvim",
--     "https://github.com/rafamadriz/friendly-snippets",
--    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x"), },
-- })
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "powershell_es",
        "pylsp",
        "gopls",
        "arduino_language_server"
    }
})

require("blink-go-import").setup()

require("blink.cmp").setup({
   keymap = { preset = "enter" },
   appearance = { nerd_font_variant = "mono" },
   completion = {
      documentation = {
         auto_show = true,
         auto_show_delay_ms = 500,
      },
   },
   sources = {
      default = { "lsp", "path", "buffer", "go_pkgs" },
      providers = {
         go_pkgs = { module = "blink-go-import", name = "Import" },
      },
   },
   fuzzy = { implementation = "lua" },
   signature = { enabled = true },
})

vim.lsp.config["*"] = {
   capabilities = require("blink.cmp").get_lsp_capabilities(),
}
