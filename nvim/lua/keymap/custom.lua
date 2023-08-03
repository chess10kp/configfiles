local bind = require("keymap.bind")
local map_cr = bind.map_cr
---@diagnostic disable-next-line: unused-local
local map_cmd = bind.map_cmd
local map_cu = bind.map_cu

local plug_map = {
	["n|<leader>ss"] = map_cr("mks!"),
	["n|<leader>cd"] = map_cr("cd %:h | lua print('directory changed')")
		:with_noremap()
		:with_silent()
		:with_nowait()
		:with_desc("change working directory"),
	["n|<M-j>"] = map_cr("bnext"):with_noremap():with_silent():with_nowait():with_desc("next buffer"),
	["n|<M-k>"] = map_cr("bprevious"):with_noremap():with_silent():with_nowait():with_desc("prev buffer"),

	["n|<leader>w"] = map_cu("write"):with_noremap():with_silent():with_desc("editn: Save file"),
	["n|<leader>q"] = map_cu("BufDel"):with_noremap():with_silent():with_desc("editn: Quit file"),
	--- Session search
	-- ["n|<leader>fs"] = map_cr("SearchSession"):with_noremap():with_nowait():with_desc("browse sessions"),

	["n|<leader>nn"] = map_cr("source %"):with_noremap():with_nowait():with_desc("source current file"),
	["n|<leader>no"] = map_cr("noh"):with_noremap():with_nowait():with_desc("nothing"),

	--Formatting
	["n|<leader>ff"] = map_cr("lua vim.lsp.buf.format()")
		:with_noremap()
		:with_nowait()
		:with_desc("format the current file"),

	--convienience mappings
	["n|ciw"] = map_cmd('"_ciw'):with_noremap():with_desc("delete inside word"),
	["n|caw"] = map_cmd('"_caw'):with_noremap():with_desc("delete around word"),
	["n|ci("] = map_cmd('"_ci('):with_noremap():with_desc("delete inside parenthesis"),
	["n|ca("] = map_cmd('"_ca('):with_noremap():with_desc("delete around parenthesis"),
	["n|ci)"] = map_cmd('"_ci('):with_noremap():with_desc("delete inside parenthesis"),
	["n|ca)"] = map_cmd('"_ca('):with_noremap():with_desc("delete around parenthesis"),
	["n|ci{"] = map_cmd('"_ci{'):with_noremap():with_desc("delete inside braces"),
	["n|ca{"] = map_cmd('"_ca{'):with_noremap():with_desc("delete around braces"),
	["n|ci}"] = map_cmd('"_ci}'):with_noremap():with_desc("delete inside braces"),
	["n|ca}"] = map_cmd('"_ca}'):with_noremap():with_desc("delete around braces"),
}
bind.nvim_load_mapping(plug_map)
