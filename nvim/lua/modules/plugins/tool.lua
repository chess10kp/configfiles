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

tool["ibhagwan/fzf-lua"] = {
	enabled = true,
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
				border = "none",
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
					hidden = fasle, -- start preview hidden
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
						number = true,
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
			require("fzf-lua").lsp_document_symbols()
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
