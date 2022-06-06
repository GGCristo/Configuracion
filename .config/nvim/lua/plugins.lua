require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/impatient.nvim', -- Until https://github.com/neovim/neovim/pull/15436 is merged
  }
  use 'akinsho/toggleterm.nvim'
  use {
    'ggandor/lightspeed.nvim',
    config = function ()
      require'lightspeed'.setup {
        jump_to_unique_chars = { safety_timeout = 400 },
        match_only_the_start_of_same_char_seqs = true,
        limit_ft_matches = 5,
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
  use 'ray-x/lsp_signature.nvim'
  use {
     "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  }
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
  -- use 'skywind3000/asynctasks.vim'
  -- use 'skywind3000/asyncrun.vim'
  use {'kkoomen/vim-doge', run = 'call doge#install()' }
  use 'tpope/vim-fugitive'
  use {
    'machakann/vim-sandwich',
    config = function()
      vim.cmd('runtime macros/sandwich/keymap/surround.vim')
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'hoob3rt/lualine.nvim'
  use 'SmiteshP/nvim-gps'
  use 'kevinhwang91/nvim-bqf'
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
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
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', gs.stage_hunk)
          map({'n', 'v'}, '<leader>hr', gs.reset_hunk)
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          -- map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          -- map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
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
  use 'zah/nim.vim'
  use 'haya14busa/incsearch.vim'
  use 'dstein64/vim-startuptime'
  use 'junegunn/vim-peekaboo' -- TODO Change with whick-key
  use 'psliwka/vim-smoothie'
  -- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use 'gruvbox-community/gruvbox'
  use { 'bennypowers/nvim-regexplainer',
    config = function() require'regexplainer'.setup()  end,
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    }
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
  }
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
require('explorer')

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
