local editor = {}

editor["ej-shafran/compile-mode.nvim"] = {
	-- you can just use the latest version:
	-- branch = "latest",
	-- or the most up-to-date updates:
	-- branch = "nightly",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- if you want to enable coloring of ANSI escape codes in
		-- compilation output, add:
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			-- to add ANSI escape code support, add:
			baleia_setup = true,
		}
	end,
	keys = {
		{ "<leader>cC", "<cmd>Compile<cr>", desc = "compile" },
		{ "<leader>cc", "<cmd>Recompile<cr>", desc = "recompile" },
	},
}
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
editor["craigemery/vim-autotag"] = {
	enabled = true,
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
