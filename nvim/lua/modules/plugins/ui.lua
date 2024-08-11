local ui = {}

ui["Shatur/neovim-ayu"] = {
	lazy = true,
	name = "ayu",
	config = require("ui.ayu"),
}
ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["lewis6991/gitsigns.nvim"] = {
	enabled = true,
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["j-hui/fidget.nvim"] = {
	config = require("ui.fidget"),
}
ui["neanias/everforest-nvim"] = {
	lazy = true,
}
return ui
