local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local tmap = key.tmap

tmap("<Esc><Esc>", [[<C-\><C-n>]])

nmap("<leader>ff", function()
	require("fzf-lua").global()
end)

nmap("<M-d>", "<Cmd>FzfLua<CR>", "find: list options")

nmap("<M-f>", function()
	require("fzf-lua").global()
end)

nmap("<leader>fw", function()
	require("fzf-lua").grep_project()
end)

nmap("<leader>fb", function()
	require("fzf-lua").buffers()
end)

nmap("<M-b>", function()
	require("fzf-lua").buffers()
end)

nmap("<leader>fz", function()
	require("fzf-lua").zoxide()
end)
