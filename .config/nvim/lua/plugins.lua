require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/impatient.nvim', -- Until https://github.com/neovim/neovim/pull/15436 is merged
  }
  use 'kassio/neoterm'
  use {
    'ggandor/lightspeed.nvim',
    config = function ()
      require'lightspeed'.setup {
        jump_to_first_match = true,
        jump_on_partial_input_safety_timeout = 400,
        highlight_unique_chars = false,
        grey_out_search_area = true,
        match_only_the_start_of_same_char_seqs = true,
        limit_ft_matches = 5,
        full_inclusive_prefix_key = '<c-x>',
      }
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }
  -- Debugger
  use { 'mfussenegger/nvim-dap',
    requires = { 'theHamsta/nvim-dap-virtual-text', 'rcarriga/nvim-dap-ui' }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path' 
  use 'onsails/lspkind-nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = function() 
      require'nvim-tree'.setup {}
    end,
    vim.api.nvim_set_keymap('n', '<F12>', ':NvimTreeToggle<cr>', { silent = true })
  }
  use 'ray-x/lsp_signature.nvim'
  use {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
    vim.api.nvim_set_keymap('n', '<F2>', ':TroubleToggle<cr>', { silent = true }),
    config = function()
      require("trouble").setup {}
    end
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'antoinemadec/FixCursorHold.nvim'
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'
  use {'kkoomen/vim-doge', run = 'call doge#install()' }
  use 'tpope/vim-fugitive'
  use {
    'machakann/vim-sandwich',
    config = function()
      vim.cmd('runtime macros/sandwich/keymap/surround.vim')
    end
  }
  use {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = function()
      require('nvim_comment').setup {
        comment_empty = true
      }
    end,
  }
  use 'hoob3rt/lualine.nvim'
  use 'SmiteshP/nvim-gps'
  use 'kevinhwang91/nvim-bqf'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'call mkdp#util#install()',
    ft = "markdown",
  }
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha.themes.dashboard'.section.footer.val = require'alpha.fortune'()
      require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'junegunn/vim-easy-align'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'GustavoKatel/telescope-asynctasks.nvim',
    config = vim.api.nvim_set_keymap('n', '<F4>', ':lua require(\'telescope\').extensions.asynctasks.all()<cr>', { silent = true })
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'simnalamburt/vim-mundo',
    cmd = 'MundoToggle',
    config = vim.api.nvim_set_keymap('n', '<F7>', ':MundoToggle<cr>', { silent = true })
  }
  use 'haya14busa/incsearch.vim'
  use 'dstein64/vim-startuptime'
  use 'junegunn/vim-peekaboo' -- TODO Change with whick-key
  use 'psliwka/vim-smoothie'
  -- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use 'gruvbox-community/gruvbox'
end
)

require('impatient')
require('neoterm')
require('fugitive')
require('treesitter')
require('lsp')
require('debugger')
require('statusline')
require('start-screen')
require('finder')
require('tabline')

-- incsearch
vim.g['incsearch#auto_nohlsearch'] = 1
vim.api.nvim_set_keymap('n', '/', '<Plug>(incsearch-forward)', {})
vim.api.nvim_set_keymap('n', '?', '<Plug>(incsearch-backward)', {})
vim.api.nvim_set_keymap('n', 'g/', '<Plug>(incsearch-stay)', {})
vim.api.nvim_set_keymap('n', 'n', '<Plug>(incsearch-nohl-n)zz', {})
vim.api.nvim_set_keymap('n', 'N', '<Plug>(incsearch-nohl-N)zz', {})
vim.api.nvim_set_keymap('n', '*', '<Plug>(incsearch-nohl-*)zz', {})
vim.api.nvim_set_keymap('n', '#', '<Plug>(incsearch-nohl-#)zz', {})
vim.api.nvim_set_keymap('n', 'g*', '<Plug>(incsearch-nohl-g*)zz', {})
vim.api.nvim_set_keymap('n', 'g#', '<Plug>(incsearch-nohl-g#)zz', {})

-- vim-easy-align
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
