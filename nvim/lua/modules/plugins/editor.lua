local editor = {}

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
editor["norcalli/nvim-colorizer.lua"] = {
	lazy = false,
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
editor["sedm0784/vim-resize-mode"] = {
	enabled = true,
}
editor["luckasRanarison/nvim-devdocs"] = {
	enabled = true,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-devdocs").setup()
	end,
}

return editor
