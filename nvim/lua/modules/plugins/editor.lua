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
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
		{
			"windwp/nvim-ts-autotag",
			lazy = false, -- not needed for this
			config = require("editor.autotag"),
		},
	},
}
editor["sedm0784/vim-resize-mode"] = {
	enabled = true,
}
editor["X3eRo0/dired.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("dired").setup({
			keybinds = {
				dired_enter = "<cr>",
				dired_back = "-",
				dired_up = "_",
				dired_rename = "R",
				dired_create = "d",
				dired_delete = "D",
				dired_delete_range = "D",
				dired_copy = "C",
				dired_copy_range = "C",
				dired_copy_marked = "MC",
				dired_move = "X",
				dired_move_range = "X",
				dired_move_marked = "MX",
				dired_paste = "P",
				dired_mark = "M",
				dired_mark_range = "M",
				dired_delete_marked = "MD",
				dired_toggle_hidden = ".",
				dired_toggle_sort_order = ",",
				dired_toggle_icons = "*",
				dired_toggle_colors = "c",
				dired_toggle_hide_details = "(",
				dired_quit = "q",
			},
		})
		vim.keymap.set("n", "<leader>d", ":Dired<CR>", { noremap = true, silent = true })
	end,
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
