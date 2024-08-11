return function()
	local telescope_actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			initial_mode = "insert",
			scroll_strategy = "limit",
			results_title = false,
			border = false,
			theme = "ivy",
			file_ignore_patterns = {
				"Music/",
				"Postman/",
				"node_modules/",
				"Games/",
				"Pictures/",
				".npm/",
				"installed_applications/",
				"go/",
				".git/",
				".cache",
				"%.class",
				"%.pdf",
				"%.mkv",
				"%.mp4",
				"%.zip",
			},
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			color_devicons = true,
			layout_config = {
				horizontal = {
					prompt_position = "top",
					mirror = false,
				},
				vertical = {
					mirror = false,
				},
				width = 0.85,
				height = 0.92,
				preview_cutoff = 120,
			},
		},
		pickers = {
			prompt_title = "",
			keymaps = {
				prompt_title = "",
				prompt_position = "bottom",
				prompt_prefix = "Callable: ",
				theme = "ivy",
				exclude = {},
				layout_config = {
					preview_width = 0,
					height = 0.3,
					width = 1,
				},
				border = false,
			},
			find_files = {
				theme = "ivy",
				layout_config = {
					preview_width = 0,
					height = 0.3,
					width = 1,
				},
				border = false,
				prompt_prefix = "Find file: ",
			},
			buffers = {
				theme = "ivy",
				layout_config = {
					preview_width = 0,
					height = 0.1,
					width = 1,
				},
				prompt_position = "bottom",
				border = false,
				prompt_prefix = "Buffer: ",
				mappings = {
					["i"] = {
						-- ["<Tab>"] = telescope_actions.select_default,
						["<Esc>"] = telescope_actions.close,
					},
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				show_scores = false,
				show_unindexed = false,
				ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/" },
			},
			live_grep_args = {
				auto_quoting = true, -- enable/disable auto-quoting
				theme = "ivy",
				layout_config = {
					height = 0.4,
				},
				border = false,
				-- define mappings, e.g.
			},
			-- undo = {
			-- 	side_by_side = true,
			-- 	mappings = { -- this whole table is the default
			-- 		i = {
			-- 			-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
			-- 			-- you want to use the following actions. This means installing as a dependency of
			-- 			-- telescope in it's `requirements` and loading this extension from there instead of
			-- 			-- having the separate plugin definition as outlined above. See issue #6.
			-- 			["<cr>"] = require("telescope-undo.actions").yank_additions,
			-- 			["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
			-- 			["<C-cr>"] = require("telescope-undo.actions").restore,
			-- 		},
			-- 	},
			-- },
			buffers = {
				layout_strategy = "vertical",
				layout_config = {
					preview_width = 0,
				},
			},
			file_browser = {
				theme = "ivy",
				cwd_to_path = false,
				respect_gitignore = false,
				dir_icon = "",
				create_from_prompt = false,
				prompt_path = true,
				hide_parent_dir = true,
				layout_config = {
					preview_width = 0,
					-- prompt_position = "bottom",
					height = 0.3,
					width = 1,
				},
				border = false,
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- ["<Tab>"] = telescope_actions.select_default,
						["/"] = telescope_actions.select_default,
					},
					["n"] = {
						["<BS>"] = function() end,
					},
				},
			},
		},
	})

	-- require("telescope").load_extension("frecency")
	require("telescope").load_extension("fzf")
	-- require("telescope").load_extension("live_grep_args")
	-- require("telescope").load_extension("undo")
	-- require("telescope").load_extension("zoxide")
	-- require("telescope").load_extension("project")
	-- require("telescope").load_extension("session-lens")
	require("telescope").load_extension("file_browser")
end
