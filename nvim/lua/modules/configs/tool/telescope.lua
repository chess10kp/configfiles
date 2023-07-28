return function()
	local icons = { ui = require("modules.utils.icons").get("ui", true) }
	local lga_actions = require("telescope-live-grep-args.actions")
	local project_actions = require("telescope._extensions.project.actions")

	require("telescope").setup({
		defaults = {
			initial_mode = "insert",
			prompt_prefix = " " .. icons.ui.Telescope .. " ",
			selection_caret = icons.ui.ChevronRight,
			scroll_strategy = "limit",
			results_title = false,
			layout_strategy = "horizontal",
			path_display = { "absolute" },
			file_ignore_patterns = {
				"Music/",
				"Postman/",
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
			layout_config = {
				horizontal = {
					preview_width = 0.5,
				},
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		},
		pickers = {
			keymaps = {
				theme = "dropdown",
				exclude = {},
			},
			find_files = {
			},
		},
		extensions = {
			fzf = {
				fuzzy = false,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				show_scores = false,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
			},
			live_grep_args = {
				auto_quoting = true, -- enable/disable auto-quoting
				-- define mappings, e.g.
				mappings = { -- extend mappings
					i = {
						["<C-k>"] = lga_actions.quote_prompt(),
						["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					},
				},
			},
			undo = {
				side_by_side = true,
				mappings = { -- this whole table is the default
					i = {
						-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
						-- you want to use the following actions. This means installing as a dependency of
						-- telescope in it's `requirements` and loading this extension from there instead of
						-- having the separate plugin definition as outlined above. See issue #6.
						["<cr>"] = require("telescope-undo.actions").yank_additions,
						["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
						["<C-cr>"] = require("telescope-undo.actions").restore,
					},
				},
			},
			project = {
				base_dirs = {
					{ "~/projects/" },
				},
				hidden_files = true, -- default: false
				theme = "dropdown",
				order_by = "asc",
				search_by = "title",
				sync_with_nvim_tree = true, -- default false
				-- default for on_project_selected = find project files
				on_project_selected = function(prompt_bufnr)
					-- Do anything you want in here. For example:
					project_actions.change_working_directory(prompt_bufnr, false)
				end,
			},
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
				mappings = {
					["i"] = {},
					["n"] = {},
				},
			},
		},
	})

	require("telescope").load_extension("frecency")
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("live_grep_args")
	require("telescope").load_extension("notify")
	require("telescope").load_extension("undo")
	require("telescope").load_extension("zoxide")
	-- require("telescope").load_extension("project")
	require("telescope").load_extension("session-lens")
	require("telescope").load_extension("file_browser")
end
