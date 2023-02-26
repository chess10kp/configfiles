vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'nvim-treesitter/nvim-treesitter'

        use 'folke/tokyonight.nvim'
        use 'nvim-tree/nvim-web-devicons'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.1',
                -- or                            , branch = '0.1.x',
                requires = { {'nvim-lua/plenary.nvim'} }
        }
        use "nvim-telescope/telescope-file-browser.nvim"
        use 'mbbill/undotree'

        use {"akinsho/toggleterm.nvim", tag = '*', config = function() require("toggleterm").setup()
        end}


        use {
                'nvim-lualine/lualine.nvim',
        }

        use {
                "startup-nvim/startup.nvim",
                requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
                require("startup").setup({theme="startify"})
        }

        use 'norcalli/nvim-colorizer.lua'


        use {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig"
        }
        use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip' -- Snippets plugin


end)



