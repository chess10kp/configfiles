local lang = {}

lang["fatih/vim-go"] = {
	enabled = true,
	lazy = true,
	ft = "go",
	build = ":GoInstallBinaries",
	config = require("lang.vim-go"),
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
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	enabled = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
	enabled = true,
	lazy = true,
	ft = "csv",
}
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
		require("lspconfig").jdtls.setup()
	end,
}
lang["nvim-orgmode/orgmode"] = {
	dependencies = { "nvim-treesitter/nvim-treesitter", lazy = true },
	lazy = true,
	ft = "org",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/projects/notes/todo.org/",
			org_default_notes_file = "~/projects/notes/notes.org",
		})
	end,
}
lang["luckasRanarison/tailwind-tools.nvim"] = {
	enabled = false,
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {}, -- your configuration
}
lang["chipsenkbeil/org-roam.nvim"] = {
	lazy = true,
	tag = "0.1.0",
	dependencies = {
		{
			"nvim-orgmode/orgmode",
			tag = "0.3.4",
		},
	},
	config = function()
		require("org-roam").setup({
			directory = "~/projects/notes/",
			-- optional
			org_files = {
				"~/projects/notes/todo.org",
				"~/projects/notes/notes.org",
			},
		})
	end,
}
lang["akinsho/org-bullets.nvim"] = {
	lazy = true,
	ft = "org",
	dependencies = { "nvim-orgmode/orgmode" },
	config = function()
		require("org-bullets").setup({
			concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
			symbols = {
				-- list symbol
				list = "•",
				-- headlines can be a list
				headlines = { "◉", "○", "✸", "✿" },
				-- or a function that receives the defaults and returns a list
				checkboxes = {
					half = { "", "OrgTSCheckboxHalfChecked" },
					done = { "✓", "OrgDone" },
					todo = { "˟", "OrgTODO" },
				},
			},
		})
	end,
}
return lang
