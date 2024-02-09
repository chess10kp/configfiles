local editor = {}

editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}
editor["m4xshen/autoclose.nvim"] = {
	lazy = false,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}
editor["max397574/better-escape.nvim"] = {
	lazy = false,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}
editor["LunarVim/bigfile.nvim"] = {
	lazy = true,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
editor["RRethy/vim-illuminate"] = { --illuminates corresponding brackers
	lazy = true,
	event = {"InsertEnter",  "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}
----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "mrjones2014/nvim-ts-rainbow", 
    enabed = false, 
    lazy = true },
		{ "JoosepAlviste/nvim-ts-context-commentstring" ,
    enabled = true, 
    lazy = true,
    ft = "typescript, javascript",
    },
		{ "mfussenegger/nvim-treehopper" },
		{ "andymass/vim-matchup" ,
      enabled = false, 
      ft = {"python", "html"},
    },
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"windwp/nvim-ts-autotag",
      lazy = true, 
      ft = {"typescript, javascript", "html"},
			config = require("editor.autotag"),
		},
		{
			"NvChad/nvim-colorizer.lua",
      lazy = true, 
			config = require("editor.colorizer"),
		},
		{
			"abecodes/tabout.nvim",
      lazy = true,
			config = require("editor.tabout"),
		},
	},
}

return editor
