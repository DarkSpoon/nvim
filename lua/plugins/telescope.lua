  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  local builtin = require 'telescope.builtin'
  local actions = require 'telescope.actions'

  require('telescope').setup {
    -- You can put your default mappings / updates / etc. in here
    --  All the info you're looking for is in `:help telescope.setup()`
    --
    defaults = {
        mappings = {
            i = { ['<c-d>'] = actions.delete_buffer },
            n = { ['<c-d>'] = actions.delete_buffer },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search For File Names' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search Current Word' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search Files with Grep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search existing Buffers' })
      vim.keymap.set('n', '<leader>bs', builtin.buffers, { desc = 'Search existing Buffers' })
      vim.keymap.set('n', 'bs', builtin.buffers, { desc = 'Search existing Buffers' })
      vim.keymap.set('n', '<S-j>', builtin.buffers, { desc = 'Search existing Buffers' })
      vim.keymap.set('n', '<leader>uc', builtin.colorscheme, { desc = 'Search existing Colorschemes' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
      -- vim.keymap.set('n', '/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
          require("yazi").yazi(nil, vim.fn.stdpath 'config')
          -- If and only if I opened anything from my U:\PowerShell folder the below doesn't work.
          -- It can't seem to change the drive letter back. The rest of the path is correct though.
          -- ie C:\Users\me\AppData\Local\nvim\init.lua gets set as U:\Users\me\AppData\Local\nvim\init.lua
          -- cd reports back U:\PowerShell\ on any and all buffers after opening anything from that folder. 
          -- Doesn't happen on any other files or folders on that drive
          -- vim.fn.stdpath 'config' gives correct config directory with correct drive letter
          -- builtin.find_files {
              -- cwd = vim.fn.stdpath 'config'
          -- }
      end, { desc = 'Search Neovim files' })
