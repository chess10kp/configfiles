if vim.g.started_by_firenvim == true then
else
    if not vim.g.vscode then
        require("core")
    else
        require("vscode")
    end
end
