local M = {}

M.cmd_var = "compile_cmd"

-- @param bufnr Int
local function get_cmd(cmd, bufnr)
	if vim.api.nvim_get_var(M.cmd_var) == nil then
		local run_cmd = vim.fn.input({ prompt = "Compile command: ", default = cmd .. " ", cancelreturn = "" })
		if run_cmd == "" then
			return nil
		end
		vim.api.nvim_set_var(M.cmd_var, run_cmd)
	end
	return vim.api.nvim_get_var(M.cmd_var)
end

--
-- @param bufnr Int
--
local function set_cmd()
	local cmd = vim.api.nvim_get_var(M.cmd_var)
	if cmd == nil then
		cmd = ""
	end
	local run_cmd =
		vim.fn.input({ prompt = "Compile command: ", default = cmd, completion = "file", cancelreturn = "" })
	if run_cmd == "" then
		return nil
	end
	vim.api.nvim_set_var(M.cmd_var, run_cmd)
	return vim.api.nvim_get_var(M.cmd_var)
end

--
-- @param cmd String command to run in terminal
--
local function run_in_terminal(cmd)
	local rows = vim.api.nvim_get_option("lines")
	local split_rows = rows * 0.3
	vim.cmd(split_rows .. "split")
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)
	vim.fn.termopen(cmd)

	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)

	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":bwipeout!<CR>", { noremap = true, silent = true })
	vim.api.nvim_create_autocmd("BufLeave", {
		pattern = "<buffer>",
		callback = function()
			vim.api.nvim_buf_delete(buf, { force = true })
		end,
	})
end

-- @param file String name of ft
-- @param cmd String default command
local function make_maps(ft, c)
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = "*." .. ft,
		group = "Runner",
		callback = function(ev)
			vim.api.nvim_create_user_command("Compile", function()
				local cmd = set_cmd()
				if cmd == nil then
					return
				end
				run_in_terminal(cmd)
			end, {})
			vim.keymap.set("n", "<leader>cC", function()
				local cmd = get_cmd()
				if cmd == nil then
					vim.cmd("Compile")
					return
				end
				run_in_terminal(cmd)
			end, {})
			vim.keymap.set("n", "<leader>cc", function()
				vim.cmd("Compile")
			end)
		end,
	})
end

-- @param opts Table
-- @param opts.filetypes Table
-- @param opts.cmd String
-- @param opts.key String
--
M.setup = function(opts)
	vim.api.nvim_set_var(M.cmd_var, nil)
	local filetypes = {
		lua = { "lua", vim.fn.expand("%:p") },
		py = { "python", "-u ", vim.fn.expand("%:p") },
		js = { "npm run " },
		rs = { "cargo run" },
		ts = { "node" },
		cpp = { "make " },
		c = { "make " },
		hs = { "ghc" },
		go = { "go" },
	}
	vim.api.nvim_create_augroup("Runner", {
		clear = true,
	})
	-- nvim_create_autocmd is broken
	for file, cmd in pairs(filetypes) do
		make_maps(file, table.concat(cmd, " "))
	end
end

return M
