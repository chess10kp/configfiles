local ui = {}

ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("neoscroll").setup({
			hide_cursor = false,
		})
	end,
}
return ui
