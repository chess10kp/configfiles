local key = require("keymap.key")
local nmap = key.nmap

nmap("<leader>D", "<Cmd>DiffviewOpen<CR>", "git: show diff")
nmap("<leader>C", "<Cmd>DiffviewClose<CR>", "git: show diff")

-- Plugin: clever-f
-- ["n|;"] = map_callback(function()
-- 	return et("<Plug>(clever-f-repeat-forward)")
-- end):with_expr(),
-- ["n|,"] = map_callback(function()
-- 	return et("<Plug>(clever-f-repeat-back)")
-- end):with_expr(),
