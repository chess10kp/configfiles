return function()
	local lint = require("lint")

	lint.linters_by_ft = {
		python = { "ruff" },
    lua = { "luacheck" },
	}

  vim.api.nvim_create_user_command("LintStop", function ()
    vim.api.nvim_create_augroup("lint", { clear = true })
  end, {})

	vim.api.nvim_create_user_command("Lint", function()
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = false })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end, {})
end
