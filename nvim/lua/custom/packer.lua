vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theme
    use 'folke/tokyonight.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'nvim-telescope/telescope.nvim'
    
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
end)
