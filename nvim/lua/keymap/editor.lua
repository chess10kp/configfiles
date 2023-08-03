local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
	-- Plugin: auto_session
	-- ["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent():with_desc("session: Save"),
	-- ["n|<leader>sr"] = map_cu("SessionRestore"):with_noremap():with_silent():with_desc("session: Restore"),
	-- ["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent():with_desc("session: Delete"),

	-- Plugin: accelerate-jk
	["n|j"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gj)")
	end):with_expr(),
	["n|k"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gk)")
	end):with_expr(),

	["n|<C-q>"] = map_cr("quit"):with_noremap():with_silent():with_desc("buffer: Close current"),

	-- Plugin: comment.nvim
	["n|gcc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
				or et("<Plug>(comment_toggle_linewise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for line"),
	["n|gbc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_blockwise_current)")
				or et("<Plug>(comment_toggle_blockwise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for block"),
	["n|gc"] = map_cmd("<Plug>(comment_toggle_linewise)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for line with operator"),
	["n|gb"] = map_cmd("<Plug>(comment_toggle_blockwise)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for block with operator"),
	["x|gc"] = map_cmd("<Plug>(comment_toggle_linewise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for line with selection"),
	["x|gb"] = map_cmd("<Plug>(comment_toggle_blockwise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for block with selection"),

	-- Plugin: diffview
	["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),

	-- Plugin: vim-easy-align
	["nx|gea"] = map_cr("EasyAlign"):with_desc("edit: Align with delimiter"),

	-- Plugin: hop
	-- ["nv|s"] = map_cmd("<Cmd>HopWord<CR>"):with_noremap():with_desc("jump: Goto word"),
	-- ["nv|<leader>j"] = map_cmd("<Cmd>HopLine<CR>"):with_noremap():with_desc("jump: Goto line"),

	-- Plugin: treehopper
	["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent():with_desc("jump: Operate across syntax tree"),

	-- Plugin: tabout
}

bind.nvim_load_mapping(plug_map)
