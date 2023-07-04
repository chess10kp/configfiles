if not vim.g.vscode then
	require("core")
	require("startup")
else
	require("vscode")
end
