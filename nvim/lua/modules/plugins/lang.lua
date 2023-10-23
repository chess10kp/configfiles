local lang = {}

lang["fatih/vim-go"] = {
  enabled = false,
	lazy = true,
	ft = "go",
	build = ":GoInstallBinaries",
	config = require("lang.vim-go"),
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
  enabled = false, 
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
  enabled = false, 
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
  enabled = false, 
	lazy = true,
	ft = "csv",
}
lang["pmizio/typescript-tools.nvim"] = {
  lazy = true,
  ft = {"javascript", "typescript", "typescriptreact", "javascriptreact"},
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  config = require("lang.typescript-tools")
}
lang["mrcjkb/haskell-tools.nvim"] = {
  lazy = true,
  ft = {"haskell"},
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = require("lang.haskell-tools"),
  branch = '1.1.0'
  }
return lang

