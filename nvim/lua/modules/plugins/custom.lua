local custom = {}

custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"),
}
custom["rmagatti/session-lens"] = {
	lazy = false,
	enabled = false,
	config = function()
		require("session-lens").setup({})
	end,
}
custom["lervag/vimtex"] = {
	lazy = true,
	ft = "tex",
}
custom["ggandor/leap.nvim"] = {
	lazy = false,
	config = function()
		require("leap").add_default_mappings()
	end,
}
custom["kylechui/nvim-surround"] = {
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
custom["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	opts = {},
	config = require("editor.nvim-autopairs"),
}
custom["folke/neodev.nvim"] = {
	lazy = true,
	ft = "lua",
	config = require("lang.neodev"),
}
custom["kawre/leetcode.nvim"] = {
	lazy = false,
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "python",
	},
}
return custom
