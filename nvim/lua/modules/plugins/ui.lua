local ui = {}

ui["folke/tokyonight.nvim"] = {
	lazy = true,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}
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
ui["rcarriga/nvim-notify"] = {
	enabled = false,
	lazy = false,
	event = "VeryLazy",
	config = require("ui.notify"),
}
return ui
