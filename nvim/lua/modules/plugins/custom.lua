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
custom["folke/flash.nvim"] = {
  enabled = false,
  event = "VeryLazy", 
  lazy = true, 
  keys = {
  {"s", mode = {"n" , "x", "o"}, function() require("flash").jump() end, desc="Flash" },
  {"S", mode = {"n" , "x", "o"}, function() require("flash").treesitter() end, desc="Flash" },
  }
}


custom["dstein64/vim-startuptime"] = {
  lazy = true,
  cmd = "StartupTime",
}

return custom
