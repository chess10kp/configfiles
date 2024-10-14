local ui = {}

ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["j-hui/fidget.nvim"] = {
	config = require("ui.fidget"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	config = function()
		require("neoscroll").setup({})
	end,
}
return ui
