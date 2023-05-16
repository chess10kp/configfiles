local bind = require("keymap.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Plugin: bufferline
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap():with_desc("buffer: Sort by extension"),
	--["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap():with_desc("buffer: Sort by direrctory"),
}

bind.nvim_load_mapping(plug_map)
