local custom = {}

custom["ibhagwan/fzf-lua"] = {
	enabled = false,
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

custom["glacambre/firenvim"] = {
	lazy = not vim.g.started_by_firenvim,
	build = function()
		vim.fn["firenvim#install"](0)
	end,
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
