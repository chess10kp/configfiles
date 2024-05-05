local bind = require("keymap.bind")
local map_cr = bind.map_cr

local plug_map = {
	-- Plugin: clever-f
	-- ["n|;"] = map_callback(function()
	-- 	return et("<Plug>(clever-f-repeat-forward)")
	-- end):with_expr(),
	-- ["n|,"] = map_callback(function()
	-- 	return et("<Plug>(clever-f-repeat-back)")
	-- end):with_expr(),

	-- Plugin: diffview
	["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	["n|<leader>"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),
}

bind.nvim_load_mapping(plug_map)
