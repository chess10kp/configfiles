if vim.g.started_by_firenvim then 
  require("core")
  vim.cmd"colorscheme onedark"
elseif not vim.g.vscode then
	require("core")
end


