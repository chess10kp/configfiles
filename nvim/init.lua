if not vim.g.vscode then
	require("core")
	require("startup")
else
	require("vscode")
end

if vim.g.neovide then
  vim.o.guifont = "Source Code Pro:h14"
  vim.g.neovide_scroll_animation_length = 0.0
end
