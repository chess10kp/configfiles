vim.api.nvim_create_user_command("LuaSnipEdit", function()
	vim.cmd([[e ~/.config/nvim/lualoader/all.lua]])
end, {})

vim.api.nvim_create_user_command("Todos", function()
	local grepopts = vim.o.grepprg
	vim.o.grepprg = "rg --hidden --vimgrep --smart-case --glob '!.git' -g '!node_modules/' -g '!venv/' --"
	vim.cmd([[
 silent grep todo:  
 copen
  ]])
	-- reset default options for grep
	vim.o.grepprg = grepopts
end, {})

vim.api.nvim_create_user_command("Projectile", function()
	local current_dir = vim.fn.getcwd()
	local base_dir = current_dir:match("^.+/(.+)$")

  local home = os.getenv("HOME")
	local process_dir = home .. "/projects/notes/org/process/"
	-- check if a file exists
	local file = io.open(process_dir .. base_dir .. ".org", "r")
	if file then
		-- check if buffer is already open with the file
		local bufnr = vim.fn.bufnr(process_dir .. base_dir .. ".org")
		if bufnr ~= -1 then
			return
		end
		vim.cmd("tabnew")
		vim.cmd("e " .. process_dir .. base_dir .. ".org")
    vim.cmd("")
	else
		vim.notify("No project file" .. process_dir .. base_dir .. ".org" .. "found")
	end
end, {})
