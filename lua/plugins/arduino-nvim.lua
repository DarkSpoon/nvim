return {
  "yuukiflow/Arduino-Nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- Load Arduino plugin for .ino files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "arduino",
      callback = function()
        require("Arduino-Nvim")
      end,
    })
  end,
}

-- Must put a .arduino_config.lua in the root of the project. Below is for the nano with the old bootloader
-- return {
--   board = "arduino:avr:nano:cpu=atmega328old",
--   port = "COM5",
--   baudrate = "9600",
-- }
--
-- HiLetgo ESP-32S/ESP-32D
-- return {
--   board = "esp32:esp32:esp32da",
--   port = "COM6",
--   baudrate = "9600",
-- }
