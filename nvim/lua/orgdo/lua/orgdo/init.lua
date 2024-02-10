local popup = require("plenary.popup")

local Win_id

Menu = {}

Menu.__index = Menu 
function Menu:new(opts)
  opts = opts or {}
  setmetatable(opts, self)
  self.__index = self
  return opts 
end

function Menu:showmenu(opts, cb)
  local height = 30
  local width = 30
	local borderchars = {
		"─",
		"│",
		"─",
		"│",
		"╭",
		"╮",
		"╯",
		"╰",
	}

	Menu.Win_id = popup.create(opts, {
		title = "Todo",
		highlight = "Todo",
		line = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor(((vim.o.columns - width) / 2)),
		minwidth = width,
		minheight = height,
		borderchars = borderchars,
		callback = cb,
	})
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", {silent=false})


  function Menu:closeMenu()
    vim.api.nvim_win_close(Menu.Win_id, true)
  end
end


function Menu:setup(opts)
  vim.api.nvim_create_user_command("TodoOpen", Menu.showmenu(self), {})
  vim.api.nvim_create_user_command("TodoClose", Menu.closeMenu(self), {})
  Menu.myMenu()
end

function Menu:MyMenu(opts)
  local opts = opts or { "~/.config/nvim", "~/.config/nvim/lua", }
  local cb = function (_, sel)
    vim.cmd("cd " .. sel)
  end
  Menu.showmenu(opts, cb)
end

return Menu
