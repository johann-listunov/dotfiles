local ensure_packer = function()
    local fn = vim.fn
    local cmd = vim.cmd
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        cmd('packadd packer.nvim')
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

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

    if packer_bootstrap then
        require('packer').sync()
    end
end)
