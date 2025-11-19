local editor = {}

editor["lukas-reineke/indent-blankline.nvim"] = {
  enabled = false,
	lazy = true,
	event = "VeryLazy",
  config = function()
    require("ibl").setup()
  end,
	opts = {
		show_current_context = true,
		show_current_context_start = true,
		show_end_of_line = true,
		char = "┊",
		context_char = "┆",
		show_first_indent_level = true,
		space_char_blankline = " ",
		use_treesitter = true,
		show_trailing_blankline_indent = false,
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
