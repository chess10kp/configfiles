local ui = {}

ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["nvim-lualine/lualine.nvim"] = {
	config = require("modules.configs.ui.lualine"),
}
return ui
