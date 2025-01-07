return function()
	local iron = require("iron.core")

	iron.setup({
		config = {
			-- Whether a repl should be discarded or not
			scratch_repl = true,
			-- Your repl definitions come here
			repl_definition = {
				sh = {
					-- Can be a table or a function that
					-- returns a table (see below)
					command = { "zsh" },
				},
				python = {
					command = { "ipython" , "--no-autoindent" }, -- or { "ipython", "--no-autoindent" }
					format = require("iron.fts.common").bracketed_paste_python,
				},
        haskell = {
          command = { "ghci" },
        }
			},
			-- How the repl window will be displayed
			-- See below for more information
			repl_open_cmd = require("iron.view").split.vertical.botright(40),
		},
		-- Iron doesn't set keymaps by default anymore.
		-- You can set them here or manually add keymaps to the functions in iron.core
		keymaps = {
			send_motion = "<leader>sc",
			visual_send = "<leader>sc",
			send_file = "<leader>sf",
			send_line = "<leader>sl",
			send_paragraph = "<leader>sp",
			send_until_cursor = "<leader>su",
			send_mark = "<leader>sm",
			mark_motion = "<leader>mc",
			mark_visual = "<leader>mc",
			remove_mark = "<leader>md",
			cr = "<leader>s<cr>",
			interrupt = "<leader>s<space>",
			exit = "<leader>sq",
			clear = "<leader>cl",
		},
		-- If the highlight is on, you can change how it looks
		-- For the available options, check nvim_set_hl
		highlight = {
			italic = true,
		},
		ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
	})

	-- iron also has a list of commands, see :h iron-commands for all available commands
	vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
	vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
	vim.keymap.set("n", "<space>rs", "<cmd>IronFocus<cr>")
	vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
end
