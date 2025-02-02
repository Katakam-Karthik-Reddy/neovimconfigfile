--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use ('wbthomason/packer.nvim')
    use ('nvim-lua/plenary.nvim' ) -- dependency for telescope, 
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use { 'nvim-lualine/lualine.nvim' } 
    use {
          'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
        requires = {  { 'BurntSushi/ripgrep' },
                    { 'nvim-telescope/telescope-fzy-native.nvim' },
                    { 'sharkdp/fd' } 
        }
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use{ 'nvim-treesitter/nvim-treesitter' }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use 'mfussenegger/nvim-jdtls'
end)
