vim.api.nvim_create_autocmd("FileType", {
  pattern = "arduino",
  callback = function()
    require("Arduino-Nvim")
  end,
})

-- Must put a .arduino_config.lua in the root of the project. 
-- Nano with the old bootloader
-- return {
--   board = "arduino:avr:nano:cpu=atmega328old",
--   port = "COM5",
--   baudrate = "9600",
-- }
-- ESP32 board
-- return {
--     board = "esp32:esp32:esp32da",
--     port = "com6",
--     baudrate = "115200",
-- }
