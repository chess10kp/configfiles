local editor = {}

-- editor["m4xshen/autoclose.nvim"] = {
-- 	lazy = false,
-- 	event = "InsertEnter",
-- 	config = require("editor.autoclose"),
-- }
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
-- editor["RRethy/vim-illuminate"] = { --illuminates corresponding brackers
-- 	lazy = true,
-- 	event = {"InsertEnter",  "CursorHold", "CursorHoldI" },
-- 	config = require("editor.vim-illuminate"),
-- }
----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["numToStr/Comment.nvim"] = {
	config = function()
		require("Comment").setup()
	end,
}
editor["folke/trouble.nvim"] = {
	enabled = false,
	lazy = false,
	cmd = { "Trouble", "TroubleToggle" },
}
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
		{ "andymass/vim-matchup", enabled = false, ft = { "python", "html" } },
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"windwp/nvim-ts-autotag",
			lazy = true,
			ft = { "typescript, javascript", "html" },
			config = require("editor.autotag"),
		},
		{
			"abecodes/tabout.nvim",
			lazy = true,
			config = require("editor.tabout"),
		},
		{
			"Nvchad/nvim-colorizer.lua",
			lazy = true,
		},
	},
}

return editor
