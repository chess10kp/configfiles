return function()
	local telescope_actions = require("telescope.actions")
	local opts = {
		theme = "ivy",
		layout_config = {
			preview_width = 0,
			height = 0.3,
			width = 1,
			prompt_position = "bottom",
		},
		border = false,
		mappings = {
			["i"] = {
				-- ["<Tab>"] = telescope_actions.select_default,
				["<Esc>"] = telescope_actions.close,
			},
		},
	}

	-- @param opts table
	-- @param new_opt table
	local function add_opt(opts, new_opt)
		local copy = {}
		for i, x in pairs(opts) do
			copy[i] = x
		end
		for i, x in pairs(new_opt) do
			copy[i] = x
		end
		return copy
	end

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
			color_devicons = false,
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
			find_files = add_opt(opts, { prompt_prefix = "Find: " }),
			git_files = add_opt(opts, { prompt_prefix = "Git: " }),
			lsp_document_symbols = add_opt(opts, {
				prompt_prefix = "Symbol: ",
				layout_config = {
					preview_width = 0,
					height = 0.3,
					width = 1,
				},
			}),
			buffers = add_opt(opts, { prompt_prefix = "Buffers: " }),
			help_tags = add_opt(
				opts,
				{ prompt_prefix = "Help: ", layout_config = { preview_width = 0.7, height = 0.3, width = 1 } }
			),
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			live_grep_args = {
				auto_quoting = true, -- enable/disable auto-quoting
				theme = "ivy",
				layout_config = {
					height = 0.4,
				},
				border = false,
				mappings = {
					["i"] = {
						-- ["<Tab>"] = telescope_actions.select_default,
						["<Esc>"] = telescope_actions.close,
					},
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
					prompt_position = "bottom",
					height = 0.3,
					width = 1,
				},
				border = false,
				hijack_netrw = true,
				mappings = {
					["i"] = {
						["<Tab>"] = telescope_actions.select_default,
					},
					["n"] = {
						["<BS>"] = function() end,
						["<Space>"] = function()
							telescope_actions.toggle_selection()
							telescope_actions.move_selection_next()
						end,
					},
				},
			},
		},
	})

	-- require("telescope").load_extension("live_grep_args")
	-- require("telescope").load_extension("file_browser")
	require("telescope").load_extension("fzf")
end
