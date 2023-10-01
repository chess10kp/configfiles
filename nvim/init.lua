if vim.g.started_by_firenvim then
	require("core")
	vim.cmd("colorscheme onedark")
elseif not vim.g.vscode then
	require("core")
end

if vim.g.neovide then 
  vim.opt.guifont = "Iosevka Nerd Font Mono:h14"
  vim.opt.linespace = 3
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_hide_mouse_while_typing = true
  vim.g.neovide_cursor_animation_length = 0.01
  vim.g.neovide_cursor_animate_command_line = false
end

