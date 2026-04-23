require('mason').setup()
-- require('nvim-lspconfig').setup()
require('mason-lspconfig').setup({
    automatic_enable = true,
})
require('mason-tool-installer').setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "powershell_es",
        "pylsp",
        "gopls",
        "arduino_language_server",
        "marksman",
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

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})
