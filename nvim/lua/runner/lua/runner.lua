local M = {}

-- @param cmd String default cmd
-- @param cmd String default cmd
-- @param bufnr Int
local function get_cmd(cmd, bufnr)
	if vim.g.runner_cmd == nil then
		local run_cmd =
			vim.fn.input({ prompt = "Compile command: ", default = cmd .. " ", completion = "file", cancelreturn = "" })
		if run_cmd == "" then
			return nil
		end
		vim.api.nvim_buf_set_var(bufnr, "runner_cmd", run_cmd)
	end
	return vim.api.nvim_buf_get_var(bufnr, "runner_cmd")
end

-- @param bufnr Int
local function get_cmd(cmd, bufnr)
	if vim.g.runner_cmd == nil then
		local run_cmd =
			vim.fn.input({ prompt = "Compile command: ", default = cmd .. " ", completion = "file", cancelreturn = "" })
		if run_cmd == "" then
			return nil
		end
		vim.api.nvim_buf_set_var(bufnr, "runner_cmd", run_cmd)
	end
	return vim.api.nvim_buf_get_var(bufnr, "runner_cmd")
end

--
-- @param bufnr Int
--
local function set_cmd(bufnr)
	local cmd = vim.g.runner_cmd
	if cmd == nil then
		cmd = ""
	end
	local run_cmd =
		vim.fn.input({ prompt = "Compile command: ", default = cmd, completion = "file", cancelreturn = "" })
	if run_cmd == "" then
		return nil
	end
	vim.api.nvim_buf_set_var(bufnr, "runner_cmd", run_cmd)
	return vim.api.nvim_buf_get_var(bufnr, "runner_cmd")
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

	-- local width = vim.api.nvim_get_option("columns")
	-- local height = vim.api.nvim_get_option("lines")
	-- local win_width = 50
	-- local win_height = 10
	-- local win_opts = {
	-- 	relative = "editor",
	-- 	width = win_width,
	-- 	height = win_height,
	-- 	row = math.ceil((height - win_height) / 2),
	-- 	col = math.ceil((width - win_width) / 2),
	-- }
end

-- @param file String name of ft
-- @param cmd String default command
local function make_maps(ft, c)
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = "*." .. ft,
		group = "Runner",
		callback = function(ev)
			local bufnr = ev.buf
			vim.api.nvim_buf_create_user_command(bufnr, "RunnerRun", function()
				set_cmd(bufnr)
				local cmd = get_cmd(c, bufnr)
				if cmd == nil then
					return
				end
				run_in_terminal(cmd)
			end, {})
			vim.keymap.set("n", "<leader>cc", function()
				local cmd = set_cmd(bufnr)
				if cmd == nil then
					return
				end
				run_in_terminal(cmd)
			end, { buffer = true })
		end,
	})
end

-- @param opts Table
-- @param opts.filetypes Table
-- @param opts.cmd String
-- @param opts.key String
--
M.setup = function(opts)
	vim.g.runner_cmd = nil
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
