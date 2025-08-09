local ui = {}

ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = false,
	event = { "BufReadPost" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = require("modules.configs.ui.lualine"),
}
return ui
