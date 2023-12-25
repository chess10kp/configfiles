return function()
	local icons = { ui = require("modules.utils.icons").get("ui", true) }
	local lga_actions = require("telescope-live-grep-args.actions")
	local project_actions = require("telescope._extensions.project.actions")
  local fb_actions = require('telescope').extensions.file_browser.actions
  local actions = require('telescope.actions')

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
			prompt_prefix = " " .. icons.ui.Telescope .. " ",
			selection_caret = icons.ui.ChevronRight,
			scroll_strategy = "limit",
			results_title = false,
      border = false, 
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
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			color_devicons = true,
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.85,
				height = 0.92,
				preview_cutoff = 120,
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
        theme = "dropdown", 
        layout_strategy = "horizontal", 
        border = false, 
        layout_config = {
          preview_width = 0 , 
          anchor = "N",
        prompt_position = "bottom", 
        },
			},
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		},
		extensions = {
			fzf = {
				fuzzy = false,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				show_scores = true,
				show_unindexed = false,
				ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/" },
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
			file_browser = {
				theme = "dropdown",
        layout_strategy = "horizontal", 
        border = false, 
        layout_config = {
          preview_width = 0 , 
          anchor = "N",
        prompt_position = "bottom", 
        },
				hijack_netrw = true,
				mappings = {
					["i"] = {
            ["<Tab>" ] = actions.select_default, 
          },
					["n"] = {
            ["<BS>"] = function() end
          },
				},
			},
		},
	})

	require("telescope").load_extension("frecency")
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("live_grep_args")
	-- require("telescope").load_extension("notify")
	-- require("telescope").load_extension("undo")
	-- require("telescope").load_extension("zoxide")
	-- require("telescope").load_extension("project")
	-- require("telescope").load_extension("session-lens")
	require("telescope").load_extension("file_browser")
	-- require("telescope").load_extension("zoxide")
	-- require("telescope").load_extension("persisted")
end
