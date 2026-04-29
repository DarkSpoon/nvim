require("which-key").add({{ "<leader>p", group = "python" }})

vim.keymap.set("n", "<leader>pr", ':FloatermNew py %:p<cr>', { buffer = true, desc = 'Run Python Code' })
