local tool = {}

tool["NeogitOrg/neogit"] = {
	enabled = true,
	lazy = true,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = true,
	keys = {
		{
			"<leader>g",
			mode = { "n" },
			function()
				require("neogit").open()
			end,
			desc = "neogit",
		},
	},
}
tool["mbbill/undotree"] = {
	lazy = false,
}
tool["ibhagwan/smartyank.nvim"] = { -- highlight yanks and yank to clip
	enabled = false,
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-mini/mini.extra"] = {
  enabled = false,
  opts = {},
  version = '*' ,
  config = function()
    require('mini.extra').setup({})

    local nmap = require("keymap.key").nmap
    local extra = require("mini.extra")
		nmap("<leader>fl", function()
      extra.pickers.lsp({scope = "document_symbol"})
		end)

		nmap("<leader>fr", function()
      extra.pickers.lsp({scope = "references"})
		end)

		nmap("<leader>fd", function()
      extra.pickers.lsp({scope = "document_symbol"})
		end)

  end
}
tool["echasnovski/mini.pick"] = {
	enabled = false,
	opts = {},
  dependencies = {
    "nvim-mini/mini.extra",
  },
	config = function()
		local pick = require("mini.pick")
		pick.setup({
      window = {
        width = vim.o.columns
      },
			options = {
				use_cache = true,
				content_from_bottom = true,
			},
		})

		local nmap = require("keymap.key").nmap

		nmap("<leader>ff", function()
			pick.builtin.files()
		end)

		nmap("<leader>fw", function()
			pick.builtin.grep_live()
		end)

		nmap("<leader>fh", function()
			pick.builtin.help()
		end)

		nmap("<leader>fb", function()
			pick.builtin.buffers()
		end)

		nmap("<M-b>", function()
			pick.builtin.buffers()
		end)

		nmap("<M-f>", function()
			pick.builtin.files()
		end)

		nmap("<M-d>", "<Cmd>Pick resume<CR>", "find: list options")

		-- zoxide integration
		nmap("<leader>fz", function()
			pick.start({
				source = {
					name = "Zoxide directories",
					items = function()
						local handle = io.popen("zoxide query -l")
						if not handle then
							return {}
						end
						local dirs = {}
						for line in handle:lines() do
							table.insert(dirs, line)
						end
						handle:close()
						return dirs
					end,
					choose = function(item)
						vim.cmd.cd(item)
						vim.notify("cd " .. item)
					end,
				},
			})
		end)
	end,
}
tool["nvim-telescope/telescope.nvim"] = {
	enabled = false,
	lazy = false,
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", lazy = true },
		{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim" },
	},
}

tool[ "folke/snacks.nvim" ] = {
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = { enabled = true,
      win = {
        -- input window
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          }
        }
      }
    },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "<leader>fl", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- Other
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
}

tool["ibhagwan/fzf-lua"] = {
	enabled = false,
	opts = {},
	config = function()
		require("fzf-lua").register_ui_select()
		require("fzf-lua").setup({
			"ivy",
			winopts = {
				height = 0.85, -- window height
				width = 0.80, -- window width
				row = 0.35, -- window row position (0=top, 1=bottom)
				col = 0.50, -- window col position (0=left, 1=right)
				-- border argument passthrough to nvim_open_win()
				-- border = "none",
				-- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
				backdrop = 100,
				-- title         = "Title",
				-- title_pos     = "center",        -- 'left', 'center' or 'right'
				-- title_flags   = false,           -- uncomment to disable title flags
				fullscreen = false, -- start fullscreen?
				-- enable treesitter highlighting for the main fzf window will only have
				-- effect where grep like results are present, i.e. "file:line:col:text"
				-- due to highlight color collisions will also override `fzf_colors`
				-- set `fzf_colors=false` or `fzf_colors.hl=...` to override
				treesitter = {
					enabled = true,
					-- fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
				},
				preview = {
					-- default     = 'bat',           -- override the default previewer?
					-- default uses the 'builtin' previewer
					border = "rounded", -- preview border: accepts both `nvim_open_win`
					-- and fzf values (e.g. "border-top", "none")
					-- native fzf previewers (bat/cat/git/etc)
					-- can also be set to `fun(winopts, metadata)`
					wrap = false, -- preview line wrap (fzf's 'wrap|nowrap')
					hidden = false, -- start preview hidden
					vertical = "down:45%", -- up|down:size
					horizontal = "right:60%", -- right|left:size
					layout = "flex", -- horizontal|vertical|flex
					flip_columns = 100, -- #cols to switch to horizontal on flex
					-- Only used with the builtin previewer:
					title = false, -- preview border title (file/buf)?
					title_pos = "center", -- left|center|right, title alignment
					scrollbar = "float", -- `false` or string:'float|border'
					-- float:  in-window floating border
					-- border: in-border "block" marker
					scrolloff = -1, -- float scrollbar offset from right
					-- applies only when scrollbar = 'float'
					delay = 20, -- delay(ms) displaying the preview
					-- prevents lag on fast scrolling
					winopts = { -- builtin previewer window options
						number = false,
						relativenumber = false,
						cursorline = false,
						cursorlineopt = "both",
						cursorcolumn = false,
						signcolumn = "no",
						list = false,
						foldenable = false,
						foldmethod = "manual",
					},
				},
			},
		})
		local nmap = require("keymap.key").nmap
		nmap("<leader>ff", function()
			require("fzf-lua").global()
		end)
		nmap("<leader>fl", function()
			require("fzf-lua").lsp_workspace_symbols()
		end)
		nmap("<leader>fd", function()
			require("fzf-lua").diagnostics_document()
		end)
		nmap("<M-d>", "<Cmd>FzfLua<CR>", "find: list options")
		nmap("<M-f>", function()
			require("fzf-lua").global()
		end)
		nmap("<leader>fw", function()
			require("fzf-lua").grep_project()
		end)
		nmap("<leader>fh", function()
			require("fzf-lua").help_tags()
		end)
		nmap("<leader>fb", function()
			require("fzf-lua").buffers()
		end)
		nmap("<M-b>", function()
			require("fzf-lua").buffers()
		end)
		nmap("<leader>fz", function()
			require("fzf-lua").zoxide()
		end)
	end,
}
return tool
