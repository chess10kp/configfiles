local lang = {}

-- lang["fatih/vim-go"] = {
-- 	enabled = true,
-- 	lazy = true,
-- 	ft = "go",
-- 	build = ":GoInstallBinaries",
-- 	config = require("lang.vim-go"),
-- }
lang["ray-x/go.nvim"] = {
	enabled = true,
	lazy = true,
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
lang["Vigemus/iron.nvim"] = {
	enabled = true,
	lazy = true,
	ft = {"python", "haskell"},
	config = require("lang.iron"),
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	enabled = true,
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	enabled = false,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
-- lang["chrisbra/csv.vim"] = {
-- 	enabled = true,
-- 	lazy = true,
-- 	ft = "csv",
-- }
lang["pmizio/typescript-tools.nvim"] = {
	lazy = true,
	ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = require("lang.typescript-tools"),
}
lang["mrcjkb/haskell-tools.nvim"] = {
	enabled = true,
	lazy = true,
	ft = { "haskell", "cabal", "lhaskell", "cabalproject" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = require("lang.haskell-tools"),
}
lang["nvim-java/nvim-java"] = {
	lazy = true,
	ft = "java",
	dependencies = { "nvim-lspconfig" },
	config = function()
		require("java").setup()

		local jdtcfg = {
			settings = {
				java = { signatureHelp = { enabled = true }, contentProvider = { preferred = "fernflower" } },
			},
			on_init = function(client)
				if client.config.settings then
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end
			end,
		}

		require("lspconfig").jdtls.setup(jdtcfg)
	end,
}
lang["luckasRanarison/tailwind-tools.nvim"] = {
	enabled = true,
	lazy = true,
	name = "tailwind-tools",
	ft = { "typescriptreact", "javascriptreact" },
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {}, -- your configuration
}
return lang
