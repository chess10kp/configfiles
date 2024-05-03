local popup = require("plenary.popup")

local Menu = {}

function Menu:new(opts)
  opts = opts or {}
  setmetatable(opts, self)
  self.__index = self
  return opts 
end

function Menu:showMenu(opts)
  local menuItems = opts.menuItems or {}
  local title = opts.title or "Menu"
  local selectedCallback = opts.selectedCallback or function() end

  local height = #menuItems + 2
  local width = #title + 4

  local borderchars = {
    "─", "│", "─", "│", "┌", "┐", "┘", "└"
  }

  local popup_opts = {
    title = title,
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor(((vim.o.columns - width) / 2)),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
  }

  local bufnr, win_id = popup.create(menuItems, popup_opts)

  local closeMenu = function()
    vim.api.nvim_win_close(win_id, true)
  end

  local selectItem = function(_, selection)
    selectedCallback(selection)
    closeMenu()
  end

  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua require('Menu'):closeMenu()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<CR>", "<cmd>lua require('Menu'):selectItem()<CR>", { noremap = true, silent = true })

  self.win_id = win_id
  self.closeMenu = closeMenu
  self.selectItem = selectItem
end

function Menu:closeMenu()
  self.closeMenu()
end

function Menu:selectItem()
  self.selectItem()
end

return Menu
