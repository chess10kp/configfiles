local custom = {}

custom["ibhagwan/fzf-lua"] = {
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({})
	end,
}
custom["elkowar/yuck.vim"] = {
	lazy = true,
}
custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"),
}
-- custom["rmagatti/session-lens"] = {
-- 	lazy = false,
-- 	config = function()
-- 		require("session-lens").setup({})
-- 	end,
-- }
custom["lervag/vimtex"] = {
	lazy = false,
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
	lazy = false,
	event = "InsertEnter",
	opts = {}, -- this is equalent to setup({}) function
	config = require("editor.nvim-autopairs"),
}
custom["folke/neodev.nvim"] = {
	lazy = true,
	ft = "lua",
	config = require("lang.neodev"),
}
return custom
