local key = require("keymap.key")
local nmap = key.nmap

nmap("<leader>D", "<Cmd>DiffviewOpen<CR>", "git: show diff")
nmap("<leader>C", "<Cmd>DiffviewClose<CR>", "git: show diff")
