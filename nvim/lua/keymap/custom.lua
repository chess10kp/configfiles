local bind = require("keymap.bind")
local map_cr = bind.map_cr

local plug_map = {
	["n|<leader>cd"] = map_cr("cd %:h")
		:with_noremap()
		:with_silent()
		:with_nowait()
		:with_desc("change working directory"),
	["n|<C-m>"] = map_cr("bnext"):with_noremap():with_silent():with_nowait():with_desc("next buffer"),
	["n|<C-n>"] = map_cr("bprevious"):with_noremap():with_silent():with_nowait():with_desc("prev buffer"),
	["n|<leader>bd"] = map_cr("bdelete"):with_noremap():with_silent():with_nowait():with_desc("Delete current buffer"),

	--- Session search
	["n|<leader>fs"] = map_cr("SearchSession"):with_noremap():with_nowait():with_desc("browse sessions"),
	["n|<leader>nn"] = map_cr("source %"):with_noremap():with_nowait():with_desc("source current file"),

	["n|<leader>nn"] = map_cr("source %"):with_noremap():with_nowait():with_desc("source current file"),

	--convienience mappings
	["n|ciw"] = map_cr('"_ciw'):with_noremap():with_nowait():with_desc("change inside brackets "),
	["n|caw"] = map_cr('"_caw'):with_noremap():with_nowait():with_desc("change around brackets "),
}
bind.nvim_load_mapping(plug_map)
