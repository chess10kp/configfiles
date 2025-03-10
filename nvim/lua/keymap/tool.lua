local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local tmap = key.tmap

tmap("<Esc><Esc>", [[<C-\><C-n>]])

nmap("<M-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", "terminal: Toggle vscode-style terminal")
tmap("<M-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", "terminal: Toggle vscode-style terminal")
imap("<M-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", "terminal: Toggle vscode-style terminal")

nmap("<M-g><M-i>", "<Cmd>ToggleTerm direction=float<CR>", "terminal: Toggle floating terminal")
tmap("<M-g>", "<Cmd>ToggleTerm direction=float<CR>", "terminal: Toggle floating terminal")

nmap("<leader>fk", function()
	require("telescope.builtin").keymaps()
end, "find: keymaps")
nmap("<leader>fr", function()
	require("telescope.builtin").lsp_references()
end, "find: lsp_references")
nmap("<leader>fd", "<Cmd>Telescope lsp_document_symbols<CR><BS>", "find: document_symbols")
nmap("<leader>fc", function()
	require("telescope.builtin").lsp_workspace_symbols()
end, "find: lsp_symbols")
nmap("<leader>fn", function()
	require("telescope.builtin").find_files({ cwd = "~/projects/notes" })
end)
nmap("<leader>fa", function()
	require("telescope.builtin").marks()
end, "find: lsp_symbols")
nmap("<leader>fl", function()
	require("telescope.builtin").lsp_outgoing_calls()
end, "find: lsp_outgoing_calls")
nmap("<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, "find: oldfiles")
nmap("<leader>fw", function()
	require("telescope").extensions.live_grep_args.live_grep_args()
end, "find: live-grep")
nmap("<leader>fj", function()
	require("telescope.builtin").find_files()
end, "find: files")
nmap("<leader>fh", function()
	require("telescope.builtin").help_tags()
end, "find: help")
nmap("<leader>fg", function()
	require("telescope.builtin").git_files()
end, "find: git_files")
nmap("<leader>ft", function()
	require("telescope.builtin").tags({ only_sort_tags = true })
end, "find: tags")
nmap("<leader>fb", function()
	require("telescope.builtin").buffers()
end, "find: buffers")
nmap("<leader>ff", function()
	vim.cmd("echo ''")
	local status = vim.o.laststatus
	vim.o.laststatus = 0
	vim.cmd("Telescope file_browser path=./ cwd=/")
	vim.o.laststatus = status
end, "find: file_browser")

nmap("<F6>", function()
	require("dap").continue()
end, "debug: Run/Continue")
nmap("<leader>dc", function()
	require("dap").continue()
end, "debug: Run/Continue")
nmap("<F7>", function()
	require("dap").terminate()
	require("dapui").close()
end, "dap: stop")
nmap("<leader>dtb", function()
	require("dap").toggle_breakpoint()
end, "debug: Toggle breakpoint")
nmap("<F8>", function()
	require("dap").toggle_breakpoint()
end, "debug: Toggle breakpoint")
nmap("<F9>", function()
	require("dap").step_into()
end, "debug: Step into")
nmap("<leader>di", function()
	require("dap").step_into()
end, "debug: Step into")
nmap("<F10>", function()
	require("dap").step_out()
end, "debug: Step out")
nmap("<leader>do", function()
	require("dap").step_out()
end, "debug: Step out")
nmap("<F11>", function()
	require("dap").step_over()
end, "debug: Step over")
nmap("<leader>ds", function()
	require("dap").step_over()
end, "debug: Step over")
nmap("<leader>db", function()
	require("dap").set_breakpoint(vim.fn.input("debug: Set breakpoint with condition"))
end, "find: git_files")
nmap("<leader>dtc", function()
	require("dap").run_to_cursor()
end, "debug: Run to cursor")
nmap("<leader>dl", function()
	require("dap").run_last()
end, "debug: Run last")
nmap("<leader>dop", function()
	require("dap").repl.open()
end, "debug: Open REPL")
nmap("<C-x><C-s>", function()
	require("dap").step_over()
end, "debug: Step over")
nmap("<C-x><C-b>", function()
	require("dap").set_breakpoint(vim.fn.input("debug: Set breakpoint with condition"))
end, "find: git_files")
nmap("<C-x><C-c>", function()
	require("dap").run_to_cursor()
end, "debug: Run to cursor")
nmap("<C-x><C-l>", function()
	require("dap").run_last()
end, "debug: Run last")
nmap("<C-x><C-r>", function()
	require("dap").repl.open()
end, "debug: Open REPL")
nmap("<C-x><C-d>", function()
	require("dap").continue()
end, "debug: Run/Continue")
