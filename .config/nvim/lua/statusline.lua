-- lualine && nvim-gps
require("nvim-gps").setup({
  icons = {
    ["class-name"] = ' ',      -- Classes and class-like objects
    ["function-name"] = ' ',   -- Functions
    ["method-name"] = ' '      -- Methods (functions inside class-like objects)
  },
  separator = ' > ',
})
local gps = require("nvim-gps")
require('lualine').setup{
  options = {theme  = 'codedark'},
  sections = {
    lualine_c = {
      { gps.get_location, condition = gps.is_available },
    }
  }
}
