local ui = {}

ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	event = { "BufReadPost" },
	config = require("ui.gruvbox"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = function()
		require("neoscroll").setup({
			hide_cursor = false,
		})
	end,
}
ui["miikanissi/modus-themes.nvim"] = {
	lazy = false,
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = false,
	event = { "BufReadPost" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = require("modules.configs.ui.lualine"),
}
return ui
