local editor = {}

-- editor["m4xshen/autoclose.nvim"] = {
-- 	lazy = false,
-- 	event = "InsertEnter",
-- 	config = require("editor.autoclose"),
-- }
editor["rhysd/clever-f.vim"] = {
	enabled = false,
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["numToStr/Comment.nvim"] = {
	config = function()
		require("Comment").setup()
	end,
}
-- editor["folke/trouble.nvim"] = {
-- 	enabled = false,
-- 	lazy = false,
-- 	cmd = { "Trouble", "TroubleToggle" },
-- }
editor["norcalli/nvim-colorizer.lua"] = {
	lazy = false,
	config = function()
		require("colorizer").setup()
	end,
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
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"windwp/nvim-ts-autotag",
			lazy = false, -- not needed for this 
			config = require("editor.autotag"),
		},
		{
			"abecodes/tabout.nvim",
			lazy = true,
			config = require("editor.tabout"),
		},
	},
}
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("editor.cleverf")
	end,
}

return editor
