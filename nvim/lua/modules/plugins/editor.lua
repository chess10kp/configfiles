local editor = {}

editor["rhysd/clever-f.vim"] = {
	enabled = false,
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}
editor["abecodes/tabout.nvim"] = {
	enabled = true,
	config = require("editor.tabout"),
}
editor["jake-stewart/multicursor.nvim"] = {
	enabled = true,
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "x" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<leader><up>", function()
			mc.lineSkipCursor(-1)
		end)
		set({ "n", "x" }, "<leader><down>", function()
			mc.lineSkipCursor(1)
		end)

		-- Add or skip adding a new cursor by matching word/selection
		set({ "n", "x" }, "<leader>mm", function()
			mc.matchAddCursor(1)
		end)
		set({ "n", "x" }, "<leader>ms", function()
			mc.matchSkipCursor(1)
		end)
		set({ "n", "x" }, "<leader>mN", function()
			mc.matchAddCursor(-1)
		end)
		set({ "n", "x" }, "<leader>mS", function()
			mc.matchSkipCursor(-1)
		end)

		-- Add and remove cursors with control + left click.
		set("n", "<c-leftmouse>", mc.handleMouse)
		set("n", "<c-leftdrag>", mc.handleMouseDrag)
		set("n", "<c-leftrelease>", mc.handleMouseRelease)

		-- Disable and enable cursors.
		set({ "n", "x" }, "<c-q>", mc.toggleCursor)

		-- Mappings defined in a keymap layer only apply when there are
		-- multiple cursors. This lets you have overlapping mappings.
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one.
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- Delete the main cursor.
			layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

			-- Enable and clear cursors using escape.
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
editor["ej-shafran/compile-mode.nvim"] = {
	-- you can just use the latest version:
	-- branch = "latest",
	-- or the most up-to-date updates:
	-- branch = "nightly",
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
editor["maskudo/devdocs.nvim"] = {

	lazy = false,
	dependencies = {
		"folke/snacks.nvim",
	},
	cmd = { "DevDocs" },
	keys = {
		{
			"<leader>ho",
			mode = "n",
			"<cmd>DevDocs get<cr>",
			desc = "Get Devdocs",
		},
		{
			"<leader>hi",
			mode = "n",
			"<cmd>DevDocs install<cr>",
			desc = "Install Devdocs",
		},
		{
			"<leader>hv",
			mode = "n",
			function()
				local devdocs = require("devdocs")
				local installedDocs = devdocs.GetInstalledDocs()
				vim.ui.select(installedDocs, {}, function(selected)
					if not selected then
						return
					end
					local docDir = devdocs.GetDocDir(selected)
					-- prettify the filename as you wish
					Snacks.picker.files({ cwd = docDir })
				end)
			end,
			desc = "Get Devdocs",
		},
		{
			"<leader>hd",
			mode = "n",
			"<cmd>DevDocs delete<cr>",
			desc = "Delete Devdoc",
		},
	},
	opts = {
		ensure_installed = {
			"go",
			"html",
			-- "dom",
			"http",
			"css",
			"javascript",
			"rust",
			-- some docs such as lua require version number along with the language name
			-- check `DevDocs install` to view the actual names of the docs
			"lua~5.1",
			-- "openjdk~21"
		},
	},
}

return editor
