local editor = {}

editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
editor["norcalli/nvim-colorizer.lua"] = {
	lazy = false,
	config = function()
		vim.cmd("ColorizerToggle")
	end,
}
editor["folke/which-key.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
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
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		{
			"windwp/nvim-ts-autotag",
			lazy = false, -- not needed for this
			config = require("editor.autotag"),
		},
	},
}

return editor
