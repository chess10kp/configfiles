local custom = {}

custom["lervag/vimtex"] = {
	lazy = true,
	ft = "tex",
}
custom[ "ryoppippi/vim-bad-apple" ] = {
  lazy = false,
  dependencies = {
'vim-denops/denops.vim'
  }
}
custom["kylechui/nvim-surround"] = {
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
		vim.api.nvim_set_keymap("n", "ysb", "ys%", {})
	end,
}
custom["windwp/nvim-autopairs"] = {
  enabled = true,
	lazy = true,
	event = "InsertEnter",
	opts = {},
	config = require("editor.nvim-autopairs"),
}
custom["folke/neodev.nvim"] = {
	lazy = true,
	ft = "lua",
	config = require("lang.neodev"),
}
custom["folke/todo-comments.nvim"] = {
	event = "BufEnter",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()
	end,
}
custom["kawre/leetcode.nvim"] = {
	enabled = true,
	lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
	opts = { arg = "leetcode.nvim" },
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		-- "nvim-tree/nvim-web-devicons",
	},
}

custom["folke/flash.nvim"] = {
	enabled = true,
	event = "VeryLazy",
	lazy = true,
	--@type flash.config
	opts = {
		label = {
			uppercase = false,
			exclude = "qpzx",
			style = "overlay",
			incremental = true,
		},
		highlight = {
			matches = false,
			groups = {
				match = "",
				current = "",
			},
		},
		modes = {
			char = {
				enabled = true,
				-- dynamic configuration for ftFT motions
				config = function(opts)
					-- autohide flash when in operator-pending mode
					opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

					-- disable jump labels when not enabled, when using a count,
					-- or when recording/executing registers
					opts.jump_labels = opts.jump_labels
						and vim.v.count == 0
						and vim.fn.reg_executing() == ""
						and vim.fn.reg_recording() == ""

					-- Show jump labels only in operator-pending mode
					-- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
				end,
				-- hide after jump when not using jump labels
				autohide = false,
				-- show jump labels
				jump_labels = false,
				-- set to `false` to use the current line only
				multi_line = true,
				-- When using jump labels, don't use these keys
				-- This allows using those keys directly after the motion
				label = { exclude = "hjkliardc" },
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				-- If you rather use another key, you can map them
				-- to something else, e.g., { [";"] = "L", [","] = H }
				keys = { "f", "F", "t", "T", ";", "," },
				---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
				-- The direction for `prev` and `next` is determined by the motion.
				-- `left` and `right` are always left and right.
				char_actions = function(motion)
					return {
						[";"] = "next", -- set to `right` to always go right
						[","] = "prev", -- set to `left` to always go left
						-- clever-f style
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
						-- jump2d style: same case goes next, opposite case goes prev
						-- [motion] = "next",
						-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = {
					register = false,
					-- when using jump labels, set to 'true' to automatically jump
					-- or execute a motion when there is only one match
					autojump = false,
				},
			},
		},
		jump = {
			jumplist = true,
			autojump = false,
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "flash",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").treesitter()
			end,
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				local Flash = require("flash")

				local function format(opts)
					return {
						{ opts.match.label1, "FlashMatch" },
						{ opts.match.label2, "FlashLabel" },
					}
				end

				Flash.jump({
					search = { mode = "search" },
					label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
					pattern = [[\<]],
					action = function(match, state)
						state:hide()
						Flash.jump({
							search = { max_length = 0 },
							highlight = { matches = false },
							label = { format = format },
							matcher = function(win)
								-- limit matches to the current label
								return vim.tbl_filter(function(m)
									return m.label == match.label and m.win == win
								end, state.results)
							end,
							labeler = function(matches)
								for _, m in ipairs(matches) do
									m.label = m.label2 -- use the second label
								end
							end,
						})
					end,
					labeler = function(matches, state)
						local labels = state:labels()
						for m, match in ipairs(matches) do
							match.label1 = labels[math.floor((m - 1) / #labels) + 1]
							match.label2 = labels[(m - 1) % #labels + 1]
							match.label = match.label1
						end
					end,
				})
			end,
			desc = "flash",
		},
	},
	-- config = require("editor.flash"),
}

return custom
