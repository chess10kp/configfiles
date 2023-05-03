local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
    ["n|<leader>cd"] = map_cr("cd %:h"):with_noremap():with_silent():with_nowait():with_desc("change working directory"),
    ["n|)"] = map_cr("bNext"):with_noremap():with_silent():with_nowait():with_desc("next Tab"),
    ["n|("] = map_cr("bprevious"):with_noremap():with_silent():with_nowait():with_desc("prev Tab"),
    ["n|;"] = map_cr(":"):with_noremap():with_silent():with_nowait():with_desc("None"),
    ["n|;bd"] = map_cr("bdelete"):with_noremap():with_silent():with_nowait():with_desc("Delete buffer"),
}

bind.nvim_load_mapping(plug_map)
