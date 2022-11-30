-- This is to install packer if it not present in our system.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()  --true if packer was just install our system.

-- This is to install, update and delete packages.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
	return
end




return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- lua functions that many plugins used
  use('nvim-lua/plenary.nvim')

  -- preferred colorscheme
  use('bluz71/vim-nightfly-guicolors')

  -- tmux & split window navigate
  use('christoomey/vim-tmux-navigator')
  use('szw/vim-maximizer')

  -- essential plugins
  use('tpope/vim-surround')
  use('vim-scripts/ReplaceWithRegister')

  -- commenting with gc
  use('numToStr/Comment.nvim')

  -- file explorer
  use('nvim-tree/nvim-tree.lua')

  -- statusline
  use('nvim-lualine/lualine.nvim')

  -- toggleterminal
  use('akinsho/toggleterm.nvim')

  -- fuzzy finding
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' })

  --mason is a lsp manager
  -- use 'williamboman/mason.nvim'
  -- use 'williamboman/mason-lspconfig.nvim'

  -- lsp installer
  use('williamboman/nvim-lsp-installer')
  -- language server
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

 -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  --treesitter for codehighlighting
  use('nvim-treesitter/nvim-treesitter')
  --paring of brackets in lsp 
  use 'windwp/nvim-autopairs'

  -- icons in suggestions
  use('onsails/lspkind.nvim')
--For luasnip users.
-- use 'L3MON4D3/LuaSnip'
-- use 'saadparwaiz1/cmp_luasnip'

-- For ultisnips users.
 -- use 'SirVer/ultisnips'
 -- use 'quangnguyen30192/cmp-nvim-ultisnips'

 -- For snippy users.
 -- use 'dcampos/nvim-snippy'
 -- use 'dcampos/cmp-snippy'

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
