local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- Plugin: toggleterm
	["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.


	["n|<A-h>"] = map_cmd([[<Cmd>ToggleTerm direction=horizontal<CR>i]]),
	["i|<A-h>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>i")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vscode style terminal"),
	["t|<A-h>"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),

	["n|<A-d>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<A-d>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),

	-- Plugin: telescope
	["n|<leader>fk"] = map_callback(function()
			require("telescope.builtin").keymaps()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: show keymaps"),
	["n|<leader>fr"] = map_cu("Telescope lsp_references"),
	["n|<leader>fd"] = map_cu("Telescope lsp_document_symbols"),
	["n|<leader>fl"] = map_cu("Telescope lsp_dynamic_workspace_symbols "),
  ["n|<leader>fs"] = map_callback(function ()
    require("telescope.builtin").grep_string({search = vim.fn.input("find string: ")})
  end),
	["n|<leader>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<leader>fj"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
	["n|<leader>fh"] = map_cu("Telescope help_tags"):with_noremap():with_silent():with_desc("find: Help"),
	["n|<leader>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
  ["n|<leader>ft"] = map_cu("Telescope current_buffer_tags")
    :with_noremap()
    :with_silent()
    :with_desc("find: tags"),
	["n|<leader>fb"] = map_cu("Telescope buffers")
		:with_noremap()
		:with_silent()
		:with_desc("find: Buffer opened"),
	["n|<leader>fi"] = map_cu("Telescope file_browser ")
		:with_noremap()
		:with_silent()
		:with_desc("find: open file browser"),
	-- Plugin: telescope
	["n|<CR>fk"] = map_callback(function()
			require("telescope.builtin").keymaps()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: show keymaps"),
	["n|<CR>fr"] = map_cu("Telescope lsp_references"),
	["n|<CR>fd"] = map_cu("Telescope lsp_document_symbols"),
	["n|<CR>fl"] = map_cu("Telescope lsp_dynamic_workspace_symbols "),
  ["n|<CR>fs"] = map_callback(function ()
    require("telescope.builtin").grep_string({search = vim.fn.input("find string: ")})
  end),
	["n|<CR>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<CR>fj"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
	["n|<CR>fh"] = map_cu("Telescope help_tags"):with_noremap():with_silent():with_desc("find: Help"),
	["n|<CR>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
  ["n|<CR>ft"] = map_cu("Telescope current_buffer_tags")
    :with_noremap()
    :with_silent()
    :with_desc("find: tags"),
	["n|<CR>fb"] = map_cu("Telescope buffers")
		:with_noremap()
		:with_silent()
		:with_desc("find: Buffer opened"),
	["n|<CR>fi"] = map_cu("Telescope file_browser ")
		:with_noremap()
		:with_silent()
		:with_desc("find: open file browser"),


	-- Plugin: dap
	["n|<F6>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<leader>dc"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<F7>"] = map_callback(function()
			require("dap").terminate()
			require("dapui").close()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<leader>dtb"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F8>"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F9>"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<leader>di"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<F10>"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<leader>do"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F11>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>ds"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>db"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Set breakpoint with condition"),
	["n|<leader>dtc"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run to cursor"),
	["n|<leader>dl"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run last"),
	["n|<leader>dop"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Open REPL"),

	["n|<C-x><C-s>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<C-x><C-b>"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Set breakpoint with condition"),
	["n|<C-x><C-c>"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run to cursor"),
	["n|<C-x><C-l>"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run last"),
	["n|<C-x><C-r>"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Open REPL"),
	["n|<C-x><C-d>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
}

bind.nvim_load_mapping(plug_map)
