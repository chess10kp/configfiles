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

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
	org = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

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
		if not vim.api.nvim_win_is_valid(state.org.win) then
			state.org = create_floating_window({ buf = state.floating.buf })
			vim.cmd("e " .. process_dir .. base_dir .. ".org")
			vim.bo[state.org.buf].filetype = "org"
		else
			vim.api.nvim_win_close(state.org.win, true)
			state.org.win = -1
			state.org.buf = -1
		end
	else
		vim.notify("No project file" .. process_dir .. base_dir .. ".org" .. " found")
	end
end, {})

vim.api.nvim_set_keymap("n", "<leader>op", ":Projectile<CR>", { noremap = true, silent = true })

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})


-- java class creation
local new_java_class = function()
  -- Determine the base src/main/java directory
  local base_dir = vim.fn.finddir("src/main/java", vim.fn.expand("%:p:h") .. ";")
  if base_dir == "" then
    vim.notify("Could not find src/main/java directory", vim.log.levels.ERROR)
    return
  end

  -- Collect all subdirectories inside src/main/java for package selection
  local packages = {}
  local package_dirs = vim.fn.glob(base_dir  .. "/**/*", true, true)
  for _, dir in ipairs(package_dirs) do
    if vim.fn.isdirectory(dir) == 1 then
      local package_name = dir:sub(#base_dir + 2):gsub("/", ".")
      table.insert(packages, package_name)
    end
  end

  if #packages == 0 then
    vim.notify("No packages found in src/main/java", vim.log.levels.WARN)
    return
  end

  -- Prompt the user for the class name
  local class_name = vim.fn.input("Java class name: ")
  if class_name == "" then
    vim.notify("Class name cannot be empty", vim.log.levels.ERROR)
    return
  end

  -- Let the user select the target package
  vim.ui.select(packages, {
    prompt = "Select a package:",
    format_item = function(item)
      return item
    end,
  }, function(selected_package)
    if not selected_package then
      vim.notify("No package selected", vim.log.levels.WARN)
      return
    end

    -- Construct the file path and create the file
    local package_path = selected_package:gsub("%.", "/")
    local file_path = base_dir .. "/" .. package_path .. "/" .. class_name .. ".java"
    vim.fn.mkdir(vim.fn.fnamemodify(file_path, ":h"), "p") -- Create directories if needed
    vim.cmd("edit " .. file_path)

    -- Insert the basic Java class structure
    local content = string.format([[
package %s;

public class %s {

}
]], selected_package, class_name)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
    vim.bo.filetype = "java"
    vim.notify("Created new Java class: " .. file_path, vim.log.levels.INFO)
  end)
end

vim.api.nvim_create_user_command("NewJavaClass", new_java_class, {})

local new_java_package = function()
  -- Determine the base src/main/java directory
  local base_dir = vim.fn.finddir("src/main/java", vim.fn.expand("%:p:h") .. ";")
  if base_dir == "" then
    vim.notify("Could not find src/main/java directory", vim.log.levels.ERROR)
    return
  end

  -- Collect all subdirectories inside src/main/java for package selection
  local packages = {}
  local package_dirs = vim.fn.glob(base_dir  .. "/**/*", true, true)
  for _, dir in ipairs(package_dirs) do
    if vim.fn.isdirectory(dir) == 1 then
      local package_name = dir:sub(#base_dir + 2):gsub("/", ".")
      table.insert(packages, package_name)
    end
  end

  if #packages == 0 then
    vim.notify("No packages found in src/main/java", vim.log.levels.WARN)
    return
  end

  -- Prompt the user for the class name
  local package_name = vim.fn.input("Java package: ")
  if package_name == "" then
    vim.notify("Package name cannot be empty", vim.log.levels.ERROR)
    return
  end

  -- Let the user select the target package
  vim.ui.select(packages, {
    prompt = "Select a package:",
    format_item = function(item)
      return item
    end,
  }, function(selected_package)
    if not selected_package then
      vim.notify("No package selected", vim.log.levels.WARN)
      return
    end

    -- Construct the file path and create directory
    local package_path = selected_package:gsub("%.", "/")
    local file_path = base_dir .. "/" .. package_path .. "/" .. package_name .. "/"
    vim.fn.mkdir(vim.fn.fnamemodify(file_path, ":h"), "p") -- Create directories if needed

      vim.notify("Package " .. package_name .. " created in " .. file_path, vim.log.levels.INFO)
  end)
end

vim.api.nvim_create_user_command("NewJavaPackage", new_java_package, {})
