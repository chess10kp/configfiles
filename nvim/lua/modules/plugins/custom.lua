local custom = {}

custom["lervag/vimtex"] = {
	lazy = true,
	ft = "tex",
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
	enabled = true,
	lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
	opts = { arg = "leetcode.nvim"},
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
}

custom["ggandor/leap.nvim"] = {
	enabled = false,
	lazy = false,
	name = "leap",
	config = require("custom.leap"),
}

custom["folke/flash.nvim"] = {
	enabled = true,
	event = "VeryLazy",
	lazy = true,
	--@type Flash.Config
	opts = {
		modes = {
			char = {
				enabled = false,
				keys = {},
			},
		},
		jump = {
			autojump = true,
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash",
		},
	},
}

custom["choltz/ido.nvim"] = {
	lazy = false,
}

return custom
