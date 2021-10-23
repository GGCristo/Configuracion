local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New file", ":enew<cr>"),
  dashboard.button( "p", "  > Open Project", ":Telescope projects<cr>"),
  dashboard.button( "o", "  > Recently Opened Files", ":Telescope oldfiles<cr>"),
  dashboard.button( "c", "  > Open Neovim Configuration", ":e ~/.config/nvim/init.lua<cr>:cd %:p:h<cr>"),
  dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local packages = vim.fn.len("globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)")
dashboard.section.footer.val = 'LuaJIT loaded '..packages..' packages'

-- Send config to alpha
alpha.setup(dashboard.opts)

-- vim.cmd('au FileType alpha set showtabline=0 | au WinLeave <buffer> set showtabline=2')
-- vim.cmd('au FileType alpha set laststatus=0 | au WinLeave <buffer> set laststatus=2')
-- Disable folding on alpha buffer
-- vim.cmd([[
-- autocmd FileType alpha setlocal nofoldenable
-- ]])

-- vim.g.startify_custom_header = {
--     "                                                     ",
--     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--     "                                                     ",
-- }

-- vim.cmd([[
-- let g:startify_lists = [
--       \ { 'type': 'files',     'header': ['   MRU']            },
--       \ { 'type': 'sessions',  'header': ['   Sessions']       },
--       \ ]
-- ]])
-- vim.g.startify_fortune_use_unicode = 1
-- vim.g.startify_custom_footer = 'startify#fortune#boxed()'
